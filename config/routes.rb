Rails.application.routes.draw do  
  devise_for :users
  root to: "dogs#index"
  
  resources :dogs

  resources :users, only: [:show, :update, :edit]

  resources :comments, only:[:create,:update,:destroy]

end
