Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/myprofile', to: 'pages#myprofile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :genres, only: %i[index] do
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :communities, only: %i[index show new create] do
  end

  resources :profiles, only: %i[new create edit update] do
  end
  resources :communities do
  end
end
