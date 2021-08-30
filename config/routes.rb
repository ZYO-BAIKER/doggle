
Rails.application.routes.draw do
  devise_for :users
  root to: "dogs#index"
  get 'dogs/search'
  get 'dogs/experience'

  resources :users, only: [:show, :update, :edit]

  resources :dogs do
    resources :comments, only:[:create,:update,:destroy]
  end
