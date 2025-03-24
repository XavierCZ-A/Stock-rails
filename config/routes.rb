Rails.application.routes.draw do
  resources :warehouses do
    get "stock", on: :member, to: "product_stocks#index"
  end

  resources :suppliers do
    resources :supplier_contacts, path: "contacts"
  end

  resources :products do
    collection do
      post :upload
    end
  end

  namespace :authentication, path: "", as: "" do
    resources :users, only: [ :create, :new ]
    resources :sessions, only: [ :create, :new, :destroy ]
  end

  resources :purchase_orders do
    patch :update_status, on: :member
  end
  resources :order_items, only: [ :index, :new, :create ]

  get "dashboard/index"
  resources :sizes
  resources :product_stocks, except: [ :show ]
  resources :categories, only: [ :new, :create, :index ]
  resources :notifications, only: [ :index ]
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
