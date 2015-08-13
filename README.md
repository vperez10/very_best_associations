# Very Best / Associations

## Introduction

Do you remember who serves your favorite bagel in Chicago? How about your favorite burger? This application will allow you to keep track.

### Note:

**Users cannot currently sign in.** We'll study how to achieve that next week. **For now, just assume that the admin of the site is doing all of the data entry**, so you will call in when you love a dish somewhere and the admin will select your username from a dropdown when recording that info in the app.

[Here is your target.](https://verybest-associations-target.herokuapp.com/)

## Domain Model

At a minimum, it seems like we'll need CRUD resources for users, dishes, and venues.

**Note:** In this model, a `Dish` is not the specific burger at Au Cheval -- a `Dish` is the general category, "Burger".

What are the relationships between these models?

 - Can a user be associated to many venues? Yes
 - Can a venue be associated to many users? Yes
 - Thus, it's a many-to-many and we need a join model.

What is a good name for the join model between users and venues? Perhaps Review? Or Favorite? Let's go with Favorite.

So, at a minimum, the favorites table will need two foreign keys: `user_id` and `venue_id`. Are there any other useful things to record about each favorite? Well, yes; crucially, which dish it was that I liked at that particular venue.

Thus the central resource in this application is **Favorites**. A favorite belongs to a user and specifies a particular restaurant and a particular dish. For example, my favorite burger in Chicago is served at Au Cheval. Yours might be at Umami Burger. So the favorites table looks like this:

    Favorite:
      user_id: integer
      dish_id: integer
      venue_id: integer
      notes: text

The notes column exists so that users can remember additional info on a dish if they choose to, e.g., what extras to add.

Essentially, a Favorite joins a User, a Dish, and a Venue.

And, the supporting cast of models in the app are as follows:

    User:
      username: string

    Cuisine:
      name: string

    Dish:
      name: string
      cuisine_id: integer

    Venue:
      name: string
      address: string
      neighborhood_id:integer

    Neighborhood:
      name: string
      city: string

Every table also has it's own `id: integer` column, of course. Also, every table has automatically managed `created_at` and `updated_at` columns.

`Cuisine` is simply a category that `Dish`es belong to, and `Neighborhood` is a category that `Venue`s belong to.

**I have already generated the above tables using the starter_generators gem.** So, right now, the application technically *works*; we can CRUD users, cuisines, dishes, venues, neighborhoods, and favorites. But the interface is *horrible* -- just the standard boilerplate that the generator spits out.

**Your job is going to be to improve the interface of this application using what you've learned about Associations.**

## Setup

 1. First **fork** and *then* clone your fork of this repository.
 1. `cd` into the application's root folder.
 1. `bundle install`
 1. `rake db:migrate`
 1. `rake db:seed`
 1. `rails s`

Navigate to [http://localhost:3000](http://localhost:3000) and click around to familiarize yourself with the application. **Note that I've provided some seed data for you so that you can get straight to work instead of wasting time creating a bunch of rows in each table.**

## Part 1: Add Validations

Go through each of the files in `app/models` and,
  for each model,
    for each column,
      add any validation rules that you think make sense for that column.

For example, I think it makes sense to require that usernames are both present and unique for a row in the User table:

```ruby
class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
end
```

[Here is a list of available validation helpers.](http://guides.rubyonrails.org/active_record_validations.html#validation-helpers) Ninety-nine times out of a hundred, the ones that you care about are `presence` and `uniqueness`.

A slightly more advanced use of the `uniqueness` helper allows you to make sure that the combination of two column values is unique, even though either one alone can be duplicated. For example,

```ruby
class Venue < ActiveRecord::Base
  validates :name, :uniqueness => { :scope => :address }
end
```

Now, I can add two venues with the name "Xoco", but only if their addresses are different.

Other rules to include:

 - Cuisine name should be present and unique
 - Dish name should be present and unique
 - Dish cuisine_id should be present
 - Venue name should be present
 - Venue neighborhood_id should be present
 - Neighborhood name should be present
 - Neighborhood name/city combination should be unique
 - Favorite user_id, venue_id, and dish_id should be present.

## Part 2: Add Associations

Go through each of the files in `app/models` and,
  for each model,
    if it has a foreign key column,
      add the `belongs_to` statement, and
      also add the `has_many` statement to the associated model.

For example, we see that the dishes table has a `cuisine_id` column. This is because we identified a one-to-many relationship between Cuisines and Dishes (a cuisine can have many dishes, a dish belongs to a cuisine).

Now, we should add the `belongs_to`/`has_many` methods to make it easy to utilize this connection:

```ruby
class Dish < ActiveRecord::Base
  belongs_to :cuisine
end
```

```ruby
class Cuisine < ActiveRecord::Base
  has_many :dishes
end
```

**Note that singular vs. plural is significant.** When you read it out loud, it should make sense. "A cuisine has many dish" doesn't make sense, and is wrong.

Do the same thing for all of the other one-to-many relationships that we have:

 - A neighborhood has many venues, a venue belongs to a neighborhood.
 - A user has many favorites, a favorite belongs to a user.
 - A venue has many favorites, a favorite belongs to a venue.
 - A dish has many favorites, a favorite belongs to a dish.

All in all, you should have added five pairs of `has_many`/`belongs_to` associations.

## Part 3: Add Dropdowns

Go through each of the forms in `app/views` and,
  for each form,
    if it has a text input for a foreign key column,
      replace it with a dropdown.

For example, the dishes#new view template has an `<input type="text" name="cuisine_id">`. We should be kind to our users and not force them to figure out and type in an ID number; instead, let them choose from a dropdown.

The `select_tag` helper method to the rescue:

```ruby
select_tag(:cuisine_id, options_from_collection_for_select(Cuisine.all, :id, :name, @dish.cuisine_id), :class => "form-control")
```

This is the longest helper method I've ever seen, but that's because it does a lot of work for us -- drawing the list of options and pre-selecting one of them.

When you write your own, replace the following with:

 - `:cuisine_id` - name of the column you are trying to populate
 - `Cuisine.all` - the array of rows you want the user to choose from
 - `:id` - the attribute to use to populate the column (almost always `:id`)
 - `:name` - the attribute you want the user to see in the box
 - `@dish.cuisine_id` - the value to pre-select (almost always matches first argument)
 - `:class => "form-control"` - whatever CSS class you want to apply to the final `<select>` element that this method produces. Since we are using Bootstrap, this is almost always `"form-control"`.

Similarly, go through and replace the `<input type="text">` with dropdowns for:

 - dishes#edit: `cuisine_id`
 - venues#new and venues#edit: `neighborhood_id`
 - favorites#new and favorites#edit: `user_id`, `dish_id`, and `neighborhood_id`

Now, if you want to, you can easily add a few of your own venues, dishes, and favorites. Before we added the dropdowns, it would have been hard.

## Part 4: Remove Raw Foreign Keys From Views

Our users should never have to see ID numbers in the HTML. Right now, the generated views display raw foreign key column values. Go through and improve each of these views to display something descriptive rather than IDs. For example, on the dishes#show page, replace

    <%= @dish.cuisine_id %>

with

    <%= @dish.cuisine.name %>

This is the power of the work we did in Part 2 to add all of our `belongs_to` associations.

Other views that require fixing:

 - dishes#index (displays `cuisine_id`)
 - venues#show (displays `neighborhood_id`)
 - venues#index (displays `neighborhood_id`)
 - favorites#show (displays `user_id`, `dish_id`, and `neighborhood_id`)
 - favorites#index (displays `user_id`, `dish_id`, and `neighborhood_id`)

## Part 5: Display Associated Collections

The real power of this app comes from being able to see collections of associated objects. As a user, I want to

 - see a list of venues located in a neighborhood on the neighborhoods#show page (print venue names)
 - see a list of dishes that belong to a cuisine on the cuisines#show page (print dish names)
 - see a list of favorites on the dishes#show page (print venue names and usernames)
 - see a list of favorites on the venues#show page (print dish names and usernames)
 - And, the most crucial part: **on the users#show view, display a list of the user's favorites (which dish and which venue).**

Because of the work we did in Part 2, retrieving associated collections is as easy as

    @user.favorites

Loop through them in the view and display the associated venue's name and dish's name. You can decide what markup to use to make it look nice.

## Part 6: Quick Add Forms

At the bottom of each associated collection, add a form to quickly add a new record to that collection. You'll want to use an `<input type="hidden" value="">` and pre-populate it with the correct foreign key.

## Part 7: has_many/through

On the show page for a neighborhood, display all of the favorites that are in that neighborhood. You can use the `:through` option to achieve this easily:

```ruby
class Neighborhood < ActiveRecord::Base
  has_many :venues
  has_many :favorites, :through => :venues
end
```

Now, in the view (or anywhere else you have a Neighborhood object), you can do

    @neighborhood.favorites

And then loop through to display them exactly as you did on users#show.

## Part 8 (nothing to submit)

Now that you've gotten some hands-on experience with associations, it's time to nail down your domain model for your app idea. With that in hand, you'll be able to rapidly prototype it next week.

What are the CRUD resources you need in your app? In other words, what are the central *things* you need to keep track of information about?

Use the [Ideas feature in First Draft](http://www.firstdraft.com/ideas) to help solidify your domain model. You can skip the sketches and stories, but if you enter your tables and columns, the tool will help you with your code.

Treat users as just another CRUD table, like we did in this project; next week we'll see how to allow people to sign in.

**Ask lots of questions**. Good luck!
