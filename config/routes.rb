Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :users
  resources :attendances, only: [:index, :new, :create]
  resources :charges
  resources :events do
    resources :event_pictures, only: [:create]
  end
end
