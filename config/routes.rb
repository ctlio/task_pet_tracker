Rails.application.routes.draw do
  root "tasks#home"

  devise_for :users
  
  resources :tasks
  resources :pets

  get ":username" => "users#show", as: :user
  get ":username/tasks" => "users#tasks", as: :user_tasks
  get ":username/pets" => "users#pets", as: :user_pet
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   
end
