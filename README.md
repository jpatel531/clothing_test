#Clothing Test

[![Code Climate](https://codeclimate.com/github/jpatel531/clothing_test/badges/gpa.svg)](https://codeclimate.com/github/jpatel531/clothing_test) [![Test Coverage](https://codeclimate.com/github/jpatel531/clothing_test/badges/coverage.svg)](https://codeclimate.com/github/jpatel531/clothing_test) [![Build Status](https://travis-ci.org/jpatel531/clothing_test.svg?branch=master)](https://travis-ci.org/jpatel531/clothing_test)

A test for a tech company to implement a website for a clothing retailer. The retailer sells six different categories of clothes: women's footwear, men's footwear, women's casualwear, men's casualwear, women's formalwear and men's formalwear.

The task is to display all the products, as well as a shopping cart to which they can be added, and implement a system where vouchers can be applied to a cart, given it fits the criteria.

The list of products and vouchers were supplied beforehand.

![Image1](https://raw.githubusercontent.com/jpatel531/clothing_test/master/screenshots/1.jpg)

![Image2](https://raw.githubusercontent.com/jpatel531/clothing_test/master/screenshots/2.jpg)

##User Stories

* As a user I can view all the products in an index.
* As a user I can add a product to my shopping cart.
* As a user I can remove a product from my shopping cart.
* As a user I can apply a voucher to my shopping cart.
* As a user I can view the total price for the products with discounts applied.
* As a user I am alerted when I apply an invalid voucher to my cart.
* As a user I am unable to add out of stock products to my cart.

##Technologies Used

* Ruby on Rails
* AngularJS
* Cucumber, Capybara, and Poltergeist for integration tests.
* Karma for Angular unit tests.
* Factory Girl for fixtures.
* HAML
* CoffeeScript
* Bootstrap
* Travis CI
* CodeClimate

##Code Layout

This test is an AngularJS on Rails application. The task of Rails is both to store the user's choices in a session and to render JSON to the Angular front-end. Angular is in charge of routing, templating, rendering products and vouchers, and dynamically validating vouchers and updating the shopping cart total accordingly. I will as follows, go through the relevant files and provide a high-level overview of the code.

###Rails Backend

####Controllers

`app/controllers/products_controller.rb`: The `ProductsController` simply has the action `#index`, which renders all the instances of `Product` as JSON. The `products` table has the columns specified by the tester: name, category, price, stock quantity.

`app/controllers/user_choices_controller.rb`: The `UserChoicesController` has the actions `#index`, `#create`, and `#destroy`. The `#index` action conditionally assigns an empty cart, which will be an array of IDs stored in a session variable. The `#create` action, when the user posts his/her choice from the front-end, pushes the desired product's ID into the cart array. The `#destroy` action takes the received ID parameter, and deletes it from the session cart. I have chosen to store user choices in a session variable for two reasons: firstly, the specification did not mention a user login; secondly, real e-commerce websites tend to rely on sessions to record choices, before the user can sign in.

####Seeds

`db/seeds.rb`: This file contains the specified information about the types of products and vouchers. Upon running `bin/rake db:seed`, this populates the database with those items.

####Tests

`features/*`: These tests, written in Cucumber and Capybara with Selenium,imitate the user stories specified above. There are more tests for `applying_vouchers.feature` than any other specification, given the different variations of what the user can see based on his input. The reason I have chosen to include Karma tests as well for this feature is that I thought it was important to test the more complicated logic going on in the relevant Angular controllers and services.

###Angular Frontend

####Routes and Views

`app/assets/javascripts/main.js.coffee`: This file sets up Angular's routing system, with the products index and shopping cart its only two routes.

`app/assets/javascripts/templates/*`: Given that AngularJS is in charge of non-API routing and rendering, I thought it would be sensible to keep the templates within this directory. The naming of files and subdirectories still, however, obeys Rails conventions:

`products/index.html.haml`: This view shows all products and allows you to add them to your cart.

`shopping_cart/show.html.haml`: This view shows you your choices, total of choices, and allows you to remove them from your cart.

####Controllers

`app/assets/javascripts/ng-controllers/ProductIndexCtrl.js.coffee`: This controller calls Rails's index of products with a $http.get and assigns them to scope. It also uses the ShoppingCart service to assign the number of items to scope.

`app/assets/javascripts/ng-controllers/CartCtrl.js.coffee`: This controller uses both the ShoppingCart service and the Voucher service to receive the relevant data from the Rails API and assign them to scope. Its other function is to 'watch' the user's `selectedVouchers` input; when this changes, it uses the validation method in the Voucher service and updates the view accordingly. I used the Voucher service as such so as not to include too much complicated logic in the controller, and to make it have less responsibility.

####Services

`app/assets/javascripts/ng-services/ShoppingCart.js.coffee`: This service gets JSON data about the user's shopping cart from Rails, and also calculates the total price of the cart, with no vouchers applied.

`app/assets/javascripts/ng-services/Vouchers.js.coffee`: This service gets JSON data regarding vouchers from the API. It also validates vouchers according to whether the spend and category requirements are met.

####Directives

`app/assets/javascripts/ng-directives/addItemToCart.js.coffee`: This directive is bound to the 'Add To Cart' link. Upon clicking, it checks whether the item is in stock. If so, it posts the user's choice to the server. If not, it alerts the user.

`app/assets/javascripts/ng-directives/removeItemFromCart.js.coffee`: This directive is bound to the 'Remove From Cart' link on the shopping cart page. Upon clicking, it sends a delete request to the server with the item's id. Then it updates the shopping cart in the views.

####Tests

`spec/javascripts/controller_specs/cart_spec.coffee`: This Karma spec tests the more complicated logic involved in the shopping cart's validations, dynamic updating of sums, and when alert messages are shown to the user. I use $httpBackend to mock the data received from the server.

##How to run the app

```
git clone https://github.com/jpatel531/clothing_test.git
cd clothing_test
bundle
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
bin/rails s
open http://localhost:3000
```

##How to run tests

###Cucumber Integration Tests

This requires PhantomJS installed on your computer.

```
bin/rake db:create RAILS_ENV=test
bin/rake db:migrate RAILS_ENV=test
cucumber
```

###Karma Unit Tests

This requires Karma CLI, and the Rails server to be running.

```
npm install
karma start spec/javascripts/karma.conf.js
```



