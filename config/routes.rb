Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  get 'books/:id/' => 'books#show'
  resources :users, only: [:index, :new, :create]
  get 'users/:id/'  => 'users#index'
  post 'users/:id(/:name)' => 'users#show'
  get 'users/:id/new' => 'users#new'
  get 'users/:id/'  => 'users#show'
  post 'users/:id' => 'users#create'
  
  
  
  get 'spendings/new' => 'spendings#new'
  post 'spendings' => 'spendings#create'

  get 'incomes/new' => 'incomes#new'
  post 'incomes' => 'incomes#create'
 
end
