/* INSERT INTO USERS TABLE */

INSERT INTO users (name, email, password)
VALUES ('Judith Scott', 'judith.scott@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Eugene Baker', 'eugene.baker@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('elmer beck', 'elmer.beck@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('ralph graham', 'ralph.graham@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('brandy day', 'brandy.day@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('tristan daniels', 'tristan.daniels@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('brandy day', 'brandy.day@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('tristan daniels', 'tristan.daniels@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');



/* INSERT INTO PROPERTIES TABLE */

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES(1, 'Droaloc Bluff', 'description','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500','https://www.pexels.com/photo/home-real-estate-106399/',300,2,3,4, 'Canada', '4489 Galts Ave', 'Red Deer', 'Alberta', 'T4N 2A6', true),
(1, 'Grabmark Road', 'description','https://www.pexels.com/photo/architecture-clouds-estate-exterior-280222/','https://www.pexels.com/photo/architecture-beautiful-home-building-class-280229/',150,1,1,2, 'Canada', '2652  Adelaide St', 'Toronto', 'Ontario', 'M5H 1P6', true),
(2, 'Sparkash Tarn', 'description','https://images.pexels.com/photos/2079234/pexels-photo-2079234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500','https://images.pexels.com/photos/2079234/pexels-photo-2079234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',500,3,3,5, 'Canada', '2885 Cassells St', 'North Bay', 'Ontario', 'P1B 2Y7', true),
(4, 'Oxpage City', 'description','https://images.pexels.com/photos/2439595/pexels-photo-2439595.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500','https://images.pexels.com/photos/2439595/pexels-photo-2439595.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',800,4,5,6, 'Canada', '4668 Blanshard', 'Victoria', 'British Columbia', 'V8W 2H9', true),
(5, 'Halfdown Falls', 'description', 'https://www.pexels.com/photo/white-and-red-wooden-house-with-fence-1029599/','https://www.pexels.com/photo/white-and-red-wooden-house-with-fence-1029599/',50,0,1,1, 'Canada', '2999  Hamilton Street', 'Esterhazy', 'Saskatchewan', 'S4P 3Y2', true),
(6, 'Joushas Valley', 'description', 'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500','https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',200,2,2,1, 'Canada', '1454 Richmond Street', 'Oshawa', 'Ontario', 'S4P 3Y2', true),
(7, 'Breadmare Crossing', 'description', 'https://images.pexels.com/photos/1370704/pexels-photo-1370704.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500','https://images.pexels.com/photos/1370704/pexels-photo-1370704.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',1000,3,3,6, 'Canada', '3432 Hastings Street', 'Vancouver', 'British Columbia', 'V6C 1B4', true),
(8, 'Erox Forest', 'description', 'https://images.pexels.com/photos/209315/pexels-photo-209315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'https://images.pexels.com/photos/209315/pexels-photo-209315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' ,220,1,2,4, 'Canada', '2270 Halsey Avenue', 'Toronto', 'Ontario',' M3B 2W6', true);


/* INSERT INTO RESERVATIONS TABLE */

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11','2018-09-26',2, 3),
('2018-01-04','2019-02-01',2, 2),
('2021-10-01','2021-10-14',1, 4),
('2014-10-21','2014-10-21',3, 5),
('2016-07-17','2016-08-01',3, 4),
('2018-05-01','2018-05-27',4, 8),
('2022-10-04','2022-10-23',5, 1),
('2015-09-13','2015-09-30',6, 8),
('2023-05-27','2023-05-28',4, 2),
('2023-04-23','2023-05-02',8, 1);


/* INSERT INTO PROPERTIES REVIEWS TABLE */

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (2,1,10,3, 'message'),
(1,4,1,4, 'message'),
(8,1,2,4, 'message'),
(3,8,5,4, 'message'),
(4,2,7,5, 'message'),
(4,2,4,4, 'message'),
(5,6,3,5, 'message');
