Rails.application.routes.draw do
  get 'profile/:id/edit', to: "profile#edit"

  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  get "/users/:id/profile", to: "users#profile"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get  "/signup",  to: "users#new"
  resources :users
  resources :profile
  resources :users do
    get 'profile', on: :member
  end
  resources :static_pages do
    resources :users , only: [:home]
  end
end
