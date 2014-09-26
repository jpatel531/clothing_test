# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :voucher do

  	factory :voucher1 do
  		name "£5 off your order"
  		discount 5
  		spend_requirements 0
  		category_requirements nil
  	end

  	factory :voucher2 do 
  		name "£10 off when you spend over £50"
  		discount 10
  		spend_requirements 50 
  		category_requirements nil
  	end

  	factory :voucher3 do
  		name "£15 off when you have bought at least one footwear item and spent over £75" 
  		discount 15
  		spend_requirements 75
  		category_requirements "Footwear"
  	end


  end
end
