Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root to: 'tests#index'

 devise_for :users,:tests, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}

 scope "(:locale)", locale: /en|ru/ do
   resources :tests
 end

 get '/change_locale/:lang', to: 'settings#change_locale', as: :change_locale

 get :my_tests, to: 'test_passages#index'

  resources :tests, only: :index  do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
      get :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, expect: :index do
        resources :answers, shallow: true, expect: :index
      end
    end
    resources :gists, only: %i[index]
  end

end
