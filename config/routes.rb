Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root to: 'tests#index'

 get :signup, to: 'users#new'
 get :login, to: 'sessions#new'
 delete :logout, to: 'sessions#destroy'
 get :my_profile, to: 'users#show'
 get :edit_profile, to: 'users#edit'
 get :my_tests, to: 'test_passages#index'

resources :users, only: %i[create edit update]
resources :sessions, only: :create

  resources :tests  do
    resources :questions, shallow: true, expect: :index do
      resources :answers, shallow: true, expect: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
