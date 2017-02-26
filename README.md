# README

This Rails 5 app was created as an assignment from [The Odin Project](http://www,theodinproject.com).

This application is primarily a study in authentication and authrization using browser sessions and cookies, as well as TDD/BDD with RSpec and Capybara.

To run the app locally, clone this repo and install the gem dependencies:
```
bundle install --without production
```
Migrate the database:
```
rails db:install
```
Run RSpec:
```
rspec
```
Instantiate the server on your localhost:
```
rails server
```
Visit:
```
http://localhost:3000
```