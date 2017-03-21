# README

## About the app

Welcome to food4u! This is a site for helping people eat all of the food they buy *before* they go bad. Check out this site [live](food4u-app.herokuapp.com).

Once a user makes an account (on live site, use dummy account: email bob@dylan.com password 123456), they can follow this easy use cycle:

1. Make a shopping list
2. Check of items they puchased and add them to their kitchen
3. In the kitchen view, they see a list of their food in the order of what will go bad sooner
4. When a food is eaten or thrown away, add it back to the shopping list if you want more!

At any time, the user can also view a handy data page to review their food waste habits.

## About the code

### How we wrote it
We used the Rails framework to build this app, with the help of these additional Gems:
*devise
*bootstrap-sass
*data confirm modal

The data about food shelf-life comes from [Shelf Life API](https://github.com/jcomo/ShelfLife), and the graph was programmed using the JavaScript library [D3.js](https://d3js.org/).

### Run it yourself
food4u was written in `Ruby 2.3.1` on `Rails 5.0.2`. If you clone or fork this project in order to run it locally, make sure you do the following:

* Have the correct versions of Ruby and Rails running (check using `ruby -v` and `rails -v`). If you are behind, update. If you are ahead, use a version manager.
* Run `bundle update` and then `bundle`
* Run `rake db:migrate`
* Run `rails -s` and the navigate your browser to (http://localhost:3000/)
