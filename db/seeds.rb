Product.create name: "Almond Toe Court Shoes, Patent Black", category: "Women's Footwear", price: 99, quantity: 5, image: "assets/almond.jpg"

Product.create name: "Suede Shoes, Blue", category: "Women's Footwear", price: 42, quantity: 4, image: "assets/suede.jpg"

Product.create name: "Leather Driver Saddle Loafers, Tan", category: "Men's Footwear", price: 34, quantity: 12, image: "assets/loafers.jpg"

Product.create name: "Flip Flops, Red", category: "Men's Footwear", price: 19, quantity: 6, image: "assets/redflips.png"

Product.create name: "Flip Flops, Blue", category: "Men's Footwear", price: 19, quantity: 0, image: "assets/blueflips.jpg"

Product.create name: "Gold Button Cardigan, Black", category: "Women's Casualwear", price: 167, quantity: 6, image: 'assets/cardigan.jpg'

Product.create name: "Cotton Shorts, Medium Red", category: "Women's Casualwear", price: 30, quantity: 5, image: 'assets/shorts.jpg'

Product.create name: "Fine Stripe Short Sleeve Shirt, Grey", category: "Men's Casualwear", price: 49.99, quantity: 9, image: "assets/greyshirt.jpg"

Product.create name: "Fine Stripe Short Sleeve Shirt, Green", category: "Men's Casualwear", price: 39.99, quantity: 3, image: "assets/greenshirt.jpg"

Product.create name: "Sharkskin Waistcoat, Charcoal", category: "Men's Formalwear", price: 75, quantity: 2, image: "assets/waistcoat.jpg"

Product.create name: "Lightweight Patch Pocket Blazer, Deer", category: "Men's Formalwear", price: 175.50, quantity: 1, image: "assets/jacket.jpg"

Product.create name: "Bird Print Dress, Black", category: "Women's Formalwear", price: 270, quantity: 10, image: "assets/dress.jpg"

Product.create name: "Mid Twist Cut-Out Dress Pink", category: "Women's Formalwear", price: 540, quantity: 5, image: "assets/pinkdress.jpg"

Voucher.create name: "£5 off your order", discount: 5, spend_requirements: 0, category_requirements: nil

Voucher.create name: "£10 off when you spend over £50", discount: 10, spend_requirements: 50, category_requirements: nil

Voucher.create name: "£15 off when you have bought at least one footwear item and spent over £75", discount: 15, spend_requirements: 75, category_requirements: "Footwear"
