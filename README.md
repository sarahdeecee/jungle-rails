# Jungle

A mini e-commerce application designed in **Ruby** and built with **Rails** for purposes of teaching Rails by example.

## Features

See all products in a given category
![A screenshot of the interface](/docs/screenshot-products.png "A screenshot of a products view")

See your cart and update quantities
![A screenshot of the interface](/docs/screenshot-cart.png "A screenshot of a products view")

See the products, quantities, and prices on the order confirmation
![A screenshot of the interface](/docs/screenshot-order.png "A screenshot of a products view")

Create new products and categories on the administrator dashboard (password protected)
![A screenshot of admin interface](/docs/screenshot-newproduct.png "A screenshot of a products view")

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a **Stripe** account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s` to start the server
9. Open your browser to [`http://localhost:3000/`](http://localhost:3000/) to see Jungle

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe [Homepage](https://www.stripe.com/)

## Testing
* [Rspec](https://rspec.info/)
* [Capybara with Rspec](https://github.com/teamcapybara/capybara)