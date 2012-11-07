PlayFutsal::Engine.routes.draw do

  mount PlayAuth::Engine => '/'

  resources :athletes do
    member do
      delete 'remove_from_team'
    end
  end

  get 'matches/live' => 'matches#live', :as => :live_matches
  get 'pages/home' => 'pages#home', :as => :home_pages

  resources :matches do
    resources :events
    
    member do
        put 'begin'
        put 'finish'
      end
  end

  resources :athlete_stats do
    member do
      match 'increment/:stat' => 'athlete_stats#increment', as: :increment, via: :put
      match 'decrement/:stat' => 'athlete_stats#decrement', as: :decrement, via: :put
    end
  end

  resources :participations do
    member do
      match 'increment/:stat'    => 'participations#increment', as: :increment, via: :put
      match 'decrement/:stat'    => 'participations#decrement', as: :decrement, via: :put
    end
  end

  resources :group_stats do
    member do
      match 'increment' => 'group_stats#increment', as: :increment, via: :put
      match 'decrement' => 'group_stats#decrement', as: :decrement, via: :put
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
