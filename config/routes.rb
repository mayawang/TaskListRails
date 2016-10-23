Rails.application.routes.draw do

  root to: 'tasks#index'

  get 'tasks' => 'tasks#index', as:'index'

  # return a HTML form for adding a new task
  get 'tasks/new'  => 'tasks#new', as: 'new'

  # create a new task and link to a result page
  post 'tasks' => 'tasks#create', as: 'create'

  # show list of index
  get 'tasks/:id' => 'tasks#show', as: 'show'

  # return a HTML form for editing a new task
  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit'

  # update a task and link to a result page
  patch 'tasks/:id' => 'tasks#update', as: 'update'

  # set a task to completed state
  patch 'tasks/:id/complete' => 'tasks#complete', as: 'complete'

  # delete a task and link to a result page
  delete 'tasks/:id' => 'tasks#destroy', as: 'delete'


  get "/auth/:provider/callback" => "sessions#create"
  get "/login" => "sessions#index"

  delete "/logout" => "sessions#destroy", as: "sessions_destroy"

end
