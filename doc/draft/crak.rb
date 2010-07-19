require 'rubygems'
require 'sinatra'

get '/' do
  letter_month = [nil, 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
  @current_month = letter_month[Date.today.month]
  @current_year = Date.today.year
  erb :index
end

get '/yaf' do
  letter_month = [nil, 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre']
  @current_month = letter_month[Date.today.month]
  @current_year = Date.today.year
  erb :user
end

get '/clients/:name' do
  erb :client
end
