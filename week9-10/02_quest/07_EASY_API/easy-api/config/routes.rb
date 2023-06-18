Rails.application.routes.draw do
  get "/get", to: "application#get"
  post "/todos", to: "todos#create"
  get "/todos", to: "todos#index"
end
