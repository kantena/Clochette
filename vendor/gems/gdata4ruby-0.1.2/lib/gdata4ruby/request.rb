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
require "uri"

module GData4Ruby
  #The Request class holds all information needed to make a Request to a Google service.
  class Request
    #The HTTP request type, must be one of :get, :post, :put, :delete
    attr_accessor :type
    
    #The HTTP request content, only valid for :put and :post requests
    attr_accessor :content
    
    #Optional.  Additional headers to pass with the request.
    attr_accessor :headers
    
    #Optional.  Additional query parameters (i.e. "?param=value") to append to the request url
    attr_reader :parameters
    
    #Creates a new request object.
    def initialize(type, url, content = nil, headers = nil, query_parameters = nil)
      @parameters = nil
      @headers = headers
      @content = content
      @type = type
      @url = URI.parse(url)
      self.parameters = query_parameters
    end
    
    #The HTTP url to send the request to
    def url=(new_url)
      @url = new_url
    end
    
    #A hash of additional query parameters (i.e. {'param' => 'value') to append to the request url
    def parameters=(query_parameters) 
      raise ArgumentError, 'Query parameters must be a Hash' if query_parameters != nil and not query_parameters.is_a? Hash
      @parameters = query_parameters.is_a?(Hash) ? "?#{query_parameters.to_a.collect{|a| a.join("=")}.join("&")}" : nil
    end
    
    #The HTTP url to send the request to
    def url
      return URI.parse("#{@url+(@parameters ? @parameters : '')}")
    end
  end
end