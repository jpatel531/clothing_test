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
* Karma for unit-testing Angular controllers.
* Factory Girl for fixtures.
* HAML
* CoffeeScript
* Bootstrap
* jBuilder

##Code Layout

This test is an AngularJS on Rails application. The task of Rails is both to render JSON to the Angular front-end, while Angular is in charge of routing, templating, rendering products and vouchers, and dynamically validating vouchers and updating the shopping cart total accordingly. I will as follows, go through the relevant files and provide a high-level overview of the code.

###Rails Backend

####Tests

###Angular Frontend

####Tests

##How to run the app

##How to run tests





