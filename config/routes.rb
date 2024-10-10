Rails.application.routes.draw do
  resources :contract_templates
  resources :terms
  resources :term_types
  resources :contract_types
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end  
  resources :accounts
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  namespace :api do
    namespace :v1 do
      resources :accounts
    end
  end  
end
