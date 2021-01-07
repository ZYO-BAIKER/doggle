Rails.application.routes.draw do
  get 'dogs/index'
  root to: "dogs#index"
end
