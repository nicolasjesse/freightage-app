Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get 'search', to: 'prices#search', as: 'search_prices'
  get 'track', to: 'routes#track', as: 'track_service_order'

  resources :companies, only: [:index, :new, :create, :show] do
    resources :vehicles, only: [:index, :show, :new, :create], shallow: true
    resources :delivery_times, only: [:new, :create]
    resources :prices, only: [:new, :create], shallow: true
  end


  resources :service_orders, only: [:index, :new, :create, :show, :edit, :update] do
    resources :routes, only: [:new, :create]
    member do
      post 'approve'
      post 'disapprove'
      post 'finish'
      get 'edit-vehicle'
      post 'update-vehicle'
    end
  end
end
