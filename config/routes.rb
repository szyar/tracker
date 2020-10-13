Rails.application.routes.draw do
  devise_for :users
  resources :projects
  root 'projects#index'
  get '/user/:id', to: 'users#show', as: 'profile'
  post '/member/:id', to: 'project_members#create', as: 'member'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
