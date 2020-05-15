Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :attendances, only: [:index, :new, :create]
  resources :charges
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :events do
    resources :event_pictures, only: [:create]
  end

  namespace :admin do
    root to: 'admin#index'
    resources :users
  end
end
