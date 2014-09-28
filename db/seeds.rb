# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create name: "Almond Toe Court Shoes, Patent Black", category: "Women's Footwear", price: 99, quantity: 5, image: "http://asset1.marksandspencer.com/is/image/mands/HT_01_T02_0567A_Y4_SP14_EC_0?$PDP_MAXI_ZOOM$"

Product.create name: "Suede Shoes, Blue", category: "Women's Footwear", price: 42, quantity: 4, image: "http://dz7abk7jlh1eg.cloudfront.net/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/h/sho_grenson_suede_blue_full_01.jpg"

Product.create name: "Leather Driver Saddle Loafers, Tan", category: "Men's Footwear", price: 34, quantity: 12, image: "http://content.allenedmonds.com/wcsstore/AllenEdmonds/Attachment/images/database/allenedmonds_shoes_kenwood_brown-tan_l.jpg"

Product.create name: "Flip Flops, Red", category: "Men's Footwear", price: 19, quantity: 6, image: "http://flyingflips.com/image/cms/product/1000RD/Mens-FlipFlops-Sandals-FlyingFlips.png"

Product.create name: "Flip Flops, Blue", category: "Men's Footwear", price: 19, quantity: 0, image: "http://blackwagon.com/q_images/inv/l/hav006-havaianas-kids-top-flip-flops-cyan-blue-2.jpg"

Product.create name: "Gold Button Cardigan, Black", category: "Women's Casualwear", price: 167, quantity: 6, image: 'http://johnlewis.scene7.com/is/image/JohnLewis/001331299?$prod_exlrg$'

Product.create name: "Cotton Shorts, Medium Red", category: "Women's Casualwear", price: 30, quantity: 5, image: 'http://www.rustyzipper.com/full/151191L.jpg'

Product.create name: "Fine Stripe Short Sleeve Shirt, Grey", category: "Men's Casualwear", price: 49.99, quantity: 9, image: "http://johnlewis.scene7.com/is/image/JohnLewis/000603874?$prod_main$"

Product.create name: "Fine Stripe Short Sleeve Shirt, Green", category: "Men's Casualwear", price: 39.99, quantity: 3, image: "http://www.cwclothes.co.uk/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/p/t/pts11grn-flat.jpg"

Product.create name: "Sharkskin Waistcoat, Charcoal", category: "Men's Formalwear", price: 75, quantity: 2, image: "http://johnlewis.scene7.com/is/image/JohnLewis/000715154?$prod_main$"

Product.create name: "Lightweight Patch Pocket Blazer, Deer", category: "Men's Formalwear", price: 175.50, quantity: 1, image: "http://cdnb.lystit.com/photos/2012/07/24/reiss-deer-lightweight-patch-pkt-blazer-product-1-4269143-518146599_large_flex.jpeg"

Product.create name: "Bird Print Dress, Black", category: "Women's Formalwear", price: 270, quantity: 10, image: "http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=61463924"

Product.create name: "Mid Twist Cut-Out Dress Pink", category: "Women's Formalwear", price: 540, quantity: 5, image: "http://johnlewis.scene7.com/is/image/JohnLewis/001277366?$prod_main$"

Voucher.create name: "£5 off your order", discount: 5, spend_requirements: 0, category_requirements: nil

Voucher.create name: "£10 off when you spend over £50", discount: 10, spend_requirements: 50, category_requirements: nil

Voucher.create name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, spend_requirements: 75, category_requirements: "Footwear"
