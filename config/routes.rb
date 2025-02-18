Rails.application.routes.draw do
  resources :warehouses
  resources :suppliers do
    resources :supplier_contacts, as: 'contacts', path: 'contacts'
  end
  get "dashboard/index"
  resources :product_stocks
  resources :categories
  resources :products do
    collection do
      post :upload
    end
  end
  resources :sizes
  resources :notifications, only: [:index]

  namespace :authentication, path: "", as: "" do
    resources :users, only: [:create, :new]
    resources :sessions, only: [:create, :new, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
