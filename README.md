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

The application is a game store in which the users could subscribe to a collection of videogames.
Each videogame belongs only to one collection.

[You can find the data model explanation here.](https://share.getcloudapp.com/6qu85YRO)

## What we'll cover

We need to writte back-end tests to cover the following:

- VideoGameController

  - Validate the 200 status when the user tries to access using the “GET Method” to the “Show view” to see a video game in their collection.
  - Validate that the response returns the video game data.
  - Validate the 401 status when the user tries to access using the “GET Method” to the “Show View”, for a videogame that is not in their collection.

- CollectionController

  - Validate the 401 status when the user tries to access using the “GET Method” to the “Show view” to a collection that they are not subscribed to.
  - Validate the 401 status when the user tries to access using the “GET Method” to the “Show view” to a collection that they are subscribed to, but reached their expiration date.

