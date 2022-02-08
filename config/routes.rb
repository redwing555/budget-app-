Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/index'
  get 'groups/create'
  get 'groups/destroy'
  
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#home"
end
