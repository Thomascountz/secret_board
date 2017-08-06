# Secret Board

A Rails 5 CRUD app built while working through [The Odin Project](http://www,theodinproject.com).

## What Does It Do?

This application is primarily a study in authentication and authorization using browser sessions and cookies, as well as TDD/BDD with RSpec and Capybara.

Secret Board allows non-signed-in users who visit the site to see a list of anonymous text-based posts. When a user logs-in, that user can see the same posts and their respective authors, as well as create a new post themselves. That new post will then be seen as anonymously authored to non-logged-in users.

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

# TODO
* Validate user email uniqueness 
* Change user's `name` to `username`
* Index user email in db
* Add callback for signup to prevent logged in users from accessing signup form
* Add test for login link on signup page
* Add test for signup link on login page
* Add user delete functionality
* Add Markdown compatibility to posts
* Hide "New Post" button for non-users
* Limit post length
