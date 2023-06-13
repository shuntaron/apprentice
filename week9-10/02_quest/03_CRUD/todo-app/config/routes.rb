Rails.application.routes.draw do
  get 'todos/new'
  get 'todos/index'
  get 'todos/edit'
  get 'todos/update'
  get 'todos/destroy'
  root to: "todos#index"
  get "/todos", to: "todos#index"
end
