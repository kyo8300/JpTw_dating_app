Rails.application.routes.draw do
  devise_for :users
  get 'pages/loginpage'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  
  
  resources :profiles
end
