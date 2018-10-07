Rails.application.routes.draw do
  

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  get 'pages/loginpage'
  get 'profiles/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  
  resources :matching, only: [:index, :show]
  resources :profiles, except: [:edit]
  resources :relationships, only: [:create, :destroy]
  mount ActionCable.server => '/cable'
end
