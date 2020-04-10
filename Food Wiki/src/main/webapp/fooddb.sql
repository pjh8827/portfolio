
create database fooddb;
use fooddb;
create table Food(
	code int,
	name varchar(50) not null,
	supportpereat double,
    calory double,
    carbo double,
    protein double,
	fat double,
	sugar double,
    natrium double,
    chole double,
    fattyacid double, 
    transfat double,
    maker varchar(200),
    material varchar(3000),	
    img varchar(300),
    allergy varchar(500),    
    constraint code_pk primary key(code)
);
drop table Food;
select * from Food;
commit;
create table tmember(
	id varchar(50) not null,
	password varchar(50) not null,
    name varchar(50) not null,
    email varchar(50),
    phone varchar(50),
    address varchar(200),
    allergy varchar(200),    
    constraint id_pk primary key(id)
);
insert into tmember(id,password,name) values('ssafy','1111','test');
drop table tmember;
commit;
select * from tmember;
