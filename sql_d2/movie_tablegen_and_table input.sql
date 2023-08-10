CREATE TABLE guest(
	guest_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150)
);

CREATE TABLE theater(
	theater_num SERIAL PRIMARY KEY,
	total_seats INTEGER,
	theater_type VARCHAR(50)
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(150),
	age_rating VARCHAR(10),
	genre VARCHAR(150),
	theater_num INT REFERENCES theater(theater_num)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES guest(guest_id),
	movie_id INT REFERENCES movie(movie_id),
	seat_num VARCHAR(10),
	ticket_price NUMERIC(8,2)
);


CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	concession_name VARCHAR(150),
	concession_price NUMERIC(8,2),	
	ticket_id INT REFERENCES ticket(ticket_id)
);



-- BELOW IS THE QUERIES TO INPUT DATA INTO 

INSERT INTO customer(customer_id, first_name, last_name, email)
VALUES('01','Sifu','Hotman','notaang@gmail.com');
INSERT INTO customer(customer_id, first_name, last_name, email)
VALUES('02','Pipin','Paddleopsicopolis','notmomo@gmail.com');

INSERT INTO theater(theater_num, total_seats, theater_type)
VALUES('14','80','IMAX');
INSERT INTO theater(theater_num, total_seats, theater_type)
VALUES('06','100','standard');

INSERT INTO movie(movie_id, movie_name, age_rating, genre, theater_num)
VALUES('001', 'Pokemon: Mewtwo Strikes Back', 'PG', 'animated', '14');
INSERT INTO movie(movie_id, movie_name, age_rating, genre, theater_num)
VALUES('002', 'Deadpool', 'R', 'comedy', '06');

INSERT INTO ticket(ticket_id, customer_id, movie_id, seat_num, ticket_price)
VALUES('23','01','001','G6','17.99');
INSERT INTO ticket(ticket_id, customer_id, movie_id, seat_num, ticket_price)
VALUES('42','02','002','H7','7.99');

INSERT INTO concession(concession_id, concession_name, concession_price, ticket_id)
VALUES('pop003','large_popcorn','15.99','23');
INSERT INTO concession(concession_id, concession_name, concession_price, ticket_id)
VALUES('sod106','large_fountain_drink','13.99','42');