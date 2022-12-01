Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/myprofile', to: 'pages#myprofile'
  resources :genres, only: %i[index show] do
  end
  resources :communities, only: %i[index show new create edit update] do
    resources :posts, only: :create do
      member do
        post 'like'
        post 'unlike'
      end
    end
  end
  resources :profiles, only: %i[show new create edit update] do
  end
end
