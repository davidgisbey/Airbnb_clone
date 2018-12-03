CREATE TABLE users (
  id serial PRIMARY KEY,
  username varchar(60) UNIQUE,
  name varchar(60),
  email varchar,
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
