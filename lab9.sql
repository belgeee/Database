CREATE DATABASE HotelDatabase;

CREATE TABLE Hotel (
	hotelNo CHAR(4) NOT NULL UNIQUE,
	hotelName VARCHAR(30) NOT NULL,
	city VARCHAR(30),
	PRIMARY KEY (hotelNo)
)

INSERT INTO Hotel (hotelNo, hotelName, city)
VALUES ('UB11', 'Ulaanbaatar Hotel', 'Ulaanbaatar'),
	('UB34', 'Bayngol Hotel', 'Ulaanbaatar'),
	('DM24', 'Diamond Hotel', 'London'),
	('ST78', 'Star Hotel', 'Moscow'),
	('SB75', 'Soft Bed Hotel', 'Tokyo');
	
CREATE TABLE Room (
	roomNo CHAR(4) NOT NULL UNIQUE,
	hotelNo CHAR(4) NOT NULL,
	bed INT NOT NULL,
	price INT NOT NULL,
	PRIMARY KEY (roomNo),
	FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
)

INSERT INTO Room (roomNo, hotelNo, bed, price)
VALUES ('U203', 'UB34', 2, 250),
	('D516', 'DM24', 3, 500),
	('D609', 'DM24', 2, 400),
	('S301', 'SB75', 1, 400),
	('B804', 'UB11', 3, 750),
	('U703', 'UB34', 3, 400),
	('T526', 'ST78', 1, 530),
	('D105', 'DM24', 2, 450),
	('U303', 'UB34', 3, 450),
	('T410', 'ST78', 2, 900),
	('T510', 'ST78', 3, 140),
	('B600', 'UB11', 2, 400),
	('S707', 'SB75', 1, 400),
	('S708', 'SB75', 3, 900);

CREATE TABLE Booking (
	hotelNo CHAR(4) NOT NULL,
	roomNo CHAR(4) NOT NULL,
	guestNo CHAR(5) NOT NULL,
	dateFrom DATE NOT NULL,
	dateTo DATE NOT NULL,
	PRIMARY KEY (guestNo),
	FOREIGN KEY (roomNo) REFERENCES Room(roomNo),
	FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
)

INSERT INTO Booking (hotelNo, roomNo, guestNo, dateFrom, dateTo)
VALUES ('ST78', 'T410', 'T410A', '2022-5-21', '2022-5-22'),
	('ST78', 'T510', 'T510C', '2022-7-5', '2022-8-5'),
	('DM24', 'D105', 'D105A', '2022-1-1', '2022-1-5'),
	('UB11', 'B804', 'B804F', '2022-7-29', '2022-8-10'),
	('UB34', 'U703', 'U703R', '2022-3-3', '2022-4-1'),
	('SB75', 'S707', 'S707H', '2022-5-3', '2022-5-11'),
	('SB75', 'S707', 'S707D', '2022-11-2', '2022-11-16'),
	('UB34', 'U303', 'U303A', '2022-6-3', '2022-6-7'),
	('SB75', 'S708', 'S708C', '2022-8-8', '2022-8-10'),
	('ST78', 'T526', 'T526F', '2022-9-3', '2022-11-13'),
	('DM24', 'D105', 'D105G', '2022-5-30', '2022-6-1'),
	('DM24', 'D105', 'D105T', '2022-7-21', '2022-7-24'),
	('UB11', 'B804', 'B804H', '2022-11-5', '2022-11-10'),
	('DM24', 'D609', 'D609R', '2022-10-30', '2022-11-29'),
	('ST78', 'T410', 'T410B', '2022-3-18', '2022-3-25');

CREATE TABLE Guest (
	guestNo CHAR(5) NOT NULL UNIQUE,
	guestName VARCHAR(30) NOT NULL,
	guestAddress VARCHAR(30) NOT NULL,
	phoneNumber VARCHAR(30) NOT NULL,
	FOREIGN KEY(guestNo) REFERENCES Booking(guestNo)
)

INSERT INTO Guest (guestNo, guestName, guestAddress, phoneNumber)
VALUES ('S707H', 'John', '22 Deer Rd', '99900980'),
	('S707D', 'Tony', '16 Argyll St', '95647832'),
	('U303A', 'Bat', '163 Main St', '98888070'),
	('S708C', 'Mark', '32 Manse Rd', '99693049'),
	('T526F', 'Arthur', '56 Clover Rd', '94657686'),
	('D105G', 'Sam', '2 Fergus Dr', '85757678'),
	('D105T', 'Tor', '6 Achray st', '99899925'),
	('B804H', 'Bold', '63 Well St', '91774418'),
	('D609R', 'Kane', '12 Park Pl', '90290969'),
	('T410B', 'Robert', '13 Clover St', '91310969');

#1.
SELECT h.city, h.hotelName, r.roomNo, r.price
FROM Room r, Hotel h
WHERE r.hotelNo = h.hotelNo
ORDER BY r.price;
#2.
SELECT r.*, h.*
FROM room r, hotel h
WHERE r.hotelNo = h.hotelNo AND r.price BETWEEN 100 AND 300;
#3.
SELECT h.*
FROM hotel h, room r
WHERE h.hotelNo = r.hotelNo
GROUP BY h.hotelNo HAVING COUNT(r.roomNo)
ORDER BY COUNT(r.roomNo) DESC
LIMIT 1;
#4.
SELECT h.hotelNo, COUNT(r.roomNo), MAX(r.price), MIN(r.price), AVG(r.price)
FROM hotel h, room r
WHERE h.hotelNo = r.hotelNo
GROUP BY h.hotelNo HAVING COUNT(r.roomNo);
#5.
SELECT h.*, r.*
FROM guest g, booking b, hotel h, room r
WHERE g.guestName = 'Mark' AND g.guestNo = b.guestNo AND 
	b.hotelNo = h.hotelNo AND b.roomNo = r.roomNo;
#6.
SELECT b.roomNo, r.bed, r.price, g.guestName, g.phoneNumber, h.city, h.hotelName
FROM booking b, room r, guest g, hotel h
WHERE NOW() BETWEEN dateFrom AND dateTo AND b.roomNo = r.roomNo 
	AND b.hotelNo = h.hotelNo AND g.guestNo = b.guestNo;
#7.
SELECT roomNo, DATEDIFF(dateTo, NOW())
FROM booking
WHERE NOW() BETWEEN dateFrom AND dateTo;
#8.
SELECT *, COUNT(roomNo)
FROM booking
GROUP BY roomNo
ORDER BY COUNT(roomNo) DESC
LIMIT 1;
#9.
SELECT h.*
FROM hotel h, room r, booking b
WHERE NOT NOW() BETWEEN b.dateFrom AND b.dateTo AND r.price < 300 AND r.hotelNo = h.hotelNo
	AND r.roomNo = b.roomNo;
#10.
SELECT DATEDIFF(b.dateTo, b.dateFrom), g.guestNo, g.guestNo, h.hotelNo, h.city, r.roomNo, r.price
FROM guest g, hotel h, booking b, room r
WHERE h.hotelNo = r.hotelNo AND 
	r.roomNo = b.roomNo AND b.guestNo = g.guestNo
ORDER BY DATEDIFF(b.dateTo, b.dateFrom) DESC
LIMIT 1;





