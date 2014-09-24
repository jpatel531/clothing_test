# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :voucher do
    name "MyString"
    discount 1.5
    spend_requirements 1.5
    category_requirements "MyString"
  end
end
