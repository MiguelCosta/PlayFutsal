PlayFutsal::Engine.routes.draw do

  resources :athletes do
    member do
      delete 'remove_from_team'
    end
  end

  resources :matches do
    resources :events
  end
  
	resources :teams

  root :to => 'teams#index'

  #match '/matches/:id/events/new' => 'matches#add_event', :as => :new_match_event
	
end
