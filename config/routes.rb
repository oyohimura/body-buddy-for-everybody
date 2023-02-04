Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard' , as: "dashboard"
  get 'profile/:user_id', to: 'pages#profile', as: 'user_profile'

  resources :programs do
    resources :batches, only: [:index, :show, :new, :create, :edit]
    # resources :reviews, only: [:new, :create]
  end

  resources :batches, only: [:update, :destroy] do
    resources :lessons, only: [:new, :create]
    resources :students, only: [:index, :new, :create]
  end

  resources :students, only: [:show, :edit, :update] do
    resources :slots_students, only: [:create]
  end

  resources :lessons, only: [] do
    resources :slots, only: [:new, :create, :destroy]
  end

  # resources :reviews, only: [:edit, :destroy, :update]
  resources :teachers, only: [:index, :show]
  resources :slots_students, only: [:destroy]

end
