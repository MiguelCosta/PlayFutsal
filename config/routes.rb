PlayFutsal::Engine.routes.draw do

  resources :athletes
	resources :teams
  resources :matches

  root :to => 'teams#index'

  match '/matches/:id/events/new' => 'matches#add_event', :as => :new_match_event
	
end
