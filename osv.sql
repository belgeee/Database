1
SELECT branchNo, position1, salary/2 AS hagas_sariin_tsalin
FROM staff
WHERE salary

2
SELECT DISTINCT position1, sex, COUNT(sex)AS too
FROM staff
GROUP BY position1, sex
ORDER BY too DESC ;

3
SELECT branchNo, COUNT(branchNo), salary
FROM staff
GROUP BY branchNo
HAVING COUNT(staffNo)>1
ORDER BY branchNo DESC ;

4
SELECT ownerNo, propertyNo, rent, typel, rooms
FROM propertyforrent
WHERE ownerNo=(SELECT ownerNo
               FROM privateowner
               WHERE telNo="0141-357-7419")
              
5
SELECT city, rooms, rent
FROM propertyforrent
WHERE propertyNo=(SELECT propertyNo
                FROM viewing
                WHERE commentl="too small")
                
6
SELECT *
FROM propertyforrent
WHERE staffNo=(SELECT staffNo
               FROM registration
               WHERE clientNo="CR76")
               
7
SELECT branchNo, street, postcode
FROM propertyforrent
WHERE staffNo=(SELECT staffNo
               FROM registration
               WHERE datejoined="2003-03-07")
               
8
SELECT *
FROM propertyforrent
WHERE rent<SOME (SELECT rent
           FROM propertyforrent
           WHERE ownerNo)=(SELECT ownerNo
                          FROM privateowner
                          WHERE fName="Carol")
                          
                          
9
SELECT DISTINCT city, COUNT(BranchNo) AS too
FROM branch
GROUP BY city, branchNo
   
             
10
SELECT*
FROM propertyforrent
WHERE rent>SOME(SELECT rent
           FROM propertyforrent
            WHERE ownerNo)=(SELECT ownerNo
                            FROM privateowner
                             WHERE fName="Tony")
                             
11
SELECT*, COUNT(propertyNo)
FROM propertyforrent
GROUP BY propertyNo HAVING COUNT(propertyNo) 
ORDER BY propertyNo LIMIT 1;
                  
                  
12
SELECT *
FROM staff
WHERE staffNo = (SELECT staffNo
               FROM registration
               WHERE datejoined="2003-3-7");
               
               
13 SELECT *
FROM clientl
WHERE clientNO IN (SELECT clienNO
FROM viewing
WHERE viewdate LIKE "2004-5%");
                
                
14 SELECT COUNT(city), city
FROM propertyforrent
GROUP BY city HAVING COUNT(city)>2;

15 
(SELECT fName, Iname 
FROM clientl)
UNION (SELECT fName, LName
FROM staff)
UNION (SELECT fName, IName
FROM privateowner)

16 
(SELECT telNo, fName
FROM clientl
WHERE telNo LIKE "%22%")
UNION (SELECT telNo, fName
FROM privateowner
WHERE telNo LIKE "%22%") 

17
SELECT*
FROM privateowner
WHERE ownerNo IN (SELECT ownerNo
FROM propertyforrent
WHERE rooms="3" AND typel="Flat");


18 
SELECT *
FROM staff
WHERE staffNo = (SELECT staffNo
FROM propertyforrent
WHERE city="London")

19
SELECT *
FROM viewing 
WHERE clienNO IN (SELECT clientNO
FROM clientl
WHERE fName="Aline")

20
SELECT *
FROM staff
WHERE sex="F" AND staffNo IN (
SELECT staffNo
FROM propertyforrent
WHERE rooms=4 );

21
SELECT typel, MAX(rent), MIN(rent)
FROM propertyforrent
WHERE branchNo IN (SELECT branchNo
FROM branch
WHERE street="16 Argyll ST"); 

22
SELECT salary - (SELECT MIN(salary) FROM staff) AS zorvv
FROM staff
GROUP BY salary DESC

23
SELECT *
FROM propertyforrent
WHERE branchNo IN (SELECT branchNo
FROM branch
WHERE street="16 Argyll ST");

24
SELECT branchNo
FROM staff
UNION ALL
SELECT branchNo
FROM branch;