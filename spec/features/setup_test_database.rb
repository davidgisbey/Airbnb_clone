require_relative "../../lib/database_connection.rb"
require 'bcrypt'

def setup_test_database
  Database_connection.connect

  enc_password = BCrypt::Password.create('password')

  Database_connection.sql("DROP TABLE users CASCADE;")
  Database_connection.sql("DROP TABLE spaces CASCADE;")
  Database_connection.sql("DROP TABLE availability CASCADE;")
  Database_connection.sql("DROP TABLE bookings CASCADE;")

  Database_connection.sql("CREATE TABLE users (
    id serial PRIMARY KEY,
    username varchar(60) UNIQUE,
    name varchar(60),
    email varchar UNIQUE,
    password varchar
  );

  CREATE TABLE spaces (
    id serial PRIMARY KEY,
    user_id int REFERENCES users(id),
    property_name varchar,
    price_in_pence int,
    property_description text
  );

  CREATE TABLE availability (
    id serial PRIMARY KEY,
    space_id int REFERENCES spaces(id),
    start_date date,
    end_date date
  );

  CREATE TABLE bookings(
    id serial PRIMARY KEY,
    space_id int REFERENCES spaces(id),
    user_id int REFERENCES users(id),
    start_date date,
    end_date date,
    accepted BOOLEAN DEFAULT NULL
  );

  insert into users (username, name, email, password)
  values ('david', 'David G', 'david@email.com', '#{enc_password}'),
  ('Michael', 'Michael', 'michael@email.com', '#{enc_password}'),
  ('Nim', 'Nim', 'nim@email.com', '#{enc_password}'),
  ('Abdi', 'Abdi', 'abdi@email.com', '#{enc_password}'),
  ( 'Alex', 'Alex', 'Email@email.com', '#{enc_password}');


  insert into spaces (user_id, property_name, price_in_pence, property_description)
  values (1, 'David''s house', 10000, 'This is a house where david lives most of the time'),
   (2, 'The Stockport viaduct', 20, 'stay for a night underneath the stockport viaduct in Michael''s home town. Only 20p!');

  insert into availability (space_id, start_date, end_date)
  values( 1, '2019-01-01', '2019-02-28'),
       ( 1, '2019-03-14', '2019-03-24'),
       ( 2, '2019-01-02', '2019-12-01');

  insert into bookings (space_id, user_id, start_date, end_date, accepted)
  values( 1, 3, '2019-01-10', '2019-01-13', NULL),
             ( 2, 5, '2019-11-01', '2019-11-20', TRUE),
             (2,5, '2019-05-1', '2019-05-10', FALSE);
             ")

end
