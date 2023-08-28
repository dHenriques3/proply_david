Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # These are the routes for the most basic functionality.
  # They correspond to the 4 primary tables;
  # (properties, documents, tasks, and subtasks)
  resources :properties do
    resources :documents, only: %i[create]
    resources :tasks, only: %i[create show]

    # resources :tenancies, only: %i[index] # this route is extra funtionality
    # resources :chatroom, only: %i[show] # this route is extra funtionality
    # Does resources :messages need to be nested.
  end

  resources :documents, only: %i[update destroy]
  resources :tasks, only: %i[update destroy] do
    resources :subtasks, only: :create
  end
  resources :subtasks, only: %i[update destroy]
end
