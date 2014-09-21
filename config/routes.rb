Rails.application.routes.draw do
  resources :products


  root to: "main#index"

  get "/shopping_cart/user_choices" => "shopping_cart#user_choices"
  get "/shopping_cart", to: 'main#index'
  post "/shopping_cart" => "shopping_cart#add_to_cart"

end
