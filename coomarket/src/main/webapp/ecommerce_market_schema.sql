

-- 회원 테이블 (일반 + 사업자 구분)
CREATE TABLE Member (
    id            VARCHAR(20) PRIMARY KEY,
    password      VARCHAR(20) NOT NULL,
    name          VARCHAR(20) NOT NULL,
    address       VARCHAR(230),
    tel           VARCHAR(20),
    email         VARCHAR(50),
    reg_date      DATE,
    del           CHAR(1) DEFAULT 'N',
    is_admin      CHAR(1) DEFAULT 'N',
    member_type   CHAR(1) NOT NULL  -- 'N'=일반회원, 'B'=사업자회원
);


insert into Member(id, password, name, address, tel, email, member_type) values('test00', '0', 'name', 'juso', '010-0000-0000', 'abcd@efg.com', 'N');
drop table Member;

-- 사업자회원 전용 정보
CREATE TABLE BusinessMember (
    biz_id        INT AUTO_INCREMENT PRIMARY KEY,
    member_id     VARCHAR(20) NOT NULL,
    biz_number    VARCHAR(20) NOT NULL,
    biz_name      VARCHAR(100) NOT NULL,
    biz_address   VARCHAR(200),
    biz_tel       VARCHAR(20),
    biz_email     VARCHAR(50),
    biz_reg_date  DATE,
    CONSTRAINT fk_business_member FOREIGN KEY (member_id) REFERENCES Member(id)
);

-- 새상품 테이블 (사업자회원만 등록 가능)
CREATE TABLE NewProduct (
    np_no         INT AUTO_INCREMENT PRIMARY KEY,
    seller_id     VARCHAR(20) NOT NULL, -- 사업자회원
    np_name       VARCHAR(240) NOT NULL,
    np_content    VARCHAR(2000),
    np_image      VARCHAR(2100),
    np_price      DECIMAL(10,2),
    np_discount   DECIMAL(5,2),
    np_date       DATE,
    np_like       INT DEFAULT 0,
    np_count      INT DEFAULT 0,
    np_detailimage VARCHAR(2100),
    CONSTRAINT fk_newproduct_seller FOREIGN KEY (seller_id) REFERENCES Member(id)
);

-- 새상품 관련 구매/리뷰/배송
CREATE TABLE BuyList (
    bl_no         INT AUTO_INCREMENT PRIMARY KEY,
    id            VARCHAR(20) NOT NULL,
    np_no         INT NOT NULL,
    bl_count      INT,
    bl_price      DECIMAL(10,2),
    CONSTRAINT fk_buylist_member FOREIGN KEY (id) REFERENCES Member(id),
    CONSTRAINT fk_buylist_product FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
);

CREATE TABLE Review (
    r_no          INT AUTO_INCREMENT PRIMARY KEY,
    id            VARCHAR(20) NOT NULL,
    np_no         INT NOT NULL,
    r_title       VARCHAR(30),
    r_content     VARCHAR(1000),
    r_image       VARCHAR(300),
    r_date        DATE,
    r_score       INT,
    CONSTRAINT fk_review_member FOREIGN KEY (id) REFERENCES Member(id),
    CONSTRAINT fk_review_product FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
);

CREATE TABLE Delivery_Buy (
    db_no         INT AUTO_INCREMENT PRIMARY KEY,
    id            VARCHAR(20) NOT NULL,
    np_no         INT NOT NULL,
    db_name       VARCHAR(20),
    db_address    VARCHAR(240),
    db_tel        VARCHAR(20),
    db_request    VARCHAR(100),
    db_date       DATE,
    CONSTRAINT fk_delivery_member FOREIGN KEY (id) REFERENCES Member(id),
    CONSTRAINT fk_delivery_product FOREIGN KEY (np_no) REFERENCES NewProduct(np_no)
);

-- 중고거래 상품 테이블 (일반회원만 등록 가능)
CREATE TABLE OldProduct (
    op_no         INT AUTO_INCREMENT PRIMARY KEY,
    seller_id     VARCHAR(20) NOT NULL, -- 일반회원
    op_name       VARCHAR(240) NOT NULL,
    op_content    VARCHAR(2000),
    op_price      DECIMAL(10,2),
    op_image      VARCHAR(2100),
    op_status     CHAR(1) DEFAULT 'S',  -- S=판매중, R=예약중, C=거래완료
    op_category   VARCHAR(50),
    op_location   VARCHAR(100),
    op_date       DATE,
    op_count      INT DEFAULT 0,
    CONSTRAINT fk_oldproduct_seller FOREIGN KEY (seller_id) REFERENCES Member(id)
);

-- 중고거래 예약/거래 테이블
CREATE TABLE OldTrade (
    ot_no         INT AUTO_INCREMENT PRIMARY KEY,
    op_no         INT NOT NULL,
    buyer_id      VARCHAR(20) NOT NULL,
    ot_status     CHAR(1) DEFAULT 'R',  -- R=예약, C=거래완료
    ot_date       DATE,
    ot_location   VARCHAR(100),
    CONSTRAINT fk_oldtrade_product FOREIGN KEY (op_no) REFERENCES OldProduct(op_no),
    CONSTRAINT fk_oldtrade_buyer FOREIGN KEY (buyer_id) REFERENCES Member(id)
);

-- 중고거래 채팅방
CREATE TABLE OldChatRoom (
    room_no       INT AUTO_INCREMENT PRIMARY KEY,
    op_no         INT NOT NULL,
    seller_id     VARCHAR(20) NOT NULL,
    buyer_id      VARCHAR(20) NOT NULL,
    created_at    DATE,
    CONSTRAINT fk_chatroom_product FOREIGN KEY (op_no) REFERENCES OldProduct(op_no),
    CONSTRAINT fk_chatroom_seller FOREIGN KEY (seller_id) REFERENCES Member(id),
    CONSTRAINT fk_chatroom_buyer FOREIGN KEY (buyer_id) REFERENCES Member(id)
);

-- 중고거래 채팅 메시지
CREATE TABLE OldChatMessage (
    msg_no        INT AUTO_INCREMENT PRIMARY KEY,
    room_no       INT NOT NULL,
    sender_id     VARCHAR(20) NOT NULL,
    msg_text      VARCHAR(2000),
    msg_time      DATETIME,
    is_read       CHAR(1) DEFAULT 'N',
    CONSTRAINT fk_chatmessage_room FOREIGN KEY (room_no) REFERENCES OldChatRoom(room_no),
    CONSTRAINT fk_chatmessage_sender FOREIGN KEY (sender_id) REFERENCES Member(id)
);
