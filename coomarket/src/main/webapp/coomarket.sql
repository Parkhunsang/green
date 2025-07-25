create table member (
	id varchar2(20) primary key,
	password varchar2(20),
	name varchar2(20),
	tel varchar2(20),
	address varchar2(60),
	pic varchar2(50),
	reg_date Date,
	act char(1) default 'y'
);