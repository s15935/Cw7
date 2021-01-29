-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-01-22 09:52:40.353

-- tables
-- Table: Enrollment
CREATE TABLE Enrollment (
    IdEnrollment int IDENTITY(1,1) PRIMARY KEY,
    Semester int NOT NULL,
    IdStudy int NOT NULL,
    StartDate date NOT NULL
);

-- Table: Student
CREATE TABLE Student (
    IdStudent int IDENTITY(1,1) PRIMARY KEY,
    IndexNumber nvarchar(MAX) NOT NULL,
    FirstName nvarchar(MAX) NOT NULL,
    LastName nvarchar(MAX) NOT NULL,
    BirthDate date NOT NULL,
    PasswordHashSalt nvarchar(MAX) NOT NULL,
    RefreshToken nvarchar(MAX),
    IdEnrollment int NOT NULL
);

-- Table: Studies
CREATE TABLE Studies (
    IdStudy int IDENTITY(1,1) PRIMARY KEY,
    Name nvarchar(MAX) NOT NULL
);

-- Table: Role
CREATE TABLE Role (
    IdRole int IDENTITY(1,1) PRIMARY KEY,
    RoleName nvarchar(450) NOT NULL UNIQUE
);

-- Table: RoleStudent
CREATE TABLE RoleStudent (
    IdRole int PRIMARY KEY,
    IdStudent int PRIMARY KEY,
    CONSTRAINT RoleStudent_PK PRIMARY KEY (IdRole,IdStudent)
);

-- foreign keys
-- Reference: Enrollment_Studies (table: Enrollment)
ALTER TABLE Enrollment ADD CONSTRAINT Enrollment_Studies
    FOREIGN KEY (IdStudy)
    REFERENCES Studies (IdStudy);

-- Reference: Student_Enrollment (table: Student)
ALTER TABLE Student ADD CONSTRAINT Student_Enrollment
    FOREIGN KEY (IdEnrollment)
    REFERENCES Enrollment (IdEnrollment);

-- Reference: RoleStudent_Role (tables: RoleStudent)
ALTER TABLE RoleStudent ADD CONSTRAINT RoleStudent_Role
    FOREIGN KEY (IdRole)
        REFERENCES Role (IdRole);

-- Reference: RoleStudent_Student (tables: RoleStudent)
ALTER TABLE RoleStudent ADD CONSTRAINT RoleStudent_Student
    FOREIGN KEY (IdStudent)
        REFERENCES Student (IdStudent);
