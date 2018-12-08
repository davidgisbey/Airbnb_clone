require "./lib/Database_connection.rb"

Database_connection.connect

Database_connection.sql("INSERT INTO users (username, name, email, password)
VALUES ('david', 'David G', 'david@email.com', 'password1'),
('Michael', 'Michael', 'michael@email.com', 'password2'),
('Nim', 'Nim', 'nim@email.com', 'password3'),
('Abdi', 'Abdi', 'abdi@email.com', 'password4'),
( 'Alex', 'Alex', 'Email@email.com', 'password5');


INSERT INTO spaces (user_id, property_name, price_in_pence, property_description)
VALUES (1, 'David''s house', 10000, 'This is a house where david lives most of the time'),
  (2, 'The Stockport viaduct', 20, 'stay for a night underneath the stockport viaduct in Michael''s home town. Only 20p!');

INSERT INTO availability (space_id, start_date, end_date)
values( 1, '2019-01-01', '2019-02-28'),
      ( 1, '2019-03-14', '2019-03-24'),
      ( 2, '2019-01-02', '2019-12-01');

INSERT INTO bookings (space_id, user_id, start_date, end_date, accepted)
VALUES( 1, 3, '2019-01-10', '2019-01-13', NULL),
            ( 2, 5, '2019-11-01', '2019-11-20', TRUE),
            (2,5, '2019-05-1', '2019-05-10', FALSE);")
