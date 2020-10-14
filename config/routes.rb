Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :issues, except: [:new, :create]
  get '/projects/:project_id/issues', to: 'issues#new', as: 'new_issue'
  post '/projects/:project_id/issues', to: 'issues#create', as: 'create_issue'

  root 'projects#index'
  get '/user/:id', to: 'users#show', as: 'profile'
  get 'owner/:project_id/:id', to: 'projects#make_leader', as: 'leader'
  post '/member/:id', to: 'project_members#create', as: 'member'
  delete 'project_members/:id', to: 'project_members#destroy', as: 'remove'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
