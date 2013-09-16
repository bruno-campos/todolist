Todolist::Application.routes.draw do

  namespace :api do
    resources :users
    resources :sessions
    resources :tasks
    delete "/sessions", to: "sessions#destroy"
  end

  get "/*", to: "pages#index"
  root to: "pages#index"

end
