Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  root to: "pages#landing"
  get '/home', to: 'pages#home'
  get '/myprofile', to: 'pages#myprofile'
  get '/about', to: 'pages#about'
  resources :genres, only: %i[index show] do
    resources :join_genres, only: %i[create destroy]
  end
  resources :communities, only: %i[index show new create edit update] do
    resources :join_communities, only: %i[create destroy]
    resources :posts, only: %i[create edit update] do
      member do
        post 'like'
        post 'unlike'
      end
    end
  end
  resources :profiles, only: %i[show new create edit update]
end
