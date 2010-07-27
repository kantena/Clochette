# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.join(File.dirname(__FILE__),'..','config','environment'))
require 'rubygems'
require 'spec/autorun'
require 'spec/rails'
require 'spec/test/unit'
require 'mocha'
require 'shoulda'
require 'factory_girl'
require 'factories'
require 'webrat'
require 'webrat/core/matchers'
require 'webrat/core/scope'


Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Webrat.configure do |config|
  config.mode = :rails
end

Spec::Runner.configure do |config|

  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  include Webrat::Methods
end
