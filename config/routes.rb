Rails.application.routes.draw do
  devise_for :users
  
  # Routes imbriquées pour montrer que les pets appartiennent aux users
  authenticate :user do
    # except: [:index] car la liste des pets sera sur le dashboard
    resources :pets, except: [:index] do
      resources :measurements
      resources :treatments
      member do
        # Ajout de routes supplémentaires spécifiques à un pet si nécessaire
      end
    end
  end
  
  # Pages statiques
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  # Dashboard qui montrera les pets de l'utilisateur connecté
  get 'dashboard', to: 'dashboard#index', as: :dashboard
end
