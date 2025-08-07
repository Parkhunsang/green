﻿-- Member (공통 정보)
CREATE TABLE Member (
    id            VARCHAR2(20) PRIMARY KEY,
    password      VARCHAR2(255),
    email         VARCHAR2(100) UNIQUE NOT NULL,
    member_type   CHAR(1) NOT NULL CHECK (member_type IN ('i', 'b')), --일반 i 비즈니스 b
    status		  CHAR(1) DEFAULT 'A' CHECK (status IN ('A', 'D', 'S')) -- 활성화 A 삭제대기 D 계정정지 S
);
alter table Member add reg_date date default sysdate;

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

-- BusinessMember (사업자 전용 정보)
CREATE TABLE BusinessMember (
    id            VARCHAR2(20) PRIMARY KEY,
    biz_number    VARCHAR2(20) UNIQUE NOT NULL,
    company_name  VARCHAR2(100),
    CONSTRAINT fk_bizmember FOREIGN KEY (id) REFERENCES Member(id) ON DELETE CASCADE
);

-- 사업자정보 테이블 (PII)
CREATE TABLE BusinessMemberPrivate (
    id        VARCHAR2(20) PRIMARY KEY,
    company_address   VARCHAR2(200),
    company_tel       VARCHAR2(20),
    company_email     VARCHAR2(100) UNIQUE,
    FOREIGN KEY (id) REFERENCES BusinessMember(id) ON DELETE CASCADE
);

-- 관리자 역할
CREATE TABLE AdminRole (
    role_name     VARCHAR2(20) PRIMARY KEY,     -- 예: super, general, cs
    description   VARCHAR2(100)
);

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

-- 상품 분류 테이블
create table Catergory (
	code varchar2(10) primary key,
	name varchar2(20)
);
insert into catergory values('a1', '과자');
insert into catergory values('b1', '과일');
drop table newProduct;
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
    FOREIGN KEY (id) REFERENCES Member(id)
);

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
    b_ref     NUMBER(10),
    b_step    NUMBER(10),
    b_level   NUMBER(10),
    id        VARCHAR2(20) NOT NULL,
    FOREIGN KEY (id) REFERENCES Member(id)
);
select * from NEWPRODUCT;
update NEWPRODUCT set np_image = 'images.jpg';
-- 임시 데이터
-- 회원 테이블 데이터 (10건)
INSERT ALL
    INTO Member VALUES ('user01', 'password123', '김철수', '서울시 강남구 역삼동 123-45', '010-1234-5678', 'kimcs@email.com', SYSDATE-30, 'N', 'N', 'N')
    INTO Member VALUES ('user02', 'password456', '이영희', '서울시 서초구 방배동 67-89', '010-2345-6789', 'leeyh@email.com', SYSDATE-25, 'N', 'N', 'N')
    INTO Member VALUES ('user03', 'password789', '박민수', '부산시 해운대구 우동 12-34', '010-3456-7890', 'parkms@email.com', SYSDATE-20, 'N', 'N', 'N')
    INTO Member VALUES ('user04', 'password321', '정다은', '대구시 중구 동성로 56-78', '010-4567-8901', 'jeongde@email.com', SYSDATE-15, 'N', 'N', 'N')
    INTO Member VALUES ('user05', 'password654', '최민지', '광주시 동구 충장로 90-12', '010-5678-9012', 'choimg@email.com', SYSDATE-12, 'N', 'N', 'N')
    INTO Member VALUES ('user06', 'password987', '강호동', '대전시 유성구 봉명동 34-56', '010-6789-0123', 'kanghd@email.com', SYSDATE-10, 'N', 'N', 'N')
    INTO Member VALUES ('user07', 'password111', '송지효', '울산시 남구 달동 78-90', '010-7890-1234', 'songjh@email.com', SYSDATE-8, 'N', 'N', 'N')
    INTO Member VALUES ('admin01', 'admin123', '관리자', '서울시 종로구 세종로 1', '010-0000-0000', 'admin@email.com', SYSDATE-100, 'N', 'Y', 'N')
    INTO Member VALUES ('biz01', 'bizpass123', '김사장', '서울시 마포구 홍대입구 11-22', '010-1111-1111', 'kimbiz@email.com', SYSDATE-50, 'N', 'N', 'B')
    INTO Member VALUES ('biz02', 'bizpass456', '이대표', '서울시 강서구 가양동 33-44', '010-2222-2222', 'leebiz@email.com', SYSDATE-40, 'N', 'N', 'B')
SELECT 1 FROM DUAL;

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

-- 중고 상품 테이블 데이터 (10건)
INSERT ALL
    INTO OldProduct VALUES (1, '중고 아이폰 12', '상태 좋은 아이폰 12 팝니다', 'used_iphone12.jpg', 600000, 0, SYSDATE-7, 8, 'used_iphone12_detail.jpg', 'S', 1, 'user01')
    INTO OldProduct VALUES (2, '중고 갤럭시 노트20', '약간의 스크래치 있음', 'used_note20.jpg', 450000, 0, SYSDATE-5, 12, 'used_note20_detail.jpg', 'S', 1, 'user02')
    INTO OldProduct VALUES (3, '중고 맥북 에어', '2020년 모델, 배터리 교체함', 'used_macbook.jpg', 800000, 0, SYSDATE-3, 6, 'used_macbook_detail.jpg', 'S', 1, 'user03')
    INTO OldProduct VALUES (4, '중고 아이패드', '아이패드 8세대 32GB', 'used_ipad.jpg', 300000, 0, SYSDATE-2, 4, 'used_ipad_detail.jpg', 'C', 1, 'user04')
    INTO OldProduct VALUES (5, '중고 에어팟', '1세대 에어팟, 케이스 포함', 'used_airpods.jpg', 80000, 0, SYSDATE-10, 15, 'used_airpods_detail.jpg', 'S', 1, 'user05')
    INTO OldProduct VALUES (6, '중고 게이밍 마우스', '로지텍 G502 게이밍 마우스', 'used_mouse.jpg', 45000, 0, SYSDATE-8, 7, 'used_mouse_detail.jpg', 'S', 1, 'user06')
    INTO OldProduct VALUES (7, '중고 키보드', '기계식 키보드 청축', 'used_keyboard.jpg', 120000, 0, SYSDATE-6, 9, 'used_keyboard_detail.jpg', 'C', 1, 'user07')
    INTO OldProduct VALUES (8, '중고 모니터', '24인치 FHD 모니터', 'used_monitor.jpg', 180000, 0, SYSDATE-4, 11, 'used_monitor_detail.jpg', 'S', 1, 'user01')
    INTO OldProduct VALUES (9, '중고 태블릿', '갤럭시 탭 A7 라이트', 'used_tablet.jpg', 150000, 0, SYSDATE-1, 5, 'used_tablet_detail.jpg', 'S', 1, 'user02')
    INTO OldProduct VALUES (10, '중고 스마트워치', '애플워치 SE 1세대', 'used_watch.jpg', 200000, 0, SYSDATE, 3, 'used_watch_detail.jpg', 'S', 1, 'user03')
SELECT 1 FROM DUAL;

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
INSERT ALL
    INTO Board VALUES (1, '사이트 이용 문의', '회원가입은 어떻게 하나요?', SYSDATE-10, 25, '', 'N', 1, 0, 0, 'user01')
    INTO Board VALUES (2, '답변: 사이트 이용 문의', '회원가입 페이지에서 가능합니다.', SYSDATE-9, 15, '', 'N', 1, 1, 1, 'admin01')
    INTO Board VALUES (3, '배송 관련 문의', '배송은 보통 며칠 걸리나요?', SYSDATE-8, 32, '', 'N', 3, 0, 0, 'user02')
    INTO Board VALUES (4, '상품 추천 요청', '노트북 추천 부탁드려요', SYSDATE-5, 18, '', 'N', 4, 0, 0, 'user03')
    INTO Board VALUES (5, '불만사항', '배송이 너무 늦어요', SYSDATE-3, 42, '', 'N', 5, 0, 0, 'user04')
    INTO Board VALUES (6, '답변: 불만사항', '죄송합니다. 확인 후 연락드리겠습니다.', SYSDATE-2, 28, '', 'N', 5, 1, 1, 'admin01')
    INTO Board VALUES (7, '이벤트 문의', '할인 이벤트 언제 하나요?', SYSDATE-1, 35, '', 'N', 7, 0, 0, 'user01')
    INTO Board VALUES (8, '교환/반품 문의', '상품 교환이 가능한가요?', SYSDATE-7, 22, '', 'N', 8, 0, 0, 'user05')
    INTO Board VALUES (9, '결제 관련 문의', '무통장입금도 가능한가요?', SYSDATE-6, 19, '', 'N', 9, 0, 0, 'user06')
    INTO Board VALUES (10, '상품 문의', '재입고 예정이 있나요?', SYSDATE-4, 31, '', 'N', 10, 0, 0, 'user07')
SELECT 1 FROM DUAL;

COMMIT;
