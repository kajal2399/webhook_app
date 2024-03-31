Rails.application.routes.draw do
  resources :notifications, only: [:create, :update]
end
