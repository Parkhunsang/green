alter session set "_ORACLE_SCRIPT"=true;
create user coomarket identified by 0000;
grant dba to project;

CREATE TABLE Like (
	icm_no	number(10)	NOT NULL,
	id	varchar(20)	NOT NULL,
	np_no	number(20)	NOT NULL
);

CREATE TABLE `NewProduct` (
	`np_no`	number(20)	NOT NULL,
	`np_name`	varchar2(40)	NULL,
	`np_content`	varchar(2000)	NULL,
	`np_image`	varchar2(100)	NULL,
	`np_price`	number(20)	NULL,
	`np_discount`	number(2)	NULL,
	`np_date`	date	NULL,
	`np_like`	number(20)	NULL,
	`np_count`	number(20)	NULL,
	`np_detailimage`	varchar2(100)	NULL,
	`biz_id`	varchar(20)	NOT NULL
);

CREATE TABLE `OldTrade` (
	`ot_no`	number(20)	NOT NULL,
	`op_no`	varchar2(40)	NULL,
	`ot_status`	char(1)	NULL,
	`ot_date`	date	NULL,
	`Id[key]2`	varchar(20)	NOT NULL
);

CREATE TABLE `Cart` (
	`c_no`	number(10)	NOT NULL,
	`c_count`	number(10)	NULL,
	`Id[key]`	varchar(20)	NOT NULL,
	`np_no`	number(20)	NOT NULL
);

CREATE TABLE `Delivery_Buy` (
	`db_no`	number(10)	NOT NULL,
	`db_name`	varchar2(20)	NULL,
	`db_address`	varchar2(40)	NULL,
	`db_tel`	number(20)	NULL,
	`db_request`	varchar2(100)	NULL,
	`db_date`	date	NULL,
	`bl_count`	number(10)	NULL,
	`Id[key]`	varchar(20)	NOT NULL,
	`np_no`	number(20)	NOT NULL
);

CREATE TABLE `Review` (
	`r_no`	number(10)	NOT NULL,
	`r_title`	varchar(30)	NULL,
	`r_content`	varchar(1000)	NULL,
	`r_image`	varchar(300)	NULL,
	`r_date`	date	NULL,
	`r_score`	number(1)	NULL,
	`Id[key]`	varchar(20)	NULL,
	`Id[key]2`	varchar(20)	NOT NULL,
	`np_no`	number(20)	NOT NULL
);

CREATE TABLE `BuyList` (
	`bl_no`	number(10)	NOT NULL,
	`bl_coount`	number(10)	NULL,
	`bl_price`	number(10)	NULL,
	`cm_no`	number(20)	NULL,
	`Id[key]`	varchar(20)	NULL,
	`Id[key]2`	varchar(20)	NOT NULL,
	`np_no`	number(20)	NOT NULL
);


-- 회원 테이블 (일반 + 사업자 구분)
CREATE TABLE Member (
    id            VARCHAR(10) PRIMARY KEY NOT NULL,
    password      VARCHAR(255) NOT NULL, -- 비밀번호 암호화를 위해 20-> 255로 확장
    name          VARCHAR(20) NOT NULL,
    address       VARCHAR(230),
    tel           VARCHAR(20),
    email         VARCHAR(50),
    reg_date      DATE DEFAULT CURRENT_DATE,
    del           CHAR(1) DEFAULT 'N',
    is_admin      CHAR(1) DEFAULT 'N',
    member_type   CHAR(1) NOT NULL  -- 'N'=일반회원, 'B'=사업자회원
);
alter table Member modify(id varchar(20) not null);
insert into Member(id, password, name, address, tel, email, member_type) values('test00', '0', 'name', 'juso', '010-0000-0000', 'abcd@efg.com', 'N');
delete Member where id='test00';
select * from Member;
drop table Member;

CREATE TABLE `Board` (
	`b_no`	number(10)	NOT NULL,
	`b_title`	varchar(100)	NULL,
	`b_content`	varchar(1000)	NULL,
	`b_date`	date	NULL,
	`b_view`	number(10)	NULL,
	`b_image`	varchar(300)	NULL,
	`b_del`	char(1)	NULL,
	`b_ref`	number(10)	NULL,
	`b_step`	number(10)	NULL,
	`b_level`	number(10)	NULL,
	`Id[key]`	varchar(20)	NOT NULL
);

CREATE TABLE `OldProduct` (
	`op_no`	number(20)	NOT NULL,
	`op_name`	varchar2(40)	NULL,
	`op_content`	varchar(2000)	NULL,
	`op_image`	varchar2(100)	NULL,
	`op_price`	number(20)	NULL,
	`op_discount`	number(2)	NULL,
	`op_date`	date	NULL,
	`op_like`	number(20)	NULL,
	`op_detailimage`	varchar2(100)	NULL,
	`op_status`	char(1)	NULL,
	`op_count`	number(20)	NULL,
	`Id[key]2`	varchar(20)	NOT NULL
);

CREATE TABLE `BusinessMember` (
	`biz_id`	varchar(20)	NOT NULL,
	`biz_number`	varchar(20)	NULL,
	`biz_name`	varchar2(20)	NULL,
	`biz_address`	varchar2(20)	NULL,
	`biz_tel`	number(20)	NULL,
	`biz_email`	varchar2(30)	NULL,
	`biz_reg_date`	date	NULL,
	`biz_del`	char(1)	NULL,
	`is_admin`	char(1)	NULL
);

ALTER TABLE `Like` ADD CONSTRAINT `PK_LIKE` PRIMARY KEY (
	`icm_no`
);

ALTER TABLE `NewProduct` ADD CONSTRAINT `PK_NEWPRODUCT` PRIMARY KEY (
	`np_no`
);

ALTER TABLE `OldTrade` ADD CONSTRAINT `PK_OLDTRADE` PRIMARY KEY (
	`ot_no`
);

ALTER TABLE `Cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`c_no`
);

ALTER TABLE `Delivery_Buy` ADD CONSTRAINT `PK_DELIVERY_BUY` PRIMARY KEY (
	`db_no`
);

ALTER TABLE `Review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`r_no`
);

ALTER TABLE `BuyList` ADD CONSTRAINT `PK_BUYLIST` PRIMARY KEY (
	`bl_no`
);

ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`Id[key]`
);

ALTER TABLE `Board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`b_no`
);

ALTER TABLE `OldProduct` ADD CONSTRAINT `PK_OLDPRODUCT` PRIMARY KEY (
	`op_no`
);

ALTER TABLE `BusinessMember` ADD CONSTRAINT `PK_BUSINESSMEMBER` PRIMARY KEY (
	`biz_id`
);

