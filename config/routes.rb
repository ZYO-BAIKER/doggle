Rails.application.routes.draw do
  devise_for :users
  get 'dogs/index'
  root to: "dogs#index"
end
