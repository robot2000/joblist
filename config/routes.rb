Rails.application.routes.draw do

  root 'jobs#index'

  devise_for :users
  
  resources :jobs
  resources :companies, only: [:index, :show]

  admin_only = ->(request) { request.env['warden'].user.try(:admin?) }

  constraints admin_only do
    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  end 
end
