Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#index'

  devise_for :users

  get 'meals/popularest', to: 'meals#popularest', as: 'popularest_meals'
  resources :meals

  resources :subscriptions
  resources :orders
end
