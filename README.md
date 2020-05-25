# README Seats API Ordway

This README documents all steps necessary to get the application up and running locally.

**Steps:**

* Ruby 2.6.1

* Rails 6.0.3.1

* Database MySQL 5.7.30

* Database creation: `rake db:create`

* Database initialization: `rake db:migrate`

* Populate database with example data: `rake db:seed`

* Add to your hosts file your local api address (in this source is 'api.seats.local')

* Change in config/enviroments/development.rb and config/enviroments/test.rb the following line to you local address: `Rails.application.routes.default_url_options[:host] = 'api.seats.local:3001'` 

* Run tests with the following command: `bundle exec spring rspec`

* Start rails server on port 3001 (because you will run react interface on port 3000). `rails s -p3001`
