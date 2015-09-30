UNLOCK TABLES;
CREATE DATABASE IF NOT EXISTS CS604;
USE CS604;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor 
(
Professor_ID INT NOT NULL UNIQUE PRIMARY KEY DEFAULT 0,
LastName varchar(30) DEFAULT NULL,
FirstName varChar(30) DEFAULT NULL,
eMail VarChar(100) DEFAULT NULL
)ENGINE  InnoDB;

DROP TABLE IF EXISTS student;
CREATE table Student
(
Classes_ID VARCHAR(10) UNIQUE NOT NULL PRIMARY KEY DEFAULT "0",
LastName varchar(30) DEFAULT NULL,
Firstname VARCHAR(30) DEFAULT NULL
)ENGINE  InnoDB;

DROP TABLE IF EXISTS Classes;
CREATE TABLE Classes
(
Class_ID varchar(10) NOT NULL PRIMARY KEY,
Classname varchar(50) DEFAULT NULL,
Professor_ID INT NOT NULL DEFAULT 0, 
Semester VARCHAR(25),

INDEX CLASS_ID(Class_ID),
INDEX Professor_ID(Professor_ID),
INDEX Semester(Semester),

FOREIGN KEY (CLASS_ID)
	REFERENCES REGISTERED(CLASS_ID),
FOREIGN KEY (CLASS_ID)
	REFERENCES Class_dates(Class_ID),
FOREIGN KEY (Professor_ID)
	REFERENCES Professor(Professor_ID),
FOREIGN KEY (Semester)
	REFERENCES ClassDates(Semester)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE  InnoDB;

DROP TABLE IF EXISTS ClassDates;
CREATE TABLE ClassDates
(
Class_ID varchar(10) NOT NULL PRIMARY KEY,
ClassDatesRange DATE,
ClassDate DATE,
Semester VARCHAR(25),
Present BOOL,

INDEX ClassDates(ClassDate),
INDEX Semester(Semester),

FOREIGN KEY (Class_ID)
	REFERENCES Classes(Class_ID),
FOREIGN KEY (Semester)
	REFERENCES Classes(Semester)
ON DELETE CASCADE
ON UPDATE CASCADE

)ENGINE  InnoDB;

DROP TABLE IF EXISTS Registered;
CREATE TABLE Registered
(
CLASS_ID varchar(10) NOT NULL PRIMARY KEY,
Semester VARCHAR(25) NOT NULL,
ClassDAte DATE,
Registered BOOL,
FOREIGN KEY (Class_ID)
	REFERENCES Classses(Class_ID),
FOREIGN KEY (Semester)
	REFERENCES ClassDates(Semester),
FOREIGN KEY (ClassDate)
	REFERENCES Classdates(ClassDate)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE  InnoDB;

LOCK TABLE professor WRITE;

INSERT INTO Professor VALUES ('908967', 'Crutch', 'Jim', 'crutchj@sacredheart,edu');
INSERT INTO Professor VALUES ('675736', 'Canton', 'Phillip','cantonp@sacredheart.edu');
INSERT INTO Professor VALUES ('345678', 'Barker', 'Bret', 'barkerb@sacredheart.edu');
INSERT INTO Professor VALUEs ('189240', 'Sideleau', 'Paul', 'paulsideleau@yahoo.com');
INSERT INTO Professor VALUEs ('546177', 'Kyrytschenko', 'Greg', 'gnkyryt@gmail.com');

UNLOCK TABLE;

LOCK TABLE Student WRITE;

INSERT INTO Student VALUES ('0674236', 'Leon', 'Don');
INSERT INTO Student VALUES ('0675736', 'Canton', 'Phillip');
INSERT INTO Student VALUES ('0456782', 'Miller', 'Lee');

UNLOCK TABLE;

LOCK TABLE Classes WRITE;

INSERT INTO Classes VALUES ('CS-604', 'Advanced Software Engineering','189240', 'FALL 2015');
INSERT INTO Classes VALUES ('CS-622', 'Network Security','546177', 'FALL 2015');

UNLOCK TABLE;

LOCK TABLE ClassDates WRITE;

INSERT INTO ClassDates VALUES ('CS-622', NULL, NULL, 'Fall 2015', NULL);
INSERT INTO ClassDates VALUES ('CS-604', NULL, NULL, 'Fall 2015', NULL);

UNLOCK TABLE;

LOCK TABLE Registered WRITE;

INSERT INTO Registered VALUES ('CS-622', 'Fall 2015', NULL, NULL);
INSERT INTO Registered VALUES ('CS-604', 'Fall 2015', NULL, NULL);

UNLOCK TABLE;

SET foreign_key_checks = 1;