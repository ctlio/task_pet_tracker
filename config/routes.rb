Rails.application.routes.draw do
  root "tasks#home"

  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :tasks
  resources :pets

  get ":username" => "users#show", as: :user
  get ":username/tasks" => "users#tasks", as: :user_tasks
  get ":username/completed" => "users#completed", as: :completed
  get ":username/failed" => "users#failed", as: :failed
  get ":username/pets" => "users#pets", as: :user_pets
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   
end
