Rails.application.routes.draw do
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  get 'profile/show'
  get 'profile/edit'
  get 'profile/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get  "/signup",  to: "users#new"
  get "/profile", to: "profile#show"
  resources :users
end
