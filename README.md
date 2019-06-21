# What the application does

The Lysty app allows users to save lists of whatever products they wish to purchase.

![](https://media.giphy.com/media/69Eh3RcwqXAKZwj6O2/giphy.gif)

This application allows you to view various products and add them to a list. The products are sold in specific stores and you can see which stores your products are sold in as well as the inventories of the stores.

At this time, the application is not currently being hosted on a website but we do plan to release it at a later date

# Requirements and Setup

![](https://media.giphy.com/media/T5nP7Nwu5FzMc/giphy.gif)

* Ruby version

This application uses Ruby version 2.6.3.

* Configuration

At this time, you will need to clone down the repository to begin using the application.

* Database creation

Lysty uses postgresql so you can run rails db:setup to setup your local database.

* Database initialization

You will need to use rails db:seed to seed your postgresql database with our current seed data.

# Using the application

Once you have your database setup you can run rails s in your terminal to begin running your local server. You can then navigate to localhost:3000 and use the application.

![](https://media.giphy.com/media/CjmvTCZf2U3p09Cn0h/giphy.gif)

As a user you can signup and login to the site, you can add products to your lists, create new lists view all of the product and store information, update your account information, and edit your lists.

There are also several different filters which are available to users. The my stores filter on the home page allows a user to see which stores the products on their lists are sold in. Similarly the my products filter will display all of the products that are found in a users lists. Users also have the option to see which stores sell the products on a specific list from that lists page. The products also have an out of stock indicator that is displayed wherever you can see the product information.

Once we have deployed this application to a hosting service we will include a link to the website as well.
