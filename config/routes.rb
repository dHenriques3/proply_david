Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"

  # These routes are the basic routes needed for the application to work.
  # They work with the documents, tasks, subtasks, and properties controllers.
  resources :properties do
    resources :documents, only: %i[create update]
    resources :tasks, only: %i[create show]
  end
  resources :documents, only: %i[destroy]
  resources :tasks, only: %i[update destroy] do
    resources :subtasks, only: :create
  end
  resources :subtasks, only: %i[update destroy]
end
