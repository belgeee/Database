1
SELECT b.branchNo, b.city, s.staffNo, s.fName, s.position1
FROM branch b, staff s
WHERE b.branchNo=s.branchNo;

2
SELECT s.staffNo, s.LName, s.FName, b.*
FROM staff s, branch b
WHERE s.branchNo = b.branchNo && s.staffNo=(SELECT staffNo
FROM registration
WHERE datejoined="2003-4-11");

3
SELECT c.*, SUM(maxRent)
FROM clientl c, viewing v
WHERE c.clientNO = v.clienNO AND v.viewdate LIKE "2004-4%";

4
SELECT DISTINCT s.*, r.*
FROM staff s,branch b, propertyforrent p, privateowner r
WHERE b.city=p.city AND p.staffNo=s.staffNo AND p.ownerNo=r.ownerNo;


5
SELECT DISTINCT b.city
FROM propertyforrent p, branch b
WHERE b.city=p.city

6
SELECT p.*, s.*
FROM privateowner p, staff s, propertyforrent r
WHERE r.rooms=3 AND r.typel="Flat" AND p.ownerNo=r.ownerNo AND r.staffNo=s.staffNo

7
SELECT s.FName, s.LName, s.position1, b.city, b.branchNo
FROM staff s, branch b
WHERE s.sex="F" AND b.branchNo="B003"

8
SELECT s.*, b.branchNo, b.street, b.city
FROM staff s, propertyforrent r, privateowner p, branch b
WHERE s.staffNo=r.staffNo AND p.ownerNo=r.ownerNo AND p.ownerNo=r.ownerNo AND s.branchNo=b.branchNo AND p.fName LIKE "C%";


9
SELECT s.*
FROM staff s, propertyforrent p
WHERE propertyNo LIKE "PA%" AND p.staffNo=s.staffNo

10
SELECT s.branchNo, s.staffNo, p.propertyNo
FROM staff s, propertyforrent p
WHERE s.branchNo="B003" AND s.staffNo=p.staffNo

11 
SELECT b.city, COUNT(s.staffNo), position1
FROM branch b, staff s
WHERE b.branchNo=s.branchNo;

12

UPDATE staff
SET position1="Manager", salary=25000 
WHERE branchNo="B007" AND sex="F" ;

13
SELECT city, COUNT(branchNo)
FROM branch
GROUP BY city;

14
SELECT p.*
FROM propertyforrent p, branch b
WHERE p.branchNo=(SELECT branchNo
FROM branch
WHERE postcode="SW1 4EH");

15
SELECT *
FROM propertyforrent
WHERE rent > ALL( SELECT p.rent
FROM branch b, propertyforrent p
WHERE b.city ="Glasgow" AND b.branchNo=p.branchNo);

16
SELECT b.branchNo, b.city, b.postcode, s.staffNo, s.FName, s.position1, c.clientNO, c.telNo
FROM registration r, branch b, staff s, clientl c
WHERE r.branchNo=b.branchNo AND r.staffNo=s.staffNo AND r.clientNo=c.clientNO; 

17
SELECT*
FROM branch b
WHERE EXISTS (SELECT *
FROM staff s
WHERE b.branchNo=s.branchNo);








