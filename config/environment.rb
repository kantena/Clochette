RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.gem "mocha", :version => "0.9.8"
  config.gem "shoulda", :version => "2.11.1"
  config.gem "gcal4ruby", :version => "0.5.4"
  config.gem "sqlite3", :version => "0.1.1"
  config.gem "rack", :version => "1.1.0"
  config.gem "factory_girl", :version => "1.3.1"
  config.i18n.default_locale = :fr
 
end
