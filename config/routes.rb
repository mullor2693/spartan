Rails.application.routes.draw do
  
  devise_for :users, :skip => [:registrations]

  authenticated :user do

    namespace :admin do

      resources :exercises
      resources :users do
        resources :workouts
      end

    end

    resources :exercises, only: [:index, :show]
    resources :workouts

    
    root 'dashboard#index', as: :authenticated_root

  end

  root to: "home#index"
end
