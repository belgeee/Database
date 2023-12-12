CREATE TABLE donor(
FName VARCHAR(20),
LName VARCHAR(20),
bloodType VARCHAR(10),
age VARCHAR(2),
address VARCHAR(20),
sex CHAR(1),
dateofdonation DATE,
phonenumber VARCHAR(12),
donorID VARCHAR(10),
staffID VARCHAR(20),
PRIMARY KEY (donorID),
FOREIGN KEY (staffID) REFERENCES staff(staffID)
);
INSERT INTO donor(FName, LName, bloodType, age, address, sex, dateofdonation, phonenumber, donorID, staffID)
VALUES("Dorjsambuu", "Batmagnai", 1, 23, "Arkhangai", "M", "2020-10-10", 99998888,"A201015", "D201214");
("Monkh", "Battsetseg", 2, 40, "Bayanzurkh", "F", "2019-12-10", 99999988,"A191210", "D201214"),
("Bat", "Khongorzul", 3, 23, "Bayangol", "F", "2021-12-10", 99998899,"A211210", "D201212"),
("Enkhbat", "Belegdemberel", 3, 18, "Arkhangai", "M", "2021-12-14", 99888888,"A211214","D101211"),
("Monkhbat", "Lundaasuren", 2, 17, "Arkhangai", "M", "2021-06-22", 99998888,"A210622","D201211");

CREATE TABLE blood(
bloodbagNo VARCHAR(20),
bloodtype VARCHAR(20),
bloodamount VARCHAR(10),
hameglobincontent VARCHAR(2),
cost VARCHAR(20),
donorID VARCHAR(20),
FOREIGN KEY (bloodbagNo) REFERENCES bloodinventory(bloodbagNo),
FOREIGN KEY (donorID) REFERENCES donor(donorID)
);
INSERT INTO blood(bloodbagNo, bloodtype, bloodamount, hameglobincontent,cost, donorID)
VALUES("B201010",1,"500ml", "5%","5000 MNT","A210622"),
("B191210",2,"500ml", "5%","5000 MNT","A191210"),
("B211210",3,"1000ml", "7%","5000 MNT","A201010"),
("B211214",3,"250ml", "8%","4000 MNT","A211214"),
("B210622",2,"250ml", "5%","6000 MNT","A211210");

CREATE TABLE staff(
FName VARCHAR(20),
LName VARCHAR(20),
phoneNo VARCHAR(20),
address VARCHAR(20),
staffID VARCHAR(20),
salary VARCHAR(10),
position12 VARCHAR(20),
PRIMARY KEY (staffID)
);
INSERT INTO staff(FName, LName, phoneNo, address, staffID, salary, position12)
VALUES("Monkh", "Dalaibaatar",88888888, "Bayangol","D101211","1100000MNT", "Nurse");
("Sod", "Misheel",92111111, "Bayanzurkh","D201211","1000000MNT", "Nurse"),
("Monkh", "Dalai",88888888, "Bayangol","D201213","1100000MNT", "Nurse");



CREATE TABLE reciepent(
FName VARCHAR(20),
LName VARCHAR(20),
recID VARCHAR(20),
bloodtype VARCHAR(10),
sex VARCHAR(2),
age VARCHAR(2),
dateofaccept DATE,
staffID VARCHAR(20),
PRIMARY KEY(recID),
FOREIGN KEY (staffID) REFERENCES staff(staffID)
);
INSERT INTO reciepent(FName, LName, recID, bloodtype, sex, age, dateofaccept, staffID)
VALUES("Bat", "Belgee","C201001","1","M",22,"2020-10-1", "D201212"),
("Monkh", "Bilgee","C211001","2","F",32,"2021-10-1", "D201212"),
("Ganchuluun","Usukhbayar","C211201","3","M",20,"2021-12-1", "D201211");

CREATE TABLE bloodinventory(
quantity VARCHAR(10),
bloodbagNo VARCHAR(10),
bloodtype VARCHAR(10),
orders VARCHAR(10),
datefrom DATE,
dateto DATE,
staffID VARCHAR(20),
PRIMARY KEY (bloodbagNo),
FOREIGN KEY (staffID) REFERENCES staff(staffID)
);
INSERT INTO bloodinventory(quantity, bloodbagNo, bloodtype, orders, datefrom, dateto, staffID)
VALUES("250ml", "B201010", "1", "E1", "2022-12-12", "2023-1-1","D201213"),
("250ml", "B191210", "2", "E2", "2022-10-10", "2023-1-1","D201213"),
("500ml", "B211210", "3", "E3", "2022-10-10", "2023-2-1","D201213"),
("1000ml", "B211214", "3", "E4", "2022-11-10", "2023-1-1","D201211"),
("500ml", "B210622", "2", "E5", "2022-08-10", "2023-2-1","D201211");





/*8*/

-- 1. misheel assisstant iin hariutsaj awsn donoruudiin medeelel?

SELECT d.*
FROM donor d, staff s
WHERE s.staffID=d.staffID AND s.LName="Misheel";
 
-- 2. Donor Khongorzuliig hariutsaj awsn ajiltnii ner alban tushaal?

SELECT s.LName, s.position12
FROM staff s, donor d
WHERE s.staffID=d.staffID AND d.LName="Khongorzul";

-- 3. Tsusnuu heseg rvv batiin handiwlasan tsusnii medeellig nemne vv
INSERT INTO blood(bloodbagNo, bloodtype, bloodamount, hameglobincontent)
VALUES("B291210",4,"500ml", "5%"),

-- 4. hamgiin olon donor hariutsaj awsn ajilchnii medeelel
SELECT s.*
FROM donor d, staff s
GROUP BY d.staffID
ORDER BY COUNT(d.donorID)
LIMIT 1;

-- 5. "..." dugaartai hereglegch "..." nii odor "..." dugaartai tsus handiwlajee
SELECT CONCAT(d.donorID,' ','dugaartai hereglegch',' ',d.dateofdonation,' ','-nii odor',' ',b.bloodtype,' ','bvlgiin tsus handiwlajee.') AS tsushawdiwlalt
FROM donor d, blood b 
WHERE b.donorID=b.donorID AND d.LName="Belegdemberel"

-- 6. Emchiin mergejliig 2say bolgo
UPDATE staff 
SET salary="2000000MNT"
WHERE position12="Doctor"

-- 7. Niilt ajilchdiin toog garga mergejil tus bvr deer hden ajiltan bga toog garga
SELECT COUNT(s.staffID), s.position12
FROM staff s
GROUP BY s.position12
ORDER BY COUNT(s.staffID) DESC;

-- 8. usukhbayrt heregtei tsusnii medeelel bvlgiin tsus awah hvleen awagch ymr2 tsus awc bloh medeelel? 
SELECT*
FROM blood
WHERE bloodtype=(SELECT bloodtype
			FROM reciepent
			WHERE LName="Usukhbayar");



-- 9. 8% hameglobin aguulj bga tsusnuu medeelel
SELECT b.*, d.*
FROM blood b, bloodinventory d
SELECT b.bloodbagNo=d.bloodbagNo AND b.hameglobencontent="8%"; 
 
 
 
 #8 niit reciepent vvdees ajiltand hamaaraltai hvmvvs?
 SELECT r.*
 FROM reciepent r
 RIGHT JOIN staff s ON s.staffID=r.staffID 
 
#9 niit ajilchnaas donor d hamaaralgv ajilchniig null mon donor hamaaraltai  ajillchdiin medeelliig garga
 SELECT d.*, s.staffID
 FROM staff s
 LEFT JOIN donor d ON s.staffID=d.staffID
/*11*/
-- 1. tsusnii towch medeelel

CREATE VIEW BriefInfBlood AS
SELECT bloodbagNo, bloodtype, bloodamount, cost
FROM blood;

-- 2. hvleen awagch hvmvvsiiin ners

CREATE VIEW Namesofmen AS
SELECT r.FName, r.LName
FROM reciepent r, donor d, staff s
WHERE s.staffID=d.staffID AND s.staffID=r.staffID

-- 3. emchiin hariutsaj awsn donoruuudiin medeelel

CREATE VIEW Hstaff AS
SELECT d.*
FROM staff s, donor d
WHERE s.position12 = "Doctor" AND s.staffID=d.staffID;


--4 2 oos olon donor hariutssan ajiltni dugaaruug garga
SELECT IF(COUNT(donorID)<2,"2baga hvn hariutssan","2oos ih hvn") AS type12, staffID
FROM donor
GROUP BY staffID

--5 . 
SELECT bloodbagNo, bloodtype
CASE  
WHEN hameglobincontent>'8%' THEN 'Ih2'
WHEN hameglobincontent='8%' THEN 'bundaj'
ELSE "dundaj"
END
FROM blood;

# 1 niit tsusnuu medeeleliig hvsnegt bolgo
CREATE TABLE bloodInf AS
 SELECT b.bloodbagNo,b.quantity,d.hameglobincontent,d.bloodamount,d.bloodtype
 FROM blood d,bloodinventory b
 WHERE b.bloodbagNo=d.bloodbagNo
    
#30aas doosh nasnii zaluusiin ijil tsusnii bvleg tei baih ba medeelliig ni neg hvsnegt bolgo
CREATE TABLE guys AS
SELECT r.LName, r.FName, r.recID, r.bloodtype, r.sex , r.age,  d.FName AS Named, d.donorID, d.bloodtype AS btype
FROM reciepent r, donor d
WHERE r.age<30 AND d.age<30 AND r.bloodtype=d.bloodtype;


#1r bvlgiin tsustai hvmvvsiig hargalzuulsam hvsnegt
CREATE TABLE type1234 AS
SELECT d.*, r.LName AS NamesOfRec
FROM donor d, reciepent r
WHERE d.bloodtype=1 AND r.bloodtype=1




 
 
 
