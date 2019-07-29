Rails.application.routes.draw do

  namespace :admins_backoffice do
    get 'welcome/index' #index ADMIN
    resources :members #Membros
    resources :addresses #Endereços
    resources :positions #Cargos
    resources :churches #Igrejas
  end
  devise_for :users
  namespace :site do
    get 'welcome/index'
  end
  
  root to: 'site/welcome#index'
end
