Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard'

  resources :programs do
    resources :batches, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :students, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :teachers, only: [:index, :show]
  resources :students, only: [:show]
  resources :users, only: [:show]

  resources :slots_students, only: [:create, :destroy]

  resources :batches, only: [] do
    resources :lessons, only: [:new, :create]
  end

  resources :lessons, only: [] do
    resources :slots, only: [:new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
