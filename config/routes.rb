Rails.application.routes.draw do
  get 'welcome/index'

  root 'pesquisas#index'

  resources :notas
  resources :pesquisas
  resources :users
end
