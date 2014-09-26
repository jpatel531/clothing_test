# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

	factory :product do 
	  factory :product1 do
	  	name "Almond Toe Court Shoes, Patent Black"
	  	category "Women's Footwear"
	  	price 99
	  	quantity 5
	  end

		factory :product2 do 
			name "Cotton Shorts, Medium Red"
			category "Women's Casualwear" 
			price 30
			quantity 5
	  end

	  factory :product3 do
	  	name "Flip Flops, Blue"
	  	category "Men's Footwear"
	  	price 19 
	  	quantity 0
	  end

	end


end
