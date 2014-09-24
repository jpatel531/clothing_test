# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create name: "Almond Toe Court Shoes, Patent Black", category: "Women's Footwear", price: 99, quantity: 5

Product.create name: "Suede Shoes, Blue", category: "Women's Footwear", price: 42, quantity: 4

Product.create name: "Leather Driver Saddle Loafers, Tan", category: "Men's Footwear", price: 34, quantity: 12

Product.create name: "Flip Flops, Red", category: "Men's Footwear", price: 19, quantity: 6

Product.create name: "Flip Flops, Blue", category: "Men's Footwear", price: 19, quantity: 0

Product.create name: "Gold Button Cardigan, Black", category: "Women's Casualwear", price: 167, quantity: 6

Product.create name: "Cotton Shorts, Medium Red", category: "Women's Casualwear", price: 30, quantity: 5

Product.create name: "Fine Stripe Short Sleeve Shirt, Grey", category: "Men's Casualwear", price: 49.99, quantity: 9

Product.create name: "Fine Stripe Short Sleeve Shirt, Green", category: "Men's Casualwear", price: 39.99, quantity: 3

Product.create name: "Sharkskin Waistcoat, Charcoal", category: "Men's Formalwear", price: 75, quantity: 2

Product.create name: "Lightweight Patch Pocket Blazer, Deer", category: "Men's Formalwear", price: 175.50, quantity: 1

Product.create name: "Bird Print Dress, Black", category: "Women's Formalwear", price: 270, quantity: 10

Product.create name: "Mid Twist Cut-Out Dress Pink", category: "Women's Formalwear", price: 540, quantity: 5

Voucher.create name: "£5 off your order", discount: 5, spend_requirements: 0, category_requirements: nil

Voucher.create name: "£10 off when you spend over £50", discount: 10, spend_requirements: 50, category_requirements: nil

Voucher.create name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, spend_requirements: 75, category_requirements: "Footwear"
