Rails.application.routes.draw do
  root to: 'home#index'
  resources :companies, only: [:index]
end
