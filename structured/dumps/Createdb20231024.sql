# create database akademik;

drop table if exists task;
drop table if exists student;
drop table if exists course;
drop table if exists lecturer;

create table student (
 	id SMALLINT NOT NULl AUTO_INCREMENT,
	nrp VARCHAR(18),
	name_student VARCHAR(50),
    PRIMARY KEY (id)
);

create table course (
	id SMALLINT NOT NULl AUTO_INCREMENT,
	name_course VARCHAR(100),
	PRIMARY KEY (id)
);

create table lecturer (
	id SMALLINT NOT NULl AUTO_INCREMENT,
	nip VARCHAR(18),
	name_lecturer VARCHAR(50),
    PRIMARY KEY (id)
);

create table task (
	id SMALLINT NOT NULl AUTO_INCREMENT,
	desc_task VARCHAR(500),
	id_mk SMALLINT,
    id_mhs SMALLINT,
    id_dos SMALLINT,
    score SMALLINT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_mk) REFERENCES course(id),
    FOREIGN KEY (id_mhs) REFERENCES student(id),
    FOREIGN KEY (id_dos) REFERENCES lecturer(id)
);




