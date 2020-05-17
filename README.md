# Week 6

## The Hacking Project - Eventbrite-like

#### [Click here to access the website on Heroku](https://thp-eventbrite-magic.herokuapp.com/)

Eventbrite-like is a web app which allows Users to view, create, share and take parts to events published on the platform. 

## Ruby & Rails versions

* Ruby 2.5.1
* Rails 5.2.4

## Installing and Launching

To start app, you may have to do : <br />

* $ heroku run rails db:migrate:status
* $ heroku run rails db:create
* $ heroku run rails db:migrate
* $ heroku run rails db:seed

Otherwise, if you ever run this app on <em> localhost:3000 </em>, please do :

* $ bundle install
* $ rails db:create
* $ rails db:migrate
* $ rails db:migrate:status
* $ rails db:seed
* $ rails server

If you encounter an error like 'user already connected on localhost', you may use :

* $ lsof -wni tcp:4567  <br /> 
and fetch the PIB number

Then do : <br />

* $ kill -9 [PIB]

## Database initialization

To fulfill the database with data run: 

* $ rails db:seed
