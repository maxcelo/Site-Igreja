Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  
  root to: 'site/welcome#index'
end
