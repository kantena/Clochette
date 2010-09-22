#!/usr/bin/ruby

require 'rubygems'
require 'gdata4ruby'
include GData4Ruby

@service = Service.new
@username = nil
@password = nil

def tester
  if ARGV.include?("-d")
      @service.debug = true
  end
  ARGV.each do |ar|
    if ar.match("username=")
      @username = ar.gsub("username=", "")
    end
    if ar.match("password=")
      @password = ar.gsub("password=", "")
    end
  end
  service_test
end

def service_test
  puts "---Starting Service Test---"
  puts "1. Authenticate"
  if @service.authenticate(@username, @password, 'cl')
    successful
  else
    failed
  end
  
  puts "2. Authenticate with GData version 3.0"
  @service = Service.new({:gdata_version => '3.0'})
  if @service.authenticate(@username, @password, 'cl') and @service.gdata_version == '3.0'
    successful
  else
    failed
  end
end

def failed(m = nil)
  puts "Test Failed"
  puts m if m
  exit()
end

def successful(m = nil)
  puts "Test Successful"
  puts m if m
end

tester