CREATE TABLE Hotel(
hotelNo VARCHAR(4),
hotelName VARCHAR(10),
city VARCHAR(10),
PRIMARY KEY(hotelNo) );

INSERT INTO Hotel(hotelNo,hotelName,city)
VALUES ("H001","Havana","London"),
      ("H002","Bayngol","Glasgow"),
      ("H003","Tiger","London"),
      ("H004","ABCD","Aberdeen"),
      ("H005","Bingo","Bristol");
      
CREATE TABLE Room(
roomNo VARCHAR(4),
hotelNo VARCHAR(4),
bed INT,
price INT,
PRIMARY KEY (roomNo),
FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo));

INSERT INTO Room(roomNo,hotelNo,bed,price)
VALUES ("Hav1","H001",1,100),
("Hav2","H001",2,200),
("Hav3","H001",3,300),
("Bay1","H002",1,110),
("Bay2","H002",2,220),
("Bay3","H002",3,330),
("Tig1","H003",1,100),
("Tig2","H003",2,200),
("Tig3","H003",3,300),
("ABC1","H004",1,200),
("ABC2","H004",2,400),
("ABC3","H004",3,500),
("Bin1","H005",1,50),
("Bin2","H005",2,100),
("Bin3","H005",3,150),
("Bin4","H005",4,200);

CREATE TABLE Booking(
hotelNo VARCHAR(4),
roomNo VARCHAR(4),
guestNo VARCHAR(4),
dateFrom DATE,
dateTo DATE,
FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo),
FOREIGN KEY (roomNo) REFERENCES Room(roomNo),
FOREIGN KEY (guestNo) REFERENCES Guest(guestNo));

 INSERT INTO Booking(hotelNo,roomNo,guestNo,dateFrom,dateTo)
 VALUE ("H001","Hav1","G1","2022-09-13","2022-11-02"),
 ("H001","Hav2","G2","2022-10-13","2022-11-02"),
 ("H001","Hav3","G3","2022-10-12","2022-11-02"),
 ("H002","Bay1","G4","2022-09-13","2022-11-02"),
 ("H002","Bay2","G5","2022-10-3","2022-11-02"),
 ("H002","Bay3","G6","2022-10-23","2022-11-02"),
 ("H003","Tig1","G7","2022-09-14","2022-11-02"),
 ("H003","Tig2","G8","2022-10-11","2022-11-02"),
 ("H003","Tig3","G9","2022-10-09","2022-11-02"),
 ("H004","ABC1","G10","2022-09-07","2022-11-02"),
 ("H004","ABC2","G11","2022-10-04","2022-11-02"),
 ("H004","ABC3","G12","2022-10-03","2022-11-02"),
 ("H005","Bin1","G13","2022-09-02","2022-11-02"),
 ("H005","Bin2","G14","2022-10-01","2022-11-02"),
 ("H005","Bin4","G15","2022-11-11","2022-11-02");
 
 CREATE TABLE Guest(
 guestNo VARCHAR (4),
 guestName VARCHAR(15),
 guestAddress VARCHAR(20),
 phonenumber INT,
 PRIMARY KEY (guestNo));
 
 INSERT INTO Guest(guestNo,guestName,guestAddress,phonenumber)
 VALUES ("G1","Ganbaatar","Aberdeen G35 XS8",80499918),
 ("G2","Ganbat","London G39",80499918),
 ("G3","Altansukh","6 Arches st",80499918),
 ("G4","Belgedemberel","Glasgow",80499918),
 ("G5","Darmaabazar","12 Park Pl",80499918),
 ("G6","Darmaabaatar","Darkhan",80499918),
 ("G7","Hulan","5 shar",80499918),
 ("G8","Munkhduld","Baynbvrd",80499918),
 ("G9","Hurelsukh","120 myngat",80499918),
 ("G10","Tsenguun","13 horoolol",80499918),
 ("G11","Damdin","10 horoolol",80499918),
 ("G12","Bold","1 horoolol",80499918),
 ("G13","Hvslen","10 horoolol",80499918),
 ("G14","AMidral","13 horoolol",80499918),
 ("G15","Bat","1 horoolol",80499918);
 
 

 1 
SELECT h.*, r.roomNo, r.price
FROM hotel h, room r
ORDER BY r.price DESC

2
SELECT h.*, r.*
FROM hotel h, room r
WHERE r.price>100 AND r.price<300

3
SELECT h.*, r.*, COUNT(roomNo)
FROM room r, hotel h
GROUP BY roomNo HAVING COUNT(roomNo)
ORDER BY roomNo LIMIT 1;

4
SELECT AVG(price), MAX(price), MIN(price), COUNT(b.roomNo), guestNo
FROM hotel h, room r, booking b
GROUP BY guestNo

5
SELECT h.*, r.*
FROM hotel h, room r, guest g, booking b
WHERE g.guestNo=b.guestNo AND r.hotelNo=h.hotelNo AND g.guestName="Tsenguun" AND b.hotelNo=h.hotelNo AND b.hotelNo=r.hotelNo;


6
SELECT dateto NOW,r.roomNo, r.bed, r.price, g.guestName, g.phonenumber, h.city
FROM booking b, hotel h, guest g, room r
WHERE r.hotelNo=h.hotelNo AND g.guestNo=b.guestNo AND b.hotelNo=h.hotelNo AND (NOW() BETWEEN dateFrom AND dateTo);

7

8
SELECT COUNT(guestNo), r.*
FROM room r, guest g
GROUP BY guestNo HAVING COUNT(guestNo)
ORDER BY guestNo LIMIT 1;

9
SELECT h.*, r.*
FROM hotel h, room r
WHERE r.rent ALL<300 AND r.hotelNo=h.hotelNo

