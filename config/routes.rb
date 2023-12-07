Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  #devise_for :admins
  
  resources :books do
    member do
      get 'lend', to: 'books#lend'
      post 'lend', to: 'books#create_lending'
      post 'return_book', to: 'books#return_book'
    end
  end

  resources :authors
  resources :students
  resources :genres

  root 'books#index'
end
