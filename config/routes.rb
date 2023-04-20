Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get  "/signup",  to: "users#new"
  get "/profile",  to: "users#profile"
  get "/account", to: "users#account"
  resources :users
end
