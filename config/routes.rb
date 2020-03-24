Rails.application.routes.draw do
  
 get "/home/about" => "tops#show"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'tops#index'
  resources :tops
  resources :users, only: [:show, :edit, :update, :index,]
  resources :books, only: [:user, :create, :index, :show, :destoroy,:edit,:update,:destroy]
end
