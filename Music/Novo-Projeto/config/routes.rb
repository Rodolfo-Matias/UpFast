Rails.application.routes.draw do
  # Health check endpoint
  get "up", to: "rails/health#show", as: :rails_health_check

  # PWA files
  scope "pwa" do
    get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
  end
root "sales#new"
  # Sales resource routes
  resources :sales do
    collection do
      post :upload_file
    end
  end
end