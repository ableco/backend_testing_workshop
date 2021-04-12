# Backend Testing Workshop

## Requirements

- Ruby 2.6.1

## Installation

```shell
bundle install
yarn install
bin/rails db:setup
```

Run the project with `bin/rails s` and ensure you can access it at `http://localhost:3000`

## Running the tests

```shell
bundle exec rspec
```

# The Application

The application is a gamestore in which the users could subscribe to a collection of videogames.
Each videogame belongs only to a collection.

[You can find the data model explanation here.](https://share.getcloudapp.com/6qu85YRO)

## What we'll cover

We need to test the models and controller endpoints to ensure:

- VideoGameController
  - Validate 200 status when the user access to the videogames of their collection.
  - Validate that the user can access to all the videogames of the collection they are subscribed.
  - Validate 401 status when the user try to access to a collection that is not subscribed.
  - Validate 401 status when the user try to access with an expired subscription.
  - Validate that the user can't see a videogame that is not subscribed for
