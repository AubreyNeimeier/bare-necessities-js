Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  root 'welcome#index'
  resources :tasks
 

  resources :events do 
    resources :tasks, only: [:show, :edit, :update]
  end

  get '/signup' =>'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post  '/logout' => 'sessions#destroy'
  post '/tasks_from_event' => 'tasks#create_from_event'

  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
 

end
