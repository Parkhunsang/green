-- Member (공통 정보)
CREATE TABLE Member (
    id            VARCHAR2(20) PRIMARY KEY,
    password      VARCHAR2(255),
    email         VARCHAR2(100) UNIQUE NOT NULL,
    member_type   CHAR(1) NOT NULL CHECK (member_type IN ('I', 'B')), --일반 I 비즈니스 B
    status		  CHAR(1) DEFAULT 'A' CHECK (status IN ('A', 'D', 'S')), -- 활성화 A 삭제대기 D 계정정지 S
    reg_date DATE default sysdate
);

select * from Member;
select * from Member;
insert into Member values ('test','a','a@a.com',trim('I'),trim('A'),sysdate);
alter table Member rename column member_type to memberType;
alter table Member rename column reg_date to regDate;
delete member;

-- 개인정보 테이블 (PII)
CREATE TABLE MemberPrivate (
    id        		 VARCHAR2(20) PRIMARY KEY,
    name          VARCHAR2(50),
    address   		 VARCHAR2(200),
    address_detail   VARCHAR2(200),
    tel       		 VARCHAR2(20) UNIQUE,
    member_pic       VARCHAR2(255),
    FOREIGN KEY (id) REFERENCES Member(id) ON DELETE CASCADE
);
alter table MemberPrivate rename column address_detail to addressDetail;
alter table MemberPrivate rename column member_pic to memberPic;
-- 배송지 주소
CREATE TABLE DeliveryAddress (
    address_id   NUMBER PRIMARY KEY,
    member_id    VARCHAR2(20),
    receiver     VARCHAR2(50),
    phone        VARCHAR2(20),
    address      VARCHAR2(255),
    is_default   CHAR(1) CHECK (is_default IN ('Y', 'N')),
    created_at DATE DEFAULT SYSDATE,
    FOREIGN KEY (member_id) REFERENCES Member(id) ON DELETE CASCADE
);
select * from DeliveryAddress;
alter table DeliveryAddress rename column address_id to addressId;
alter table DeliveryAddress rename column member_id to memberId;
alter table DeliveryAddress rename column is_default to isDefault;
alter table DeliveryAddress rename column created_at to createdAt;

-- BusinessMember (사업자 전용 정보)
CREATE TABLE BusinessMember (
    id            VARCHAR2(20) PRIMARY KEY,
    biz_number    VARCHAR2(20) UNIQUE NOT NULL,
    company_name  VARCHAR2(100),
    CONSTRAINT fk_bizmember FOREIGN KEY (id) REFERENCES Member(id) ON DELETE CASCADE
);
select * from BusinessMember;
alter table BusinessMember rename column biz_number to bizNumber;
alter table BusinessMember rename column company_name to companyName;

-- 사업자정보 테이블 (PII)
CREATE TABLE BusinessMemberPrivate (
    id        VARCHAR2(20) PRIMARY KEY,
    company_address   VARCHAR2(200),
    company_tel       VARCHAR2(20),
    company_email     VARCHAR2(100) UNIQUE,
    FOREIGN KEY (id) REFERENCES BusinessMember(id) ON DELETE CASCADE
);
select * from BusinessMemberPrivate;
alter table BusinessMemberPrivate rename column company_address to companyAddress;
alter table BusinessMemberPrivate rename column company_tel to companyTel;
alter table BusinessMemberPrivate rename column company_email to companyEmail;


-- 관리자 역할
CREATE TABLE AdminRole (
    role_name     VARCHAR2(20) PRIMARY KEY,     -- 예: super, general, cs
    description   VARCHAR2(100)
);
select * from AdminRole;
alter table AdminRole rename column role_name to roleName;
insert into AdminRole values('owner','총관리');
insert into AdminRole values('admin','컨텐츠,사용자 계정 관리, 사이트 운영 관련');
insert into AdminRole values('editor','공지사항 작성/수정, 게시물 검토');

-- 관리자 계정
CREATE TABLE Admin (
    admin_id      VARCHAR2(20) PRIMARY KEY,         
    password      VARCHAR2(255) NOT NULL,            
    name          VARCHAR2(50) NOT NULL,             
    email         VARCHAR2(100) UNIQUE NOT NULL,
    role          VARCHAR2(20),
    status        CHAR(1) DEFAULT 'A' CHECK (status IN ('A', 'D')), -- A:활성, D:비활성
    created_at    DATE DEFAULT SYSDATE,
    FOREIGN KEY (role) REFERENCES AdminRole(role_name) ON DELETE SET NULL
);
select * from Admin;
alter table Admin rename column admin_id to adminId;
alter table Admin rename column created_at to createdAt;

-- 상품 분류 테이블
create table Catergory (
	code varchar2(10) primary key,
	name varchar2(20)
);
select * from Catergory;

create table OldCategory(
	oldCode varchar2(10) primary key,
	oldName varchar2(20)
);

insert into OldCategory values('a1', '과자');
insert into OldCategory values('b1', '과일');

select * from oldCategory;

insert into catergory values('a1', '과자');
insert into catergory values('b1', '과일');

-- 새 상품 테이블
CREATE TABLE NewProduct (
    np_no          NUMBER(20) PRIMARY KEY NOT NULL,
    np_name        VARCHAR2(40),
    np_content     VARCHAR2(2000),
    np_image       VARCHAR2(100),
    np_price       NUMBER(20),
    np_discount    NUMBER(2),
    np_date        DATE,
    np_like        NUMBER(20),
    np_count       NUMBER(20),
    biz_id         VARCHAR2(20) NOT NULL,
    code           varchar2(10) references Catergory(code)
  --  FOREIGN KEY (biz_id) REFERENCES BusinessMember(biz_id)
);
select * from newProduct;

-- 중고 상품 테이블
CREATE TABLE OldProduct (
    op_no          NUMBER(20) PRIMARY KEY NOT NULL,
    op_name        VARCHAR2(40),
    op_content     VARCHAR2(2000),
    op_image       VARCHAR2(100),
    op_price       NUMBER(20),
    op_discount    NUMBER(2),
    op_date        DATE,
    op_like        NUMBER(20),
    op_status      CHAR(1),
    id             VARCHAR2(20) NOT NULL,
    oldCode        varchar2(10) references OldCategory(oldCode),
    FOREIGN KEY (id) REFERENCES Member(id)
);

select * from OLDPRODUCT;
insert into OLDPRODUCT (oldCode) values ()
-- 중고 거래 테이블
CREATE TABLE OldTrade (
    ot_no    NUMBER(20) PRIMARY KEY NOT NULL,
    ot_status CHAR(1),
    ot_date  DATE,
    id       VARCHAR2(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id)
);

-- 장바구니 테이블
CREATE TABLE Cart (
    c_no     NUMBER(10) PRIMARY KEY NOT NULL,
    c_count  NUMBER(10),
    id       VARCHAR2(20) NOT NULL,
    np_no    NUMBER(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id),
    FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
);

-- 구매 배송지 테이블
CREATE TABLE Delivery_Buy (
    db_no      NUMBER(10) PRIMARY KEY NOT NULL,
    db_name    VARCHAR2(20),
    db_address VARCHAR2(40),
    db_tel     NUMBER(20),
    db_request VARCHAR2(100),
    db_date    DATE,
    bl_count   NUMBER(10),
    id         VARCHAR2(20) NOT NULL,
    np_no      NUMBER(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id),
    FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
    FOREIGN KEY (bl_count) REFERENCES BuyList(bl_count)
);

-- 리뷰 테이블
CREATE TABLE Review (
    r_no      NUMBER(10) PRIMARY KEY NOT NULL,
    r_title   VARCHAR2(30),
    r_content VARCHAR2(1000),
    r_image   VARCHAR2(300),
    r_date    DATE,
    r_score   NUMBER(1),
    id        VARCHAR2(20) NOT NULL,
    np_no     NUMBER(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id),
    FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
);

-- 구매 내역 테이블
CREATE TABLE BuyList (
    bl_no     NUMBER(10) PRIMARY KEY NOT NULL,
    bl_count  NUMBER(10),
    bl_price  NUMBER(10),
    cm_no     NUMBER(20),
    id        VARCHAR2(20) NOT NULL,
    np_no     NUMBER(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id),
    FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
);

-- 좋아요 테이블
CREATE TABLE Like1 (
    icm_no NUMBER(10) PRIMARY KEY NOT NULL,
    id     VARCHAR2(20) NOT NULL,
    np_no  NUMBER(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id),
    FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
);

-- 게시판 테이블
CREATE TABLE Board (
    b_no      NUMBER(10) PRIMARY KEY NOT NULL,
    b_title   VARCHAR2(100),
    b_content VARCHAR2(1000),
    b_date    DATE,
    b_view    NUMBER(10),
    b_image   VARCHAR2(300),
    b_del     CHAR(1),
    id        VARCHAR2(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id)
);
select * from Board;
ALTER TABLE Board DROP (b_ref, b_step, b_level);
update NEWPRODUCT set np_image = 'images.jpg';.

create table loc (
	loc_name varchar2(20) primary key
);

ALTER TABLE loc
MODIFY (loc_name VARCHAR2(40));

insert into loc values('송도동');
insert into loc values('역삼동');
insert into loc values('물금읍');
insert into loc values('봉담읍');
insert into loc values('배방읍');
insert into loc values('서초동');
insert into loc values('옥정동');
insert into loc values('신림동');
insert into loc values('불당동');
insert into loc values('향남읍');
insert into loc values('청담동');
insert into loc values('다산동');
insert into loc values('별내동');
insert into loc values('화도읍');
insert into loc values('다사읍');
insert into loc values('마곡동');
insert into loc values('압구정동');


-- 임시 데이터
-- 회원 테이블 데이터 (10건)

-- 사업자 회원 테이블 데이터 (10건)
INSERT ALL
    INTO BusinessMember VALUES ('biz01', '123-45-67890', '김사장 쇼핑몰', '서울시 마포구 홍대입구', 0221234567, 'kimbiz@email.com', SYSDATE-50, 'N', 'N')
    INTO BusinessMember VALUES ('biz02', '234-56-78901', '이대표 마켓', '서울시 강서구 가양동', 0232345678, 'leebiz@email.com', SYSDATE-40, 'N', 'N')
    INTO BusinessMember VALUES ('biz03', '345-67-89012', '박사장 스토어', '인천시 남동구 구월동', 0323456789, 'parkbiz@email.com', SYSDATE-35, 'N', 'N')
    INTO BusinessMember VALUES ('biz04', '456-78-90123', '최대표 몰', '수원시 영통구 매탄동', 0314567890, 'choibiz@email.com', SYSDATE-30, 'N', 'N')
    INTO BusinessMember VALUES ('biz05', '567-89-01234', '정사장 샵', '성남시 분당구 서현동', 0315678901, 'jeongbiz@email.com', SYSDATE-25, 'N', 'N')
    INTO BusinessMember VALUES ('biz06', '678-90-12345', '강대표 스토어', '안양시 동안구 평촌동', 0316789012, 'kangbiz@email.com', SYSDATE-20, 'N', 'N')
    INTO BusinessMember VALUES ('biz07', '789-01-23456', '송사장 마켓', '고양시 일산구 백석동', 0317890123, 'songbiz@email.com', SYSDATE-18, 'N', 'N')
    INTO BusinessMember VALUES ('biz08', '890-12-34567', '윤대표 몰', '용인시 기흥구 구성동', 0318901234, 'yoonbiz@email.com', SYSDATE-15, 'N', 'N')
    INTO BusinessMember VALUES ('biz09', '901-23-45678', '임사장 샵', '의정부시 신곡동', 0319012345, 'limbiz@email.com', SYSDATE-12, 'N', 'N')
    INTO BusinessMember VALUES ('biz10', '012-34-56789', '한대표 스토어', '부천시 원미구 중동', 0320123456, 'hanbiz@email.com', SYSDATE-10, 'N', 'N')
SELECT 1 FROM DUAL;

-- 새 상품 테이블 데이터 (10건) -- image값 변경 필요
INSERT ALL
    INTO NewProduct VALUES (1, '애플 아이폰 15', '최신 아이폰 15입니다. 256GB 모델', 'images.jpg', 1200000, 10, SYSDATE-10, 25, 100, 'biz01', 'a1')
    INTO NewProduct VALUES (2, '삼성 갤럭시 S24', '갤럭시 S24 울트라 512GB', 'images.jpg', 1500000, 15, SYSDATE-8, 18, 50, 'biz01', 'a1')
    INTO NewProduct VALUES (3, '맥북 프로 M3', '14인치 맥북 프로 M3 칩', 'images.jpg', 2500000, 5, SYSDATE-5, 32, 30, 'biz02', 'a1')
    INTO NewProduct VALUES (4, 'LG 그램 노트북', '17인치 초경량 노트북', 'images.jpg', 1800000, 20, SYSDATE-3, 15, 25, 'biz02', 'a1')
    INTO NewProduct VALUES (5, '에어팟 프로 2세대', '노이즈 캔슬링 무선 이어폰', 'images.jpg', 350000, 12, SYSDATE-1, 41, 80, 'biz03', 'a1')
    INTO NewProduct VALUES (6, '갤럭시 탭 S9', '11인치 안드로이드 태블릿', 'images.jpg', 800000, 8, SYSDATE-7, 22, 40, 'biz03', 'a1')
    INTO NewProduct VALUES (7, '소니 WH-1000XM5', '프리미엄 노이즈 캔슬링 헤드폰', 'images.jpg', 450000, 18, SYSDATE-6, 35, 60, 'biz04', 'a1')
    INTO NewProduct VALUES (8, '닌텐도 스위치 OLED', '휴대용 게임 콘솔', 'images.jpg', 400000, 12, SYSDATE-4, 28, 35, 'biz04','a1')
    INTO NewProduct VALUES (9, '아이패드 에어 5세대', '10.9인치 아이패드 에어', 'images.jpg', 900000, 10, SYSDATE-2, 19, 45, 'biz05','a1')
    INTO NewProduct VALUES (10, 'LG 울트라기어 모니터', '27인치 게이밍 모니터 144Hz', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz06','a1')
    INTO NewProduct VALUES (11, 'LG 울트라기어 모니터1', '27인치 게이밍 모니터 144Hz1', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz07','a1')
    INTO NewProduct VALUES (12, 'LG 울트라기어 모니터2', '27인치 게이밍 모니터 144Hz2', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz08','a1')
    INTO NewProduct VALUES (13, 'LG 울트라기어 모니터3', '27인치 게이밍 모니터 144Hz3', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz09','a1')
    INTO NewProduct VALUES (14, 'LG 울트라기어 모니터4', '27인치 게이밍 모니터 144Hz4', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz10','a1')
    INTO NewProduct VALUES (15, 'LG 울트라기어 모니터5', '27인치 게이밍 모니터 144Hz5', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz11','a1')
    INTO NewProduct VALUES (16, 'LG 울트라기어 모니터6', '27인치 게이밍 모니터 144Hz6', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz12','a1')
    INTO NewProduct VALUES (17, 'LG 울트라기어 모니터7', '27인치 게이밍 모니터 144Hz7', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz13','a1')
    INTO NewProduct VALUES (18, 'LG 울트라기어 모니터8', '27인치 게이밍 모니터 144Hz8', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz14','a1')
    INTO NewProduct VALUES (19, 'LG 울트라기어 모니터9', '27인치 게이밍 모니터 144Hz9', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz15','a1')
    INTO NewProduct VALUES (20, 'LG 울트라기어 모니터10', '27인치 게이밍 모니터 144Hz10', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz16','a1')
    INTO NewProduct VALUES (21, 'LG 울트라기어 모니터11', '27인치 게이밍 모니터 144Hz11', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz17','a1')
    INTO NewProduct VALUES (22, 'LG 울트라기어 모니터12', '27인치 게이밍 모니터 144Hz12', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz18','a1')
    INTO NewProduct VALUES (23, 'LG 울트라기어 모니터13', '27인치 게이밍 모니터 144Hz13', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz19','a1')
    INTO NewProduct VALUES (24, 'LG 울트라기어 모니터14', '27인치 게이밍 모니터 144Hz14', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz20','a1')
    INTO NewProduct VALUES (25, 'LG 울트라기어 모니터15', '27인치 게이밍 모니터 144Hz15', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz21','a1')
    INTO NewProduct VALUES (26, 'LG 울트라기어 모니터16', '27인치 게이밍 모니터 144Hz16', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz22','a1')
    INTO NewProduct VALUES (27, 'LG 울트라기어 모니터17', '27인치 게이밍 모니터 144Hz17', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz23','a1')
    INTO NewProduct VALUES (28, 'LG 울트라기어 모니터18', '27인치 게이밍 모니터 144Hz18', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz24','a1')
    INTO NewProduct VALUES (29, 'LG 울트라기어 모니터19', '27인치 게이밍 모니터 144Hz19', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz25','a1')
    INTO NewProduct VALUES (30, 'LG 울트라기어 모니터20', '27인치 게이밍 모니터 144Hz20', 'images.jpg', 350000, 25, SYSDATE, 31, 20, 'biz26','a1')

SELECT 1 FROM DUAL;
UPDATE newproduct SET np_image = np_no || '.jpg';
SELECT * FROM NewProduct;
select * from oldproduct where op_name like '%'||'작은'||'%';
-- 중고 상품 테이블 데이터 (10건)
INSERT INTO OldProduct VALUES (11, '작은 HDMI 케이블', '급처합니다.', 'images01.jpg', 469734, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (22, '작은 선풍기 케이블', '급처합니다.', 'images01.jpg', 32100, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (23, '작은 손선풍기 케이블', '급처합니다.', 'images01.jpg', 98000, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (24, '작은 공기청정기 케이블', '급처합니다.', 'images01.jpg', 36000, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (25, '작은 모니터 케이블', '급처합니다.', 'images01.jpg', 9000, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (26, '사용감 있고 작은 사이즈의 티비 케이블', '급처합니다.', 'images01.jpg', 50000, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (27, '제일 작은 초소형 TV', '급처합니다.', 'images01.jpg', 20000, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (28, '작은 마우스 팝니다', '급처합니다.', 'images01.jpg', 36000, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (29, '제일 작은 마우스', '급처합니다.', 'images01.jpg', 57000, 0, SYSDATE-29, 1, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (12, '고급 청소기', '풀세트 구성입니다.', 'images01.jpg', 965028, 0, SYSDATE-17, 2, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (13, '대형 블렌더', '풀세트 구성입니다.', 'images01.jpg', 839174, 0, SYSDATE-17, 8, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (14, '작은 삼각대', '약간의 사용감 있음', 'images01.jpg', 819841, 0, SYSDATE-7, 18, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (15, '구형 노트북', '생활기스 있음', 'images01.jpg', 416845, 0, SYSDATE-28, 5, 'C', 'test00', 'a1');
INSERT INTO OldProduct VALUES (16, '대형 커피 머신', '직거래 선호', 'images01.jpg', 183673, 0, SYSDATE-27, 6, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (17, '휴대용 외장하드', '풀세트 구성입니다.', 'images01.jpg', 110200, 0, SYSDATE-25, 6, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (18, '블루투스 라디오', '사용에는 문제없습니다.', 'images01.jpg', 496287, 0, SYSDATE-8, 20, 'S', 'test00', 'a1');
INSERT INTO OldProduct VALUES (19, '작은 노이즈캔슬링 이어폰', '급처합니다.', 'images01.jpg', 80447, 0, SYSDATE-22, 18, 'C', 'test00', 'a1');
INSERT INTO OldProduct VALUES (20, '유선 노이즈캔슬링 이어폰', '거의 새 제품입니다.', 'images01.jpg', 481007, 0, SYSDATE-4, 5, 'C', 'test00', 'a1');
INSERT INTO OldProduct VALUES (21, '중형 무선 공유기', '사용에는 문제없습니다.', 'images01.jpg', 916344, 0, SYSDATE-18, 8, 'S', 'test00', 'a1');
    
update OLDPRODUCT set op_image ='images01.jpg';



UPDATE OLDPRODUCT SET op_image = 'mouse.jpg' WHERE op_no = 29;
UPDATE OLDPRODUCT SET op_image = 'sMouse.jpg' WHERE op_no = 28;
UPDATE OLDPRODUCT SET op_image = 'tv.jpg' WHERE op_no = 27;
UPDATE OLDPRODUCT SET op_image = 'cable.jpg' WHERE op_no = 26;
UPDATE OLDPRODUCT SET op_image = 'cable.jpg' WHERE op_no = 25;
UPDATE OLDPRODUCT SET op_image = 'cable.jpg' WHERE op_no = 24;
UPDATE OLDPRODUCT SET op_image = 'cable.jpg' WHERE op_no = 23;
UPDATE OLDPRODUCT SET op_image = 'fanCable.jpg' WHERE op_no = 22;
UPDATE OLDPRODUCT SET op_image = 'iptime.jpg' WHERE op_no = 21;
UPDATE OLDPRODUCT SET op_image = '21.jpg' WHERE op_no = 20;
UPDATE OLDPRODUCT SET op_image = '19.jpg' WHERE op_no = 19;
UPDATE OLDPRODUCT SET op_image = '18.jpg' WHERE op_no = 18;
UPDATE OLDPRODUCT SET op_image = '17.jpg' WHERE op_no = 17;
UPDATE OLDPRODUCT SET op_image = 'coffeMachine.jpg' WHERE op_no = 16;
UPDATE OLDPRODUCT SET op_image = 'noteBook.jpg' WHERE op_no = 15;
UPDATE OLDPRODUCT SET op_image = 'triangle.jpg' WHERE op_no = 14;
UPDATE OLDPRODUCT SET op_image = 'cleanMachine.jpg' WHERE op_no = 12;
UPDATE OLDPRODUCT SET op_image = 'lastCable.jpg' WHERE op_no = 11;

select * from OLDPRODUCT;

INSERT INTO OldCategory (oldCode, oldName)
VALUES ('c1', '전자제품');
COMMIT;

UPDATE OldProduct
SET oldCode = 'c1'
WHERE op_name LIKE '%케이블%';

UPDATE OldProduct
SET op_image = 'images01.jpg'
WHERE op_no = 11;
-- 중고 거래 테이블 데이터 (10건)
INSERT ALL
    INTO OldTrade VALUES (1, '1', 'C', SYSDATE-2, 'user02')
    INTO OldTrade VALUES (2, '2', 'P', SYSDATE-1, 'user03')
    INTO OldTrade VALUES (3, '4', 'C', SYSDATE, 'user01')
    INTO OldTrade VALUES (4, '5', 'C', SYSDATE-5, 'user04')
    INTO OldTrade VALUES (5, '6', 'P', SYSDATE-3, 'user05')
    INTO OldTrade VALUES (6, '7', 'C', SYSDATE-2, 'user06')
    INTO OldTrade VALUES (7, '8', 'P', SYSDATE-1, 'user07')
    INTO OldTrade VALUES (8, '9', 'P', SYSDATE, 'user01')
    INTO OldTrade VALUES (9, '10', 'P', SYSDATE, 'user04')
    INTO OldTrade VALUES (10, '3', 'P', SYSDATE-1, 'user05')
    
SELECT 1 FROM DUAL;

-- 장바구니 테이블 데이터 (10건)
INSERT ALL
    INTO Cart VALUES (1, 1, 'user01', 1)
    INTO Cart VALUES (2, 2, 'user01', 5)
    INTO Cart VALUES (3, 1, 'user02', 3)
    INTO Cart VALUES (4, 1, 'user03', 2)
    INTO Cart VALUES (5, 3, 'user04', 5)
    INTO Cart VALUES (6, 1, 'user05', 6)
    INTO Cart VALUES (7, 2, 'user06', 7)
    INTO Cart VALUES (8, 1, 'user07', 8)
    INTO Cart VALUES (9, 1, 'user01', 9)
    INTO Cart VALUES (10, 2, 'user02', 10)
SELECT 1 FROM DUAL;

-- 구매 배송지 테이블 데이터 (10건)
INSERT ALL
    INTO Delivery_Buy VALUES (1, '김철수', '서울시 강남구 역삼동 123-45', 01012345678, '문 앞에 놓아주세요', SYSDATE-5, 1, 'user01', 1)
    INTO Delivery_Buy VALUES (2, '이영희', '서울시 서초구 방배동 67-89', 01023456789, '부재시 경비실에', SYSDATE-3, 1, 'user02', 3)
    INTO Delivery_Buy VALUES (3, '박민수', '부산시 해운대구 우동 12-34', 01034567890, '직접 받겠습니다', SYSDATE-1, 2, 'user03', 5)
    INTO Delivery_Buy VALUES (4, '정다은', '대구시 중구 동성로 56-78', 01045678901, '배송 전 연락주세요', SYSDATE-8, 1, 'user04', 2)
    INTO Delivery_Buy VALUES (5, '최민지', '광주시 동구 충장로 90-12', 01056789012, '오후 3시 이후 배송', SYSDATE-6, 1, 'user05', 4)
    INTO Delivery_Buy VALUES (6, '강호동', '대전시 유성구 봉명동 34-56', 01067890123, '현관문 앞', SYSDATE-4, 3, 'user06', 6)
    INTO Delivery_Buy VALUES (7, '송지효', '울산시 남구 달동 78-90', 01078901234, '택배함 이용', SYSDATE-2, 1, 'user07', 7)
    INTO Delivery_Buy VALUES (8, '김철수', '서울시 강남구 역삼동 123-45', 01012345678, '안전배송 부탁드려요', SYSDATE-7, 2, 'user01', 8)
    INTO Delivery_Buy VALUES (9, '이영희', '서울시 서초구 방배동 67-89', 01023456789, '주말 배송 가능', SYSDATE-3, 1, 'user02', 9)
    INTO Delivery_Buy VALUES (10, '박민수', '부산시 해운대구 우동 12-34', 01034567890, '빠른 배송 요청', SYSDATE-1, 1, 'user03', 10)
SELECT 1 FROM DUAL;

-- 리뷰 테이블 데이터 (10건)
INSERT ALL
    INTO Review VALUES (1, '정말 좋아요!', '빠른 배송에 상품도 만족스럽습니다. 추천드려요!', 'review1.jpg', SYSDATE-3, 5, 'user01', 1)
    INTO Review VALUES (2, '가성비 좋네요', '예상보다 품질이 좋습니다. 다음에도 구매할게요.', 'review2.jpg', SYSDATE-2, 4, 'user02', 3)
    INTO Review VALUES (3, '보통이에요', '나쁘지 않지만 특별하지도 않아요.', '', SYSDATE-1, 3, 'user03', 5)
    INTO Review VALUES (4, '최고입니다!', '완전 만족해요. 5점 드립니다!', 'review4.jpg', SYSDATE, 5, 'user04', 2)
    INTO Review VALUES (5, '배송이 빨라요', '주문 다음날 바로 도착했어요. 포장도 꼼꼼하고요.', 'review5.jpg', SYSDATE-4, 4, 'user05', 4)
    INTO Review VALUES (6, '색상이 예뻐요', '사진보다 실물이 더 예쁘네요. 만족합니다.', 'review6.jpg', SYSDATE-5, 5, 'user06', 6)
    INTO Review VALUES (7, '품질이 아쉬워요', '가격 대비 품질이 조금 아쉽습니다.', '', SYSDATE-6, 2, 'user07', 7)
    INTO Review VALUES (8, '딱 적당해요', '가격도 적당하고 품질도 적당해요. 무난합니다.', 'review8.jpg', SYSDATE-7, 3, 'user01', 8)
    INTO Review VALUES (9, '강력 추천!', '정말 좋은 상품이에요. 주변에 추천하고 싶어요.', 'review9.jpg', SYSDATE-8, 5, 'user02', 9)
    INTO Review VALUES (10, '재구매 의사 있어요', '만족스러운 구매였습니다. 재구매 예정이에요.', 'review10.jpg', SYSDATE-9, 4, 'user03', 10)
SELECT 1 FROM DUAL;

-- 구매 내역 테이블 데이터 (10건)
INSERT ALL
    INTO BuyList VALUES (1, 1, 1080000, 1, 'user01', 1)
    INTO BuyList VALUES (2, 1, 2125000, 2, 'user02', 3)
    INTO BuyList VALUES (3, 2, 616000, 3, 'user03', 5)
    INTO BuyList VALUES (4, 1, 1275000, 4, 'user04', 2)
    INTO BuyList VALUES (5, 1, 1440000, 5, 'user05', 4)
    INTO BuyList VALUES (6, 3, 1968000, 6, 'user06', 6)
    INTO BuyList VALUES (7, 1, 369000, 7, 'user07', 7)
    INTO BuyList VALUES (8, 2, 704000, 8, 'user01', 8)
    INTO BuyList VALUES (9, 1, 810000, 9, 'user02', 9)
    INTO BuyList VALUES (10, 1, 262500, 10, 'user03', 10)
SELECT 1 FROM DUAL;

-- 좋아요 테이블 데이터 (10건)
INSERT ALL
    INTO Like1 VALUES (1, 'user01', 1)
    INTO Like1 VALUES (2, 'user01', 3)
    INTO Like1 VALUES (3, 'user01', 5)
    INTO Like1 VALUES (4, 'user02', 1)
    INTO Like1 VALUES (5, 'user02', 2)
    INTO Like1 VALUES (6, 'user03', 3)
    INTO Like1 VALUES (7, 'user03', 4)
    INTO Like1 VALUES (8, 'user04', 2)
    INTO Like1 VALUES (9, 'user04', 5)
    INTO Like1 VALUES (10, 'user05', 6)
SELECT 1 FROM DUAL;

-- 게시판 테이블 데이터 (10건)
INSERT INTO Board (b_no, b_title, b_content, b_date, b_view, b_image, b_del, id)
VALUES (1,  '중고 거래 팁', '첫 구매자를 위한 체크리스트', SYSDATE-20, 35, NULL, 'N', 'test00');

INSERT INTO Board VALUES (2,  '모니터 판매(27")', '직거래만 가능합니다.', SYSDATE-19, 52, 'images/monitor.jpg', 'N', 'test00');
INSERT INTO Board VALUES (3,  '키보드 추천 부탁', '저소음 스위치 추천받아요.', SYSDATE-18, 21, NULL, 'N', 'test00');
INSERT INTO Board VALUES (4,  '그래픽카드 구매 후기', '가성비 좋아요.', SYSDATE-18, 28, NULL, 'N', 'test00');
INSERT INTO Board VALUES (5,  '노트북 램 업그레이드', '16→32GB 체감 후기', SYSDATE-17, 19, NULL, 'N', 'test00');

INSERT INTO Board VALUES (6,  '헤드셋 나눔', '생활기스 있음, 직거래', SYSDATE-16, 40, 'images/headset.jpg', 'N', 'test00');
INSERT INTO Board VALUES (7,  '공유기 설정 팁', '채널 고정 추천', SYSDATE-15, 14, NULL, 'N', 'test00');
INSERT INTO Board VALUES (8,  '중고폰 체크리스트', '배터리/통신사/침수 확인', SYSDATE-15, 33, NULL, 'N', 'test00');
INSERT INTO Board VALUES (9,  '의자 판매', '요철 약간, 사용감 보통', SYSDATE-14, 11, 'images/chair.jpg', 'N', 'test00');
INSERT INTO Board VALUES (10, '책상 무료 드림', '직접 가져가실 분', SYSDATE-13, 26, NULL, 'N', 'test00');

INSERT INTO Board VALUES (11, '마우스 추천', '무소음 위주로 찾습니다.', SYSDATE-12, 17, NULL, 'N', 'test00');
INSERT INTO Board VALUES (12, 'SSD 벤치 결과', '읽기/쓰기 속도 공유', SYSDATE-12, 23, NULL, 'N', 'test00');
INSERT INTO Board VALUES (13, '캡쳐보드 팝니다', '방송용 사용', SYSDATE-11, 15, 'images/capture.jpg', 'N', 'test00');
INSERT INTO Board VALUES (14, '태블릿 수리기', '액정 교체 후기', SYSDATE-10, 18, NULL, 'N', 'test00');
INSERT INTO Board VALUES (15, '스피커 비교', '2채널 vs 사운드바', SYSDATE-9, 22, NULL, 'N', 'test00');

INSERT INTO Board VALUES (16, '미니빔 추천', '원룸 사용자 경험', SYSDATE-8, 13, 'images/projector.jpg', 'N', 'test00');
INSERT INTO Board VALUES (17, '케이블 대정리', '케이블 타이 꿀팁', SYSDATE-7, 9, NULL, 'N', 'test00');
INSERT INTO Board VALUES (18, '가성비 노트북', '12세대 i5 후기', SYSDATE-6, 31, NULL, 'N', 'test00');
INSERT INTO Board VALUES (19, '모니터 암 설치기', '책상 공간 확장', SYSDATE-5, 16, NULL, 'N', 'test00');
INSERT INTO Board VALUES (20, '중고 직거래 장소', '추천 스팟 모음', SYSDATE-4, 27, NULL, 'N', 'test00');

update Board set b_image ='images.png';

-- 60자 버전
UPDATE Board SET b_content = '상태 양호한 27인치 FHD 모니터, 색감과 밝기 우수하며 직거래만 가능합니다' WHERE b_no = 2;
UPDATE Board SET b_content = '중급 사양의 그래픽카드, 발열 적고 소음 낮으며 가격 대비 성능이 만족스럽습니다' WHERE b_no = 4;
UPDATE Board SET b_content = '기존 16GB에서 32GB로 업그레이드 후 멀티태스킹과 프로그램 실행 속도가 눈에 띄게 향상됨' WHERE b_no = 5;
UPDATE Board SET b_content = '거래 전 반드시 배터리 건강도, 침수 이력, 통신사 락 여부를 철저히 확인하세요' WHERE b_no = 8;
UPDATE Board SET b_content = '방송 송출 및 녹화용 4K 지원 캡쳐보드, 화질 선명하고 딜레이 없이 사용 가능하며 상태 양호' WHERE b_no = 13;


UPDATE Board SET b_title='방이동 근처 혼자 등산 가실 분 계신가요',b_content = '주말에 한강변 따라 가볍게 걷고 등산하려고 해요. 왕복 2~3시간 코스 생각 중입니다.' WHERE b_no = 20;
UPDATE Board SET b_title='중고 냉장고 급하게 구합니다' ,b_content = '이번 주 안에 300L 이상 냉장고 필요합니다. 사용감 있어도 깨끗하고 기능만 멀쩡하면 돼요.' WHERE b_no = 19;
UPDATE Board SET b_title='잠실역 근처 조용한 카페 추천 좀요' ,b_content = '작업할 일이 많아서 3~4시간 앉아있어도 괜찮은 조용한 카페 있으면 알려주세요' WHERE b_no = 18;
UPDATE Board SET b_title='전동 킥보드 배터리 수리 가능할까요' ,b_content = '2년 쓴 킥보드인데 충전이 안됩니다. 혹시 근처에서 저렴하게 수리 가능한 곳 있을까요?' WHERE b_no = 17;
UPDATE Board SET b_title='반려견 같이 산책하실 분 구해요' ,b_content = '저녁 8시쯤 석촌호수 한 바퀴 같이 걸으실 분 있나요? 소형견 키우는 분이면 더 좋아요.' WHERE b_no = 16;

select * from BOARD;


UPDATE Board
SET b_image = 'Rectangle.png'
WHERE b_no = 15;
-- 필요시 커밋
-- COMMIT;

