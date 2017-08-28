Rails.application.routes.draw do
  root 'pages#index'
  # CRUD - CREATE, READ, UPDATE, DELETE
  resources :pages 
end
