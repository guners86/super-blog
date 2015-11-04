Rails.application.routes.draw do
  root 'articles#index'
  
  # Configuracion rutas users -> Solo se permite new y create 
  resources :users, only: [:new, :create]
  
  # Configuracion rutas articles 
  resources :articles do
    resources :comments, only: [:create]
  end
  
  # Configuracion rutas login new, create y logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
