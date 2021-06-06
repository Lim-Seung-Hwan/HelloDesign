DROP TABLE shop_cart;
DROP TABLE shop_order;
DROP TABLE shop_member;
DROP TABLE shop_goods;

DROP SEQUENCE shop_member_num_seq;
DROP SEQUENCE shop_goods_num_seq;

CREATE TABLE shop_member (
m_num NUMBER,
m_ID VARCHAR2(255),
m_PW VARCHAR2(255) NOT NULL,
m_name VARCHAR2(15) NOT NULL,
m_address VARCHAR2(255),
m_phone VARCHAR2(15),
CONSTRAINT shop_member_pk PRIMARY KEY(m_num),
CONSTRAINT shop_member_id_uk unique(m_ID));


CREATE TABLE shop_goods(
g_num NUMBER,
g_price NUMBER,
g_name VARCHAR2(255) NOT NULL,
g_info VARCHAR2(255),
g_img_path VARCHAR2(255),
g_tag VARCHAR2(25),
g_category VARCHAR2(25),
CONSTRAINT goods_num_pk PRIMARY KEY(g_num));

CREATE TABLE shop_cart (
m_num NUMBER,
g_num NUMBER,
CONSTRAINT cart_m_num_fk foreign key(m_num) REFERENCES shop_member(m_num),
CONSTRAINT cart_g_num_fk foreign key(g_num) REFERENCES shop_goods(g_num)
);

CREATE TABLE shop_order (
o_num NUMBER,
o_address VARCHAR2(255),
o_name VARCHAR2(255),
o_phone VARCHAR2(15),
g_num NUMBER,
o_way VARCHAR2(10),
o_date date,
CONSTRAINT order_num_pk PRIMARY KEY(o_num),
CONSTRAINT order_gnum_fk foreign key(g_num) REFERENCES shop_goods(g_num) 
);


CREATE SEQUENCE shop_member_num_seq
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE shop_goods_num_seq
INCREMENT BY 1
START WITH 1;

ALTER TABLE shop_cart ADD (g_count number);
COMMIT;
ALTER TABLE shop_order ADD (m_num number) add constraint order_mnum_fk foreign key(m_num) references shop_member(m_num);
CREATE SEQUENCE shop_order_num_seq INCREMENT BY 1 START WITH 1;
ALTER TABLE shop_order ADD(o_count number);
ALTER TABLE shop_order MODIFY o_date VARCHAR2(25);
COMMIT;

desc shop_cart;
SELECT * FROM shop_goods;

select * from shop_goods where g_name like '머그컵2';

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_eco/spring_bag_1.jpg', 'spring', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_eco/spring_bag_2.png', 'spring', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_eco/spring_bag_3.png', 'spring', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_eco/summer_bag_1.png', 'summer', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_eco/summer_bag_2.png', 'summer', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_eco/summer_bag_3.png', 'summer', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_apron/spring_apron_1.png', 'spring', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_apron/spring_apron_2.png', 'spring', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_apron/spring_apron_3.png', 'spring', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_apron/summer_apron_2.png', 'summer', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_apron/summer_apron_3.png', 'summer', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_mug/spring_cup_1.png', 'spring', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_mug/spring_cup_2.jpg', 'spring', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_mug/spring_cup_3.png', 'spring', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_mug/summer_cup_1.jpg', 'summer', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_mug/summer_cup_2.png', 'summer', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_mug/summer_cup_3.png', 'summer', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_chair/spring_chair_1.png', 'spring', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_chair/spring_chair_2.jpg', 'spring', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/spring_chair/spring_chair_3.png', 'spring', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_chair/summer_chair_1.png', 'summer', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_chair/summer_chair_2.png', 'summer', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 100, '상품명', '상품 설명', 'img/summer_chair/summer_chair_3.jpg', 'summer', 'chair');