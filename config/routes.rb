Rails.application.routes.draw do
  devise_for :users
  get '/users' => 'users#index', as: "users"
  get '/user/:id' => 'users#show', as: "show_user" 
  get '/users/:id/edit' => 'users#edit', as: "edit_user"
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  resources :books
end
