Rails.application.routes.draw do
  get 'dashboard/index'
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  get 'dashboard', to: 'dashboard#index', as: :dashboard
  
  devise_for :users
end
