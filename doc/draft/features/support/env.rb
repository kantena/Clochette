# encoding: utf-8
app_file = File.join(File.dirname(__FILE__), *%w[.. .. crak.rb])
require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

require 'spec/expectations'
require 'rack/test'
require 'webrat'

Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
  def path_to page
    '/'
  end
end

World{MyWorld.new}


__END__






require 'spec/expectations'
require 'cucumber/formatter/unicode'
require 'webrat'
$:.unshift(File.dirname(__FILE__) + '../crak')

Webrat.configure do |config|
  config.mode = :sinatra
end

World do
  Webrat::SinatraSession.new
end

