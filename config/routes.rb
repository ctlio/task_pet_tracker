Rails.application.routes.draw do
  root "tasks#home"

  devise_for :users
  
  resources :tasks
  resources :pets

  get ":username" => "users#show", as: :user
  get ":username/tasks" => "users#tasks", as: :user_tasks
  #get ":username/tasks_completed" => "users#completed", as: :tasks_completed
  #get ":username/tasks_failed" => "users#failed", as: :tasks_failed
  get ":username/pets" => "users#pets", as: :user_pets
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   
end
