Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :users, only: [:index]
  get 'users/:id'  => 'users#show'
 
  
  get 'spendings/new' => 'spendings#new'
  post 'spendings' => 'spendings#create'

  get 'incomes/new' => 'incomes#new'
  post 'incomes' => 'incomes#create'
 
end
