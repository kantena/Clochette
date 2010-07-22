ActionController::Routing::Routes.draw do |map|
  map.root :controller => "root"
  map.resources :activity_notes
end
