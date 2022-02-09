Rails.application.routes.draw do
  devise_for :users
  resources :groups  do
    resources :transactions
  end
  root "users#home"
end
