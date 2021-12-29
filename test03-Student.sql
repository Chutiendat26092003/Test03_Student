create database Test03_Student
go

use Test03_Student
go

create table Class(
    ClassID int primary key identity(1, 1) not null,
	ClassName varchar(10)
)
go

create table Students(
    StudentID int primary key identity(100, 1) not null,
	StudentName nvarchar(200),
	DateOfBirth date
)
go



create table Subjects(
    SubjectID int primary key identity(200, 1) not null,
	SubjectName nvarchar(200)
)
go

create table StudentClass(
    ClassID int foreign key references Class(ClassID),
    StudentID int foreign key references Students(StudentID)
)
go

create table StudentSubject(
    StudentID int foreign key references Students(StudentID),
	SubjectID int foreign key references Subjects(SubjectID)
)
go



select * from Class
select * from Students
select * from Subjects
select * from StudentClass
select * from StudentSubject


-- insert dữ liệu 

insert into Class values ('T2108M'),
                         ('T2109M'),
						 ('T2110M'),
						 ('B2100H'),
						 ('H2101K')

insert into Subjects values (N'Angular'),
                            (N'SQL'),
							(N'HML,CSS')

insert into Students values (N'Nguyễn Văn A', '2000-1-11'),
                            (N'Đinh Văn B', '2001-2-11'),
							(N'Trần Văn C', '1999-3-11'),
							(N'Phan Văn D', '2000-4-11'),
                            (N'Hoang Văn K', '2000-5-11'),
                            (N'Hoang Văn Phan', '2000-5-1'),
						    (N'Hoang Văn Khang', '2000-5-22'),
							(N'Hoang Văn Chung', '2000-5-23'),
							(N'Hoang Văn Lang', '2000-5-19')

insert into StudentClass values (1, 100),
                                (2, 101),
								(3, 102),
								(3, 103),
								(4, 104),
								(5, 105),
								(1, 106),
								(4, 107),
								(2, 108)
							
insert into StudentSubject values (100, 200),
                                  (102, 200),
								  (103, 201),
								  (104, 201),
								  (105, 202),
								  (106, 202),
								  (107, 200),
								  (108, 201)


-- truy vẫn dữ liệu 
select StudentName, SubjectName 
from StudentSubject inner join Students on StudentSubject.StudentID = Students.StudentID
     inner join Subjects on StudentSubject.SubjectID = Subjects.SubjectID
where SubjectName like N'%SQL%'
go

select ClassName, StudentName
from StudentClass inner join Students on StudentClass.StudentID = Students.StudentID
     inner join Class on StudentClass.ClassID = Class.ClassID
where ClassName like N'%T2109M%'
go



