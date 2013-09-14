Todolist::Application.routes.draw do

  namespace :api do
    resources :users
    resources :sessions
    resources :tasks
  end

  root to: "pages#index"

end
