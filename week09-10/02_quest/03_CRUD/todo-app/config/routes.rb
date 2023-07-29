Rails.application.routes.draw do
  root to: 'todos#index'
  resources :todos, only: [:new, :create, :index, :edit, :update, :destroy]
end
