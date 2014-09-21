Rails.application.routes.draw do
  resources :products

  root to: "main#index"
end
