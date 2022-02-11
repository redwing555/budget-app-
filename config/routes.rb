Rails.application.routes.draw do
  devise_for :users
  resources :groups  do
    resources :operations
  end
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  
  unauthenticated :user do
    root to: 'users#home'
  end
end
