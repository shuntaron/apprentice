Rails.application.routes.draw do
  get "/get", to: "application#get"
  post "/todos", to: "todos#create"
end
