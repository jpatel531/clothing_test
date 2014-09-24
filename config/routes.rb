Rails.application.routes.draw do

  root to: "main#index"

  get "/shopping_cart", to: 'main#index'

	resources :products
  resources :vouchers
  resource :shopping_cart do 
  	resources :user_choices
  end

end
