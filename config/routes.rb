Rails.application.routes.draw do

  root to: 'tasks#index'

  get 'tasks/index', as:'index'

  # show list of index
  get 'tasks/show/:id' => 'tasks#show', as: 'show'

  # return a HTML form for adding a new task
  get 'tasks/new'  => 'tasks#new', as: 'new'

  # create a new task and link to a result page
  post 'tasks/create' => 'tasks#create', as: 'create'

  # return a HTML form for editing a new task
  get 'tasks/edit'

  # update a task and linke to a result page
  get 'tasks/update'

  # delete a task and link to a result page
  get 'tasks/destroy'


end
