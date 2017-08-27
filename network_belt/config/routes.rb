Rails.application.routes.draw do

  root 'application#index'
  # resources :users, exclude: [:index]
  post 'users' => 'users#create'
  get 'users/:id' => 'users#description'
  get 'users' => 'users#show', as: :user

  # post 'profiles/index/:id' => 'profiles#index
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'networks/:id' => 'networks#show', as: :networks
  delete "networks/:id" => "networks#destroy"

  # get 'logout' => 'sessions#destroy'
  post 'invites/:id' => 'invites#create'
  delete 'invites/:id' => 'invites#destroy'

  post 'friendships/:id' => 'friendships#create'
  delete 'friendships/:id' => 'friendships#destroy'
end
