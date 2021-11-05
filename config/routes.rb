Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :addresses
      resources :batteries
      resources :buildings
      resources :building_details
      resources :columns
      resources :customers
      resources :elevators
      resources :employees
      resources :leads do
        collection do
          get 'graphic'
        end
      end
      resources :quotes
      resources :dim_customers
      resources :fact_contacts
      resources :fact_elevators
      resources :fact_quotes

      root to: "users#index"
    end
  devise_for :users
  root 'pages#index'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/quote'
  get '/quote/new', to: 'quote#new'
  post '/quote', to: 'quote#create'
  post '/contact', to: 'contact#create'
  resources :graphics, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
