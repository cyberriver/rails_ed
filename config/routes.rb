Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'users/new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root to: 'tests#index'

 get :signup, to: 'users#new'
 get :login, to: 'sessions#new'
 delete :logout, to: 'sessions#destroy'

 resources :users, only: :create
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
