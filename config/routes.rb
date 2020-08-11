Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  resources :equities
  resources :prices
  resources :users
  root "prices#index"
end
