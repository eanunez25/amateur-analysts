Rails.application.routes.draw do
  resources :prices
  resources :users
  root "application#greeting"
end
