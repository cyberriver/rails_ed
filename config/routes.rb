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

 resources :user_badges, only: :index  do
   member do
     get :check
   end
 end

  resources :tests, only: :index  do
    member do
      post :start
    end
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do

    member do
      get :result
    end
    resources :gists, only: %i[create index]
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      post :ready, on: :member
      resources :questions, shallow: true, expect: :index do
        resources :answers, shallow: true, expect: :index
      end
    end
    resources :gists, only: %i[index]
    resources :users
    resources :badges
    resources :categories
  end

end
