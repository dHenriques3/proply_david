Rails.application.routes.draw do
  get 'properties/index'
  get 'properties/show'
  get 'properties/new'
  get 'properties/edit'
  get 'properties/update'
  get 'properties/create'
  get 'properties/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
