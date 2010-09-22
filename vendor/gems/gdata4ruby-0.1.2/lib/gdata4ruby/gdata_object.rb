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

require 'gdata4ruby/service'
require 'time'

module GData4Ruby
  #The GDataObject class represents any <entry> object returned by a Google Service.  Includes
  #attributes for accessing the common elements/parameters of the object, and methods for CRUD
  #operations.
  class GDataObject    
    #A Service object
    attr_accessor :service
    
    #The entry title.
    attr_accessor :title
    
    #The raw date the document was published
    attr_reader :published
    
    #The raw date the document was last updated
    attr_reader :updated
    
    #The author/owner name
    attr_reader :author_name
    
    #The author/owner email
    attr_reader :author_email
    
    #The current instance etag for the entry
    attr_reader :etag
    
    #The parent URI, if any
    attr_reader :parent_uri

    #The edit URI, for making changes to the entry
    attr_reader :edit_uri
    
    #A hash of additional feedLinks
    attr_reader :feed_links
    
    #The unique entry id, as represented by the <gd:resourceId> tag.  Not to be confused
    #with the Atom <id> tag, which is accessible as the feed_uri attribute.
    attr_reader :id
    
    #The entry's feed uri, otherwise known as the Atom <id> element value.
    attr_reader :feed_uri
    
    #A hash of categories
    attr_reader :categories
    
    #The feedLink that represents the entry's ACL feed.
    attr_reader :acl_uri
    
    #The content uri for exporting the object content
    attr_reader :content_uri
    
    #The kind (type) of the object
    attr_reader :kind
    
    #Indicates whether the object exists on the Google servers, i.e. has been created/saved.
    def exists?
      return @exists
    end
    
    #Initializes a new GDataObject.  You must pass a valid Service object, and can pass
    #an optional array of attributes to initialize values.  To load data into an object,
    #use the load method.
    def initialize(service, attributes = {})
      @xml ||= ''
      @service ||= service
      @exists = false
      @title = @content_uri = @etag = @acl_uri = @edit_uri = @parent_uri = @feed_uri = @kind = nil
      @categories = @feed_links = []
      @include_etag = true
      attributes.each do |key, value|
        self.send("#{key}=", value)
      end
    end
    
    public
    #Loads data into the object.  Accepts a string containing an XML <entry> from a GData
    #compliant feed.
    def load(string)
      @exists = @include_etag = true
      @xml = string
      xml = REXML::Document.new(string)
      xml.root.elements.each(){}.map do |ele|
        @etag = xml.root.attributes['etag'] if xml.root.attributes['etag']
        case ele.name
          when "id"
            puts 'setting id' if service.debug
            @feed_uri = ele.text
          when 'content'
            @content_uri = ele.attributes['src'] if ele.attributes['src']
          when 'resourceId'
            @id = ele.text
          when 'title'
            @title = ele.text
          when 'category'
            @categories << {:label => ele.attributes['label'], 
                            :scheme => ele.attributes['scheme'],
                            :term => ele.attributes['term']}
            if ele.attributes['scheme'] and ele.attributes['scheme'] == 'http://schemas.google.com/g/2005#kind'
              @kind = if ele.attributes['label'] 
                ele.attributes['label'] 
              else
                ele.attributes['term']
              end
            end
          when 'link'
            case ele.attributes['rel']
              when 'http://schemas.google.com/docs/2007#parent'
                @parent_uri = ele.attributes['href']
              when 'edit'
                @edit_uri = ele.attributes['href']
              when 'http://schemas.google.com/acl/2007#accessControlList'
                @acl_uri = ele.attributes['href'] if not @acl_uri
            end
          when 'feedLink'
            @feed_links << {:rel => ele.attributes['rel'], :href => ele.attributes['href']}
            @acl_uri = ele.attributes['href'] if ele.attributes['rel'].include? 'accessControlList' and not @acl_uri
          when 'author'
            ele.elements.each('name'){}.map {|e| @author_name = e.text}
            ele.elements.each('email'){}.map {|e| @author_email = e.text}
          when 'published'
            @published = Time.parse(ele.text)
          when 'updated'
            @updated = Time.parse(ele.text)
        end
      end
      return xml.root
    end
    
    #Saves the object if it exsits, otherwise creates it.
    def save
      if @exists
        ret = service.send_request(Request.new(:put, @edit_uri, to_xml))
      else
        ret = create
      end
      if not ret or not load(ret.read_body)
        raise SaveFailed, 'Could not save object'
      end
      return true
    end
    
    #Creates the object.  This must be overridden in a subclass, as the feed url for creating new
    #objects/entries is service dependent.  In other words, each google service uses a different 
    #URI for saving new objects.
    def create
      return false
    end
    
    #Deletes the object.
    def delete
      if @exists
        service.send_request(Request.new(:delete, @edit_uri, nil, {"If-Match" => "*"}))
      end
      @exists = false
      return true
    end
    
    #Creates a new string containing the XML representation of the object as a GData compliant <entry>
    #element.
    def to_xml
      xml = REXML::Document.new(@xml)
      xml.root.elements.each(){}.map do |ele|
        if @include_etag
          xml.root.attributes['gd:etag'] = @etag if @etag and @etag != ''
        else
          xml.root.delete_attribute('gd:etag')
        end
        case ele.name
        when "title"
          ele.text = @title
        end
      end
      xml.to_s
    end
  end
end