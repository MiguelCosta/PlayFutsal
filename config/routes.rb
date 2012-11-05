PlayFutsal::Engine.routes.draw do

  mount PlayAuth::Engine => '/'

  resources :athletes do
    member do
      delete 'remove_from_team'
    end
  end

  get 'matches/live' => 'matches#live', :as => :live_matches

  resources :matches do
    resources :events
    
    member do
        put 'begin'
        put 'finish'
      end
  end

  resources :athlete_stats do
    member do
      match 'increment/:stat' => 'athlete_stats#increment', :as => :increment, :via => :put
      match 'decrement/:stat' => 'athlete_stats#decrement', :as => :decrement, :via => :put
    end
  end

  resources :teams

  resources :groups do
    resources :matches
  end
  
  resources :phases do
    resources :matches
  end

  root :to => 'teams#index'

end
