--These are the DROP tables described #1
DROP TABLE ClassEnrollments;
DROP TABLE Classes;
DROP TABLE Faculty;
DROP TABLE Engineers;

--CREATE TABLE statments that create all of the tables
CREATE TABLE Engineers (
EID INT NOT NULL PRIMARY KEY,
Lastname VARCHAR (255) NOT NULL,
Firstname VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
Graddate INT
);

CREATE TABLE Faculty(
FID INT NOT NULL PRIMARY KEY ,
Lastname VARCHAR(255) NOT NULL,
Firstname VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
Hiredate INT
);

CREATE TABLE Classes(
CID INT NOT NULL PRIMARY KEY,
Subject VARCHAR (255) NOT NULL,
Catalognbr INT NOT NULL,
Title VARCHAR (255)
);

CREATE TABLE ClassEnrollments (
    EnID int NOT NULL,
    CID int NOT NULL,
    FID int NOT NULL,
    EID int NOT NULL,
    PRIMARY KEY (EnID),
    CONSTRAINT FK_CID FOREIGN KEY (CID)REFERENCES CLASSES(CID),
    CONSTRAINT FK_FID FOREIGN KEY (FID)REFERENCES FACULTY(FID),
    CONSTRAINT FK_EID FOREIGN KEY (EID)REFERENCES ENGINEERS(EID)
);

--INSERT statments that insert the required data for the lab
INSERT ALL
INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (1, 'Smith', 'Jones', 'smithJ@yahoo.com', 01282020)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (2, 'Jones', 'Ana', 'AnaJ@yahoo.com', 01302020)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (3, 'Smith', 'Bob', 'smithB@yahoo.com', 08302008)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (4, 'Doe', 'Jane', 'DowJ@yahoo.com', 09302006)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (5, 'Sam', 'Jones', 'samJ@yahoo.com', 01342003)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (6, 'Smith', 'Joe', 'smithJoe@yahoo.com', 01252002)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (7, 'Nash', 'James', 'nashJ@yahoo.com', 02342001)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (8, 'Capson', 'Josiah', 'capJ@yahoo.com', 08342010)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (9, 'Salmon', 'Greg', 'sJman@yahoo.com', 01342020)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (10, 'Sales', 'Bob', 'BobS@yahoo.com', 01342021)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (11, 'Moe', 'Bob', 'Bmoe@yahoo.com', 01342021)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (12, 'Moore', 'Jack', 'MooreJ@yahoo.com', 01342022)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (13, 'Darulo', 'Sam', 'samD@yahoo.com', 01342022)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (14, 'Johnson', 'Darius', 'DJohn@yahoo.com', 01342000)

INTO Engineers (EID, Lastname, Firstname, Email, Graddate) VALUES (15, 'Doormon', 'Sally', 'sallyD@yahoo.com', 01342000)
SELECT * FROM dual;


INSERT ALL
INTO Faculty (FID, Lastname, Firstname, Email, Hiredate) VALUES(1, 'Smith', 'Jones', 'smithJ@yahoo.com', 1)
INTO Faculty (FID, Lastname, Firstname, Email, Hiredate) VALUES(2, 'Jones', 'Bob', 'BobJ@yahoo.com', 2)
INTO Faculty (FID, Lastname, Firstname, Email, Hiredate) VALUES(3, 'Johnson', 'Greg', 'smithJohn@yahoo.com', 3)
SELECT * FROM dual;

INSERT ALL
INTO Classes (cid, subject, catalognbr,title) VALUES (1, 'SDEV',360, 'Secure Software Engineering')
INTO Classes (cid, subject, catalognbr,title) VALUES (2, 'SDEV',350, 'Database Security')
INTO Classes (cid, subject, catalognbr,title) VALUES (3, 'SDEV',400, 'Secure Programming in the cloud')
SELECT * FROM dual;

INSERT ALL
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (1, 3, 2, 1)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (2, 2, 1, 2)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (3, 1, 3, 3)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (4, 3, 2, 4)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (5, 2, 1, 5)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (6, 1, 2, 6)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (7, 2, 3, 7)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (8, 3, 2, 8)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (9, 2, 1,9)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (10, 1, 2, 10)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (11, 3, 3, 11)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (12, 2, 2, 12)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (13, 1, 1, 13)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (14, 2, 2, 14)
INTO ClassEnrollments (EnID, CID, FID, EID) VALUES (15, 3, 3, 15)
SELECT * FROM dual;

SELECT EID, Lastname, Firstname, Email, Graddate FROM Engineers;
SELECT FID, Lastname, Firstname, Email, Hiredate FROM Faculty;
SELECT CID, subject, catalognbr, title,  title FROM Classes;
SELECT EnID, CID, FID, EID FROM ClassEnrollments;

--Update statments to change the data to satisfy #5 lab requirements
UPDATE Faculty SET Lastname = 'Friendship'
WHERE Lastname = 'Smith';

UPDATE Engineers SET Firstname = 'Amadeus'
WHERE Firstname = 'Jack';

UPDATE Classes SET Subject = 'IOT Cyber'
WHERE Subject = 'SDEV';

--Deletes the record from the lowest EnID record from ClassEnrollments table
DELETE FROM ClassEnrollments WHERE EnID = (SELECT min (EnID) FROM ClassEnrollments);

--Create a new view joining the required tables for new query (change the number on the new view name everytime you run it for it to run correctly)
CREATE VIEW NewView1 AS SELECT engineers.Lastname as EngineerLast, engineers.Firstname, faculty.lastname as facultyLast, faculty.email, classes.subject, classes.title FROM classenrollments, classes, engineers, faculty, student
    WHERE classenrollments.fid=faculty.fid and classenrollments.eid=engineers.eid and classenrollments.cid=classes.cid;
