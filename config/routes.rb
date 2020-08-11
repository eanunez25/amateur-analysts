Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  resources :equities
  resources :prices
  resources :users
  root "prices#index"
end
