1
SELECT *
FROM staff
WHERE branchNo="B003" AND sex="F";

2
SELECT *
FROM propertyforrent
WHERE propertyNo LIKE "PG%" OR rent>500;

3
SELECT COUNT(propertyNo), staffNo
FROM propertyforrent 
GROUP BY staffNo;

4
SELECT COUNT(staffNo), AVG(salary), SUM(salary)
FROM staff
GROUP BY branchNo;

5
SELECT propertyNo, commentl
FROM viewing
WHERE clienNO=(SELECT clientNO
FROM clientl
WHERE fName="John");

6
SELECT *
FROM staff
WHERE branchNo =(SELECT branchNo
FROM branch
WHERE city="Glasgow");

7
SELECT *
FROM propertyforrent
WHERE rent> ALL(SELECT rent
FROM propertyforrent
WHERE ownerNo=(SELECT ownerNo
FROM privateowner
WHERE fName="Tony"));

8
SELECT *
FROM staff
WHERE staffNo IN (SELECT staffNo
FROM registration
WHERE datejoined LIKE "_____3%");

9
UPDATE staff
SET salary=salary*1.1
WHERE branchNo="B005";

10
SELECT *
FROM propertyforrent
WHERE typel="Flat" AND rent>350 AND rent<500