Rails.application.routes.draw do
  devise_for :users
  
  root 'pesquisas#index'

  resources :notas
  resources :pesquisas
  resources :users
  resources :membros
end
