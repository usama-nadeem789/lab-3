Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  #devise_for :admins
  
  resources :books
  resources :authors

  root 'books#index'
end
