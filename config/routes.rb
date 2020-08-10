Rails.application.routes.draw do
  resources :equities
  resources :prices
  resources :users
  root "application#greeting"
end
