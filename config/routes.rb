Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get "users/search" => 'users#search'
  resources :users
  resources :posts
  resources :notices
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
   resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  get 'users/:id' => 'posts#create'
  delete  'posts/:id'  => 'posts#destroy'
  get 'posts/:id/edit' => 'posts#edit'
  patch 'posts/:id'  => 'posts#update'
  get 'posts/:id' => 'posts#show'
end
