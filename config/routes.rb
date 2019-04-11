Rails.application.routes.draw do
   get 'items/create'
  devise_for :users

  resources :users, only: [:update, :show] do
    resources :items, only: [:create, :destroy]
  end

 authenticated :user do
    root to: 'users#show', as: :authenticated_root_path
end

unauthenticated :user do
   root 'welcome#index', as: :unauthenticated_root_path
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
