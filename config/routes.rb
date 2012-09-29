PlayFutsal::Engine.routes.draw do

  resources :athletes do
    member do
      delete 'remove_from_team'
    end
  end

  resources :matches do
    resources :events 
    member do
        put 'begin'
      end
  end
  
	resources :teams

  resources :groups

  root :to => 'teams#index'

end
