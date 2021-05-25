Rails.application.routes.draw do
  resources :orders
  resources :subscriptions
  get 'meals/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#index'

  devise_for :users

  resources :meals
end
