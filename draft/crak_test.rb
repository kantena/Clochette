require 'crak'
require 'test/unit'
require 'rack/test'

set :environment, :test

class CrakTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index_contains_current_month_in_letter_and_year
    get '/'
    assert last_response.ok?
    letter_month = [nil, 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
    assert last_response.body.include?(%Q{id="current-month">#{letter_month[Date.today.month]} #{Date.today.year}})
  end

  def test_should_show_user_detail_for_current_month
    get 'yaf'
    assert last_response.ok?
  end

  def test_user_detail_for_current_month_contains_current_month_in_letter_and_year
    get 'yaf'
    assert last_response.ok?
    letter_month = [nil, 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
    assert last_response.body.include?(%Q{id="current-month">Yaf: #{letter_month[Date.today.month]} #{Date.today.year}})
  end


  def test_user_detail_for_current_month_contains_user_name
    get 'yaf'
    assert last_response.ok?
    assert last_response.body.include?('Yaf')
  end

  def test_should_show_client_view_for_current_month
    get '/clients/vinci'
    assert last_response.ok?
  end

  def test_client_page_should_contain_client_name
    get '/clients/vinci'
    assert last_response.ok?
    assert last_response.body.include?('Vinci')
  end
end
