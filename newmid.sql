-- DROP DATABASE usd;
CREATE DATABASE usd;
USE  usd;



CREATE TABLE student(
	`username` VARCHAR(225) NOT NULL UNIQUE,
    `studentid` INT NOT NULL,
    PRIMARY KEY (`studentid`)

);

CREATE TABLE courses(
	`coursename` VARCHAR(225) NOT NULL UNIQUE,	
    `credithour` INT NOT NULL,
    `courseid` INT NOT NULL auto_increment,
    `description` VARCHAR(225) NOT NULL,
    `proffid` INT NOT NULL,
	`section` VARCHAR(225) NOT NULL,
	`coursenum` VARCHAR(225) NOT NULL UNIQUE,
    PRIMARY KEY (`courseid`),
    FOREIGN KEY (`proffid`)  references professor(`proffid`)
);
-- DROP TABLE courses;

CREATE TABLE professor(
	`proffname` VARCHAR(225) NOT NULL UNIQUE,
    `proffid` INT NOT NULL AUTO_INCREMENT,
	`salary` INT NOT NULL,
	 PRIMARY KEY(`proffid`)
);

CREATE TABLE grades(
	`studentid` INT NOT NULL,
    `courseid` INT NOT NULL,
    `grades` VARCHAR(225) DEFAULT 'inprocess',
    `term` VARCHAR(225) NOT NULL,
    FOREIGN KEY (`courseid`)  references courses(`courseid`),
    FOREIGN KEY (`studentid`)  references student(`studentid`)
);
-- DROP TABLE grades;

select s.username from grades as g
inner join usd.student as s on s.studentid = g.studentid
where g.courseid = 1 and g.term='Spring 2021';

select g.grades from grades as g where studentid = 1 and courseid = 1 and term= 'Fall 2020';

insert into usd.grades (studentid, courseid, term) values (25, 3, 'Spring 2022');
delete from usd.grades where studentid = 25 and courseid = 3 and term = 'Spring 2022';

update usd.grades as g set g.grades = 'W' where g.studentid = 4 and courseid = 1 and term = 'Spring 2021';

select s.username, g.studentid, sum(c.credithour) from usd.grades g
inner join usd.courses c ON g.courseid = c.courseid
inner join usd.student s ON g.studentid = s.studentid
where g.grades != 'W' and g.grades != 'Incomplete'
group by g.studentid;


select s.username as student, c.coursename as courses, p.proffname as professor
from usd.grades g
inner join usd.courses c on g.courseid = c.courseid
inner join usd.professor p on c.proffid = p.proffid
inner join usd.student s on g.studentid = s.studentid
where s.username = 'Bathsheba Farge' and p.proffname = 'Zach Tschetter';

