Rails.application.routes.draw do
  devise_for :users
  resources :projects

  resources :issues, except: [:new, :create] do
    resources :comments
  end
  get '/projects/:project_id/issues', to: 'issues#new', as: 'new_issue'
  post '/projects/:project_id/issues', to: 'issues#create', as: 'create_issue'

  root 'projects#index'
  get '/user/:id', to: 'users#show', as: 'profile'
  get 'owner/:project_id/:id', to: 'projects#make_leader', as: 'leader'
  post '/member/:id', to: 'project_members#create', as: 'member'

  get 'projects/:id/search', to: 'issues#search', as: 'search'
  get 'issues/:id/close', to: 'issues#close_issue', as: 'close_issue'
  get 'projects/:id/close_list', to: 'issues#close_list', as: 'close_list'

  delete 'project_members/:id', to: 'project_members#destroy', as: 'remove'

end
