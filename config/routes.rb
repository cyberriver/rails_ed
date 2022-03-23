Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root to: 'tests#index'

 devise_for :users,:tests, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}


 get :my_tests, to: 'test_passages#index'

  resources :tests, only: :index  do
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

  namespace :admin do
    resources :tests
  end

end
