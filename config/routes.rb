ActionController::Routing::Routes.draw do |map|
  map.resource :meteo, :member => { :lookup => :any }
  map.root :controller => 'meteos', :action => 'index'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
