Rails.application.routes.draw do
  # get 'welcome/index'

  root 'pesquisa#index'

  resources :nota
  resources :pesquisa
  resources :user
end
