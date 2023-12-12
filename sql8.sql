CREATE TABLE professional (
professionalNo VARCHAR(20),
nameNo VARCHAR(30)
);
INSERT INTO professional (professionalNo, nameNo)
VALUES("IT","Information technology"),
("SE","Software engineer"),
("CS","ComputerScience"),
("H", "Hardware");
CREATE TABLE student (
ID VARCHAR(11),
professionalNo VARCHAR(10),
IName VARCHAR(20),
LName VARCHAR(20),
sex VARCHAR(1),
birthday DATE,
starttime DATE
);
INSERT INTO student (ID, professionalNo, IName, LName, sex, birthday, starttime)
VALUES("21B1NUM2890", "SE","Enkhbat", "Belegdemberel","M","2003-12-14","2021-9-1"),
("21B1NUM2890", "SE","Enkh", "Monkh","M","2002-12-14","2022-9-1"),
("21B1NUM8902", "CS","bat", "Tsetsge","F","2001-12-14","2021-9-1"),
("21B1NUM2890", "SE","Enkhbat", "Boldoo","M","2000-12-14","2022-9-1"),
("21B1NUM2890", "IT","bat", "Hvdree","M","2004-12-14","2021-9-1"),
("21B1NUM3211", "SE","Enkhbat", "Belegdemberel","M","2003-12-14","2021-9-1"),
("21B1NUM8902", "CS","bat", "Beleg","M","2002-12-14","2021-9-1"),
("21B1NUM2890", "H","Enkhbat", "Badarch","M","2002-12-14","2021-9-1"),
("21B1NUM2890", "H","Enkhbat", "demberel","M","2004-12-14","2022-9-1"),
("21B1NUM2890", "IT","Enkhbat", "Belegdemberel","M","2004-12-14","2021-9-1");

CREATE TABLE lesson(
NameL VARCHAR(20),
NumberL VARCHAR(20)
);
INSERT INTO lesson (NameL, NumberL)
VALUES ("Programchlaliin arga zvi", "PAZ"),
("Ogogdliin sangiin vndes", "OSV"),
("internet tehnologiin vndes", "ITV"),
("algorithimmn vndes", "ALGO");
CREATE TABLE lessonrelation(
professionNo VARCHAR(20),
LessonNo VARCHAR(20)
);
INSERT INTO lessonrelation (professionNo, LessonNo)
VALUES
("SE", "PAZ"),
("IT", "ITV"),
("CS", "ALGO"),
("HE", "ITV"),
("SE", "PAZ"),
("IT", "OSV"),
("CS", "PAZ"),
("HE", "OSV"),
("SE", "ITV"),
("IT", "PAZ");

CREATE TABLE chosenlesson (
ID VARCHAR(11),
LNo VARCHAR(10),
chosendate DATE,
season VARCHAR(20),
ywts VARCHAR(4),
uliral VARCHAR(4)
);
INSERT INTO chosenlesson (ID, LNo, chosendate, season, ywts, uliral)
VALUES ("21B1NUM8902","PAZ","2002-2-1","fall","45","30"),
("21B1NUM8902","ITV","2002-2-1","SPRING","45","80"),
("21B1NUM2782","ITV","2002-2-1","fall","45","90"),
("21B1NUM2829","PAZ","2002-2-1","SPRING","23","50"),
("21B1NUM2932","ALGO","2002-2-1","fall","35","100"),
("21B1NUM8902","ALGO","2002-2-1","fall","45","30"),
("21B1NUM3434","ITV","2002-2-1","SPRING","45","30"),
("21B1NUM3435","ALGO","2002-2-1","fall","0","0"),
("21B1NUM8902","PAZ","2002-2-1","fall","43","50"),
("21B1NUM8902","ALGO","2002-2-1","fall","35","30"),
("21B1NUM3435","ITV","2002-2-1","SPRING","55","30"),
("21B1NUM8902","PAZ","2002-2-1","SPRING","45","38"),
("21B1NUM8902","ALGO","2002-2-1","fall","43","24");

SELECT COUNT(LessonNo), professionNo
FROM lessonrelation
GROUP BY professionNo


SELECT COUNT(LNo), LNo
FROM chosenlesson
GROUP BY LNo
ORDER BY COUNT(LNo) DESC;


SELECT COUNT(ID), *
FROM chosenlesson
GROUP BY ID HAVING COUNT(ID)
ORDER BY ID LIMIT 1;

SELECT l.LessonNo
FROM student s, lessonrelation l
WHERE s.IName="bat" AND l.professionNo=s.professionalNo;

SELECT AVG(uliral)
FROM student s, chosenlesson c
WHERE s.IName="bat" AND s.ID=c.ID

SELECT p.professionalNo, c.LNo, s.ID, AVG(ywts+uliral), MAX(ywts+uliral), MIN(ywts+uliral) 
FROM chosenlesson c, student s, professional p
WHERE s.starttime LIKE ("2021%") AND c.season="fall" AND c.ID=s.ID AND s.professionalNo=p.professionalNo
GROUP BY LNo;

SELECT MAX(uliral), MIN(uliral), s.professionalNo
FROM chosenlesson c, student s
WHERE s.ID=c.ID AND c.season="fall"


SELECT *
FROM student
WHERE 30<ALL(SELECT uliral
FROM chosenlesson
WHERE season="fall");

SELECT *, MAX(uliral+ywts)
FROM chosenlesson c, student s
WHERE c.season="fall"


UPDATE chosenlesson
SET LNo="gg", chosendate="null"
WHERE uliral=0 AND ywts=0;
