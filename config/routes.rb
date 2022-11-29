Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/myprofile', to: 'pages#myprofile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles, only: %i[new create edit update] do
  end
end
