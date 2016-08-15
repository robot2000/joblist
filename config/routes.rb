Rails.application.routes.draw do

  root 'jobs#index'

  resources :jobs
  resources :companies, only: [:index, :show]
end
