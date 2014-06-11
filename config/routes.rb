scope 'project' do
  resources :project_priorities, :only => [:update, :destroy]
end