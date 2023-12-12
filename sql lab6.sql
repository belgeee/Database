1
SELECT p.propertyNo, p.city, p.rent, p.staffNo, s.FName, s.LName, s.position1
FROM staff s, propertyforrent p
WHERE p.staffNo=s.staffNo

2
SELECT MIN(rent), MAX(rent), AVG(rent)
FROM staff s, propertyforrent p
WHERE s.staffNo=p.staffNo;

3
SELECT b.*, p.*
FROM branch b, propertyforrent p
WHERE b.city=p.city AND b.branchNo=p.branchNo;

4
SELECT b.*, p.*
FROM branch b
LEFT JOIN propertyforrent p ON b.branchNo=p.branchNo AND b.city=p.city;

5
SELECT DISTINCT p.city
FROM branch b
RIGHT JOIN propertyforrent p ON b.city=p.city

6
SELECT s.staffNo, s.FName, s.position1, b.city, b.street
FROM branch b, staff s, registration r
WHERE b.branchNo=r.branchNo AND r.staffNo=s.staffNo AND s.FName LIKE "M%" ;

7
SELECT r.fName, r.adress, r.telNo, p.city, p.typel, p.rent
FROM propertyforrent p, privateowner r, staff s
WHERE s.FName="Mary" AND p.ownerNo=r.ownerNo AND s.staffNo=p.staffNo;

8
CREATE TABLE staffProp AS 
SELECT s.staffNo, s.FName, s.LName, COUNT(p.propertyNo) AS propCount
FROM propertyforrent p
LEFT JOIN staff s
ON s.staffNo=p.staffNo
GROUP BY s.staffNo;

9
CREATE TABLE branchInf AS
SELECT b.branchNo, b.city, COUNT(staffNo) AS staffcount
FROM branch b
LEFT JOIN staff s
ON b.branchNo=s.branchNo
GROUP BY b.branchNo







