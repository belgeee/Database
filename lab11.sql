bodlogo
1.
SELECT CONCAT(SUBSTRING(c.fName,1,1),".",c.IName," ",SUBSTRING(r.datejoined,3,5),"-ны өдөр ",SUBSTRING(c.fName,1,1),".",c.IName," хамт ",b.city," хотод ажиллажээ.") AS HhaMyLabor
FROM staff s,branch b,registration r,clientl c
WHERE r.clientNo=c.clientNO AND r.staffNo=s.staffNo AND b.branchNo=s.branchNo
2.
CREATE TABLE StaffInfo 
SELECT s.staffNo, CONCAT(SUBSTRING(s.LName,1,1),".",s.FName) AS fullName,
s.positionl, CONCAT(b.branchNo," ",b.street) AS BranchAddress, 
COUNT(p.propertyNo) AS propcount, COUNT(r.staffNo) AS clientNo
FROM staff s, branch b, propertyforrent p, registration r
WHERE s.branchNo=b.branchNo AND s.branchNo=p.branchNo AND s.staffNo=r.staffNo
GROUP BY r.staffNo;
3
SELECT IF(COUNT(propertyNo)<2,"normal","big") AS category_of_types
FROM propertyforrent
GROUP BY staffNo

4
UPDATE propertyforrent
SET rent=500, staffNo="SA"
WHERE ownerNo IN(SELECT ownerNo
FROM privateowner
WHERE fName="Tony" IName="Shaw")

5
UPDATE propertyforrent 
SET rent=rent*1.15
WHERE branchNo="B003"

6
UPDATE registration
SET datejoined=DATE_ADD(datejoined, INTERVAL 1 MONTH);
WHERE datejoined LIKE %4%

7 
DELETE FROM propertyforrent
WHERE staffNo=NULL;

8
SELECT p.*
FROM propertyforrent p, branch b
WHERE b.street="16 Argyll ST" AND p.typel="House" AND b.branchNo=p.branchNo

daalgawar
1
SELECT CONCAT(g.guestName," ",h.hotelName," зочид буудалд наргисан. ",r.price,"$ үнэтэй ",b.dateTo) AS hha_yahwde
FROM guest g, hotel h, booking b , room r
WHERE b.hotelNo=h.hotelNo AND g.guestNo=b.guestNo AND h.hotelNo=r.hotelNo AND guestName="Belgedemberel"

2
SELECT r.*
FROM room r, booking b
WHERE NOT NOW() BETWEEN b.dateFrom AND b.dateTo AND b.roomNo=r.roomNo
ORDER BY price

3
SELECT r.*
FROM room r, booking b
GROUP BY b.hotelNo
ORDER BY COUNT(b.roomNo)
LIMIT 1

4
SELECT g.*
FROM guest g, booking b
WHERE NOW() BETWEEN "2022-8-16" AND b.dateTo AND b.guestNo=g.guestNo

5
SELECT g.*
FROM guest g, booking b
GROUP BY b.guestNo
ORDER BY COUNT(roomNo) 
LIMIT 1
6
CREATE TABLE hotelRe AS
SELECT *
FROM hotel;
7
CREATE TABLE hotelInformation AS
SELECT h.hotelNo, h.hotelName, COUNT(r.roomNo) AS roomCount,
	MAX(r.price) AS maxPrice, MIN(r.price) AS minPrice,
	AVG(r.price) AS avgPrice, h.city
FROM hotel h, room r
WHERE h.hotelNo=r.hotelNo
8
UPDATE room
SET price = price*1.2
WHERE roomNo IN (SELECT r.roomNo
		FROM room r, hotel h
		WHERE h.hotelNo = r.hotelNo AND 
		h.hotelName = "Bayngol");
