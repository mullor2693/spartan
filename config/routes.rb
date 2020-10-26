Rails.application.routes.draw do
  
  devise_for :users, :skip => [:registrations]

  authenticated :user do

    namespace :admin do

      resources :exercises
      resources :users do
        scope module: 'users' do
          resources :measurements
          resources :evaluations
          resources :weights
          resources :workouts do
            scope module: 'workouts' do
              resources :exercises
              resources :exercise_workouts
            end
          end
        end
      end
      root 'dashboard#index', as: :authenticated_root

    end

    resources :measurements
    resources :evaluations
    resources :weights
    resources :exercises, only: [:index, :show]
    resources :workouts do
      scope module: 'workouts' do
        resources :exercises, only: [:index, :show]
        resources :exercise_workouts
      end
    end
    root 'dashboard#index', as: :authenticated_root

  end
  root to: "home#index"
  
end
