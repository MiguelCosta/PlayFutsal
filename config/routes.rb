PlayFutsal::Engine.routes.draw do

  resources :athletes
	resources :teams
  resources :matches

  root :to => 'teams#index'
	
end
