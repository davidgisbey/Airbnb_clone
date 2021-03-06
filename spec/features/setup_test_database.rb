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

  INSERT INTO users (username, name, email, password)
  VALUES ('david', 'David G', 'david@email.com', '#{enc_password}'),
  ('Michael', 'Michael', 'michael@email.com', '#{enc_password}'),
  ('Nim', 'Nim', 'nim@email.com', '#{enc_password}'),
  ('Abdi', 'Abdi', 'abdi@email.com', '#{enc_password}'),
  ( 'Alex', 'Alex', 'Email@email.com', '#{enc_password}');


  INSERT INTO spaces (user_id, property_name, price_in_pence, property_description)
  VALUES (1, 'David''s house', 10000, 'This is a house where david lives most of the time'),
   (2, 'The Stockport viaduct', 20, 'stay for a night underneath the stockport viaduct in Michael''s home town. Only 20p!');

  INSERT INTO availability (space_id, start_date, end_date)
  VALUES( 1, '2019-01-07', '2019-01-09'),
       ( 1, '2019-01-01', '2019-01-05');

  INSERT INTO bookings (space_id, user_id, start_date, end_date, accepted)
  VALUES( 1, 3, '2019-01-10', '2019-01-13', NULL),
             ( 2, 5, '2019-01-18', '2019-01-20', TRUE),
             (2,5, '2019-01-08', '2019-01-10', FALSE),
             (2,5,'2019-01-03', '2019-01-04', TRUE);")

end
