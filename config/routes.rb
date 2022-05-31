Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :companies, only: [:index, :new, :create, :show] do
    resources :vehicles, only: [:index, :show, :new, :create], shallow: true
  end
  
  resources :prices, only: [] do
    get 'search', on: :collection
  end

  resources :service_orders, only: [:index, :new, :create, :show, :edit, :update]
end
