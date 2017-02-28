# Secret Board

This Rails 5 app was created to satisfy an assignment from [The Odin Project](http://www,theodinproject.com).

## What Does It Do?

This application is primarily a study in authentication and authorization using browser sessions and cookies, as well as TDD/BDD with RSpec and Capybara.

Secret Board allows unregistered users who visit the site to see a list of anonymous text-based posts. When a register user logs-in, that user can see the same posts and their authors, as well as create a new post themselves, which will be see as anonymously authored to nonregistered users.

## Getting Started

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
