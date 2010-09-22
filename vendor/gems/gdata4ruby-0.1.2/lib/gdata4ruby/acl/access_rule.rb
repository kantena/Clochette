# Author:: Mike Reich (mike@seabourneconsulting.com)
# Copyright:: Copyright (C) 2010 Mike Reich
# License:: GPL v2
#--
# Licensed under the General Public License (GPL), Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#
# Feel free to use and update, but be sure to contribute your
# code back to the project and attribute as required by the license.
#++
require 'gdata4ruby/gdata_object'

module GData4Ruby
  
  #Contains classes for interacting with Google ACL feeds
  module ACL
    
    #Represents an individual access rule entry in a Google ACL feed.
    class AccessRule < GDataObject
      XML = "<entry xmlns='http://www.w3.org/2005/Atom' xmlns:gAcl='http://schemas.google.com/acl/2007'>
  <category scheme='http://schemas.google.com/g/2005#kind'     
    term='http://schemas.google.com/acl/2007#accessRule'/>
  <gAcl:role value=''/>
  <gAcl:scope type='user' value=''/>
</entry>"

      #The Rule's user
      attr_accessor :user
      
      #The user's role
      attr_accessor :role
      
      #The parent GDataObject the rule applies to
      attr_accessor :parent
      
      #Creates a new AccessRule object.  You must pass a valid Service and GDataObject, and can pass an optional hash
      #of attributes to initialize the object with.
      def initialize(service, parent, attributes = {})
        super(service, attributes)
        @xml = XML
        raise ArgumentError, 'parent must be a GData4Ruby::GDataObject' if not parent.is_a? GData4Ruby::GDataObject
        @parent = parent
        @role = @user = nil
      end
      
      #Creates the AccessRule using the parent's acl_uri attribute.
      def create
        ret = service.send_request(Request.new(:post, @parent.acl_uri, to_xml))
        if not ret or not load(ret.read_body)
          raise SaveFailed, 'Could not create access rule'
        end
        return ret
      end
      
      #Loads data into the object.  Accepts a string containing an XML <entry> object.
      def load(string)
        super(string)
        @folders = []
        xml = REXML::Document.new(string)
        xml.root.elements.each(){}.map do |ele|
          case ele.name
            when 'role'
              @role = ele.attributes['value']
            when 'scope'
              @user = ele.attributes['value'] ? ele.attributes['value'] : ele.attributes['type']
          end
        end
      end
      
      #Deletes the AccessRule
      def delete
        if @exists
          @role = 'none'
          service.send_request(Request.new(:put, @edit_uri, self.to_xml, {"If-Match" => "*", 'Content-Type' => 'application/atom+xml'}))
        end
        @exists = false
        return true
      end
      
      #Finds an AccessRule based on the args passed.  
      #
      #Args can be a hash containing either:
      #*user*:: an email address/user id to search for.  If found, returns the matching AccessRule object.
      #*role*:: the role to search for.  Returns an array of matching AccessRules, or an empty array if no matches are found.
      def self.find(service, parent, args = {})
        raise ArgumentError, 'Must supply a username or role to find by' if not args[:user] and not args[:role]
        rules = []
        ret = service.send_request(GData4Ruby::Request.new(:get, parent.acl_uri))
        xml = REXML::Document.new(ret.read_body).root
        xml.elements.each("entry") do |e|
          e = GData4Ruby::Utils::add_namespaces(e)
          rule = AccessRule.new(service, parent)
          rule.load(e.to_s)
          return rule if args[:user] and rule.user == args[:user]
          rules << rule if args[:role] and rule.role == args[:role]
        end
        return args[:user] ? false : rules
      end
      
      #Returns a string containing the XML representation of the AccessRule
      def to_xml
        xml = REXML::Document.new(super)
        xml.root.elements.each(){}.map do |ele|
          case ele.name
          when "role"
            ele.attributes['value'] = @role           
          when 'scope'
            if @user and @user != 'default'
              ele.attributes['value'] = @user 
            else
              ele.attributes['type'] = 'default'
              ele.delete_attribute("value")
            end
          end
        end
        xml.to_s
      end
    end
  end
end