Rails.application.routes.draw do
  root to: "todos#index"
  get "/todos", to: "todos#index"
end
