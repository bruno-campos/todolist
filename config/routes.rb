Todolist::Application.routes.draw do

  namespace :api do
    resources :users
    resources :sessions
    resources :tasks
    delete    "/sessions",  to: "sessions#destroy"
    post      "/user_data", to: "sessions#create"
    get       "/current_user", to: "sessions#index"
  end

  root to: "pages#index"

end
