Rails.application.routes.draw do
  resources :authors
  resources :commits
  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  post 'add', to: 'repositories#create', as: 'add_repo'
  root to: 'sessions#new'


  #Organization ajax call
  get '/orgs/:name_org', to: 'organizations#get_repos'
  
  resources :organizations
  resources :repositories
end
