DROP DATABASE IF EXISTS cs604;
CREATE DATABASE CS604;
USE CS604;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor 
(
Professor_ID INT NOT NULL UNIQUE PRIMARY KEY DEFAULT 0,
LastName varchar(30) DEFAULT NULL,
FirstName varChar(30) DEFAULT NULL
);

DROP TABLE IF EXISTS Student;
CREATE table Student
(
Student_ID VARCHAR(10) UNIQUE NOT NULL PRIMARY KEY DEFAULT "0",
LastName varchar(30) DEFAULT NULL,
Firstname VARCHAR(30) DEFAULT NULL
)ENGINE  InnoDB;

DROP TABLE IF EXISTS Classes;
CREATE TABLE Classes
(
Class_ID varchar(10) NOT NULL PRIMARY KEY,
ClasName varchar(50) DEFAULT NULL,
Professor_ID INT NOT NULL DEFAULT 0, 
Student_ID VARCHAR(10) NOT NULL DEFAULT "0",
Semester VARCHAR(25),

INDEX CLASS_ID(Class_ID),
INDEX Professor_ID(Professor_ID),
INDEX Student_ID(Student_ID),
INDEX Semester(Semester),

FOREIGN KEY (Professor_ID)
	REFERENCES Professor(Professor_ID),
FOREIGN KEY (Semester)
	REFERENCES ClassDates(Semester),
FOREIGN KEY (Student_ID)
      REFERENCES Student(Student_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE  InnoDB;

DROP TABLE IF EXISTS ClassDates;
CREATE TABLE ClassDates
(
Class_ID varchar(10) NOT NULL PRIMARY KEY,
ClassDatesRange DATE,
ClassDate DATE,
AttendanceDate DATE,
Semester VARCHAR(25),
Present BOOL,

INDEX ClassDates(ClassDate),
INDEX Semester(Semester),
INDEX ClassDateAndSemester(Classdate,Semclassdatesester),

FOREIGN KEY (Class_ID)
	REFERENCES Classses(Class_ID),
FOREIGN KEY (Semester)
	REFERENCES Classes(Semester)
ON DELETE CASCADE
ON UPDATE CASCADE


)ENGINE  InnoDB;

DROP TABLE IF EXISTS Registered;
CREATE TABLE Registered
(
CLASS_ID varchar(10) NOT NULL PRIMARY KEY,
Student_ID VARCHAR(10) NOT NULL DEFAULT "0",
Semester VARCHAR(25) NOT NULL,
Registered BOOL,
FOREIGN KEY (Class_ID)
	REFERENCES Classses(Class_ID),
FOREIGN KEY (Semester)
	REFERENCES ClassDates(Semester),
FOREIGN KEY (Student_ID)
      REFERENCES Classes(Student_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)ENGINE  InnoDB;

SET foreign_key_checks = 1;
