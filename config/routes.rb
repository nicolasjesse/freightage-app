Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :companies, only: [:index, :new, :create, :show] do
    resources :vehicles, only: [:index, :show, :new, :create], shallow: true
  end
  
  resources :prices, only: [:index, :new, :create] do
    get 'search', on: :collection
  end

  resources :service_orders, only: [:index, :new, :create, :show, :edit, :update] do
    member do
      post 'approve'
      post 'disapprove'
      post 'finish'
      get 'edit-vehicle'
      post 'update-vehicle'
    end
  end
end
