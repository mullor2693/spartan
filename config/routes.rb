Rails.application.routes.draw do
  
  devise_for :users, :skip => [:registrations]

  authenticated :user do

    namespace :admin do
      get "/training", to: "dashboard#training", as: :training
      scope 'training' do
        resources :exercises
        resources :workouts
      end
      get "/nutrition", to: "dashboard#nutrition", as: :nutrition
      scope 'nutrition' do
        resources :foods
        resources :diets do
          scope module: 'diets' do
            resources :diet_meals, only: [:update, :destroy]
            resources :meals do
              scope module: 'meals' do
                resources :meal_foods
              end
            end
          end
        end
      end
      
      resources :users do
        scope module: 'users' do
          resources :diets do
            scope module: 'diets' do
              resources :meals do
                scope module: 'meals' do
                  resources :meal_foods
                end
              end
            end
          end
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

    get "/profile", to: "dashboard#profile", as: :profile

    get "/nutrition", to: "dashboard#nutrition", as: :nutrition
    scope 'nutrition' do
      resources :diets do
        scope module: 'diets' do
          resources :meals, except: [:index] do
            scope module: 'meals' do
              resources :meal_foods, except: [:index]
            end
          end
        end
      end
      resources :weights
      resources :foods, only: [:index, :show]

    end

    get "/physical", to: "dashboard#physical", as: :physical
    scope 'physical' do
      resources :measurements
      resources :evaluations
    end

    get "/training", to: "dashboard#training", as: :training
    scope 'training' do
      resources :exercises, only: [:index, :show]
      resources :workouts do
        scope module: 'workouts' do
          resources :exercises, only: [:index, :show]
          resources :exercise_workouts
        end
      end
    end
    
    root 'dashboard#index', as: :authenticated_root

  end
  
  root to: "home#index"

  # match "*path", to: "home#none", via: :all

end
