Rails.application.routes.draw do
  root 'articles#index'
  
  # Configuracion rutas users -> Solo se permite new y create 
  resources :users, only: [:new, :create]
  
end
