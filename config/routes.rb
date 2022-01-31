Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 #root to: 'questions#index'
#delete '/questions/:id(.:format)', to: 'questions#destroy', as: 'delete_question'

  resources :questions do
    resources :tests, shallow: true
  #  get '/delete', to: 'questions#destroy'
  end

end
