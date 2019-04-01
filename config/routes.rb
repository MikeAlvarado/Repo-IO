Rails.application.routes.draw do
  resources :authors
  resources :commits
  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'
  resources :organizations
  resources :repositories
end
