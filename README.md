# MakersBnB

We were tasked to build a clone of Airbnb called 'Makersbnb'. The following specifications were provided by the 'client':

>We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

>Headline specifications
* Any signed-up user can list a new space.
* Users can list multiple spaces.
* Users should be able to name their space, provide a short description of the space, and a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night.

---
### Running the app

1. Install [PostgreSQL](http://www.postgresqltutorial.com/install-postgresql/), and then execute the following in order
2. `$ bundle`
3. `$ psql postgres`
4. `$ CREATE DATABASE airbnb;`
5. `$ CREATE DATABASE airbnb_test;`
6. To create the tables within each database,  run the appropriate SQL queries, found in the [migrations folder](db/migrations), within PostgreSQL
7. `$ rackup`
8. In your browser, connect to `http://localhost:9292/`

---
### Structure of the databases

We have a production and a development database with the following tables and fields:

table  | fields
-------|------------
availability | id (PK); space_id (FK); start_date; end_date
bookings     | id (PK); space_id (FK); user_id (FK); start_date; end_date, accepted
spaces       | id (PK); user_id (FK); property_name; price_in_pence; property_description
users        | id; username (Uniq); name; email (Uniq); password

---
### Testing
Automated tests use the bundled RSpec gem. Run with:

`$ rspec`

Code styling tests use the bundled Rubocop gem. Run with:

`$ rubocop`

---
### Authors

* David Gisbey
* Nim Kirubakaran
* Alex Newton
* Abdi Obsiye
* Michael Slevin
* Wayne Stevens
