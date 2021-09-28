Rails.application.routes.draw do
  devise_for :users
  resources :users, only[:index, :show, :edit, :update]
  # get 'users' => 'users#index', as: "users"
  # get 'users/:id' => 'users#show', as: "show_user"
  # get 'users/:id/edit' => 'users#edit', as: "edit_user"
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books
end
