ActionController::Routing::Routes.draw do |map|
  map.root :controller => "sessions", :action => 'new'
  map.login '/login',:controller => 'sessions',:action => 'new'
  map.resources :activity_notes

  map.resources :home
  map.resources :sessions
  map.resources :developpers
  map.resources :vacations
  map.resources :archives
end
