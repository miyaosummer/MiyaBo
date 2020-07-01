Rails.application.routes.draw do
  get 'incomes/index'
  devise_for :users 
  
  resources :users do
    resources :incomes
    resources :configs
    resources :assets
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tops#index"
  resources :tops

end
