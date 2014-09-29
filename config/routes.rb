Rails.application.routes.draw do

  root to: "main#index"

  get "/*path" => "main#index", constraints: -> (req) { !(req.fullpath =~ /^\/api\/.*/) }

  namespace :api do 
		resources :products
		resources :vouchers
		resource :shopping_cart do 
			resources :user_choices
		end
	end


end
