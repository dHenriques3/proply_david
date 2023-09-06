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
    resources :tenancies, only: :create
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :documents, only: %i[destroy]
  resources :tasks, only: %i[update destroy] do
    resources :subtasks, only: %i[create]
  end

  resources :subtasks, only: %i[destroy update]

  resources :tasks, only: %i[index]
  resources :documents, only: %i[index show]
  resources :tenancies, only: :index
end
