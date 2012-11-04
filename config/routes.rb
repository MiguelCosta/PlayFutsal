PlayFutsal::Engine.routes.draw do

  mount PlayAuth::Engine => '/'

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
        put 'participation_add_goal'
        put 'participation_remove_goal'
        put 'participation_add_foul'
        put 'participation_remove_foul'
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

  resources :teams

  resources :groups do
    resources :matches
  end
  
  resources :phases do
    resources :matches
  end

  root :to => 'teams#index'

end
