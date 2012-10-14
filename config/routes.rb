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
        put 'finish'
        put 'athlete_add_goal'
        put 'athlete_remove_goal'
        put 'athlete_add_foul'
        put 'athlete_remove_foul'
      end
  end
  
	resources :teams

  resources :groups

  root :to => 'teams#index'

end
