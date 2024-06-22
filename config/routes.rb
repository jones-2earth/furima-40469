Rails.application.routes.draw do
  devise_for :users
    root to: 'items#index'
    get '/items/category/:id', to: "items#category"
    resources :items do
      resources :orders, only: [:index, :create]
    end
  
end
