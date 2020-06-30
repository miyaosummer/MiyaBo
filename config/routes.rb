Rails.application.routes.draw do
  get 'incomes/index'
  devise_for :users
  resources :incomes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tops#index"
  resources :tops
  resources :configs
  resources :assets
end
