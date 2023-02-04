Rails.application.routes.draw do
  get 'slots/new'
  get 'slots/create'
  get 'slots/destroy'
  get 'lessons/new'
  get 'lessons/create'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/destroy'
  get 'reviews/update'
  get 'slots_students/create'
  get 'slots_students/destroy'
  get 'students/index'
  get 'students/show'
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/update'
  get 'batches/index'
  get 'batches/show'
  get 'batches/new'
  get 'batches/create'
  get 'batches/edit'
  get 'batches/update'
  get 'batches/destroy'
  get 'programs/index'
  get 'programs/show'
  get 'programs/new'
  get 'programs/edit'
  get 'programs/update'
  get 'programs/destroy'
  get 'programs/create'
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
