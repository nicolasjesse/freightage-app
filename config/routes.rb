Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :companies, only: [:index, :new, :create, :show]
  
  resources :prices, only: [] do
    get 'search', on: :collection
  end
end
