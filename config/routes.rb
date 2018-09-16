Rails.application.routes.draw do
  devise_for :users
  get 'pages/loginpage'
  get 'profiles/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  
  resources :profiles, except: [:edit]
  resources :relationships, only: [:create, :destroy]
end
