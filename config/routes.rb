Rails.application.routes.draw do
  get 'meals/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#index'

  devise_for :users

  resources :meals
  resources :subscriptions
  resources :orders
end
