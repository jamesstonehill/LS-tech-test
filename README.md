[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# README

#### Hosted App: https://arcane-harbor-82493.herokuapp.com

This app was created as a submission for a tech test. The brief for this tech test was to build a rails app with some basic login capabilities, some custom user fields, the ability for users to edit user information, and a bar chart displaying user sign up data.

## Features

### Sign In / Sign Up
The authentication for this app makes use of the `gem devise`. I chose not to implement a custom login system from scratch because the chances of having to do this in real commercial applications is very unlikely, and without considerable time and effort, the system would probably be insecure somehow.

#### Password reset
Devise allows for password reset.

#### Github login
The app supports login with GitHub. By logging in with GitHub your email and name will be automatically stored in the app's database.

### Users Table
At the root of the app is a table that displays five user fields, user id, email, name, favorite game, and a space for an edit action. The email is captured from the user sign up, but the name and favorite game fields will be blank to start off unless a user adds them through the edit action.

### Bar Chart
As part of the test, I was asked to
>provide a very basic bar chart showing the total number of signups per day, skipping days that have zero.

In order to complete this feature, I chose to use a JavaScript data visulisation library called Data Driven Documents (more commonly known as D3). D3 works by using JavaScript to append SVGs (and other html elements) to the DOM and sizing and styling these elements based on data read in a variety of ways. Although I've used D3 before, what I found unusual about this instance was that I was sourcing the data from the DOM and not from an external file or source, which was new for me!

The data is served to the front end by appending a JSON created in the controller to the data element of a div created using the Rails `content_tag` helper.

Finally, all the JavaScript and CSS for the bar chart is served via Rails' asset pipeline, which means that in production it will be minified and precompiled.

## Testing
There aren't a whole lot of tests for this project because a large portion of the work was focused around the database, the GitHub integration (which is very hard to test drive because you can't mock GitHub's server!), and the creation of the bar chart. However, before writing any Rails code, I did create a sign up feature test that guided me through the process of creating a signup flow that ended with the user on the root viewing all other users in a table.
