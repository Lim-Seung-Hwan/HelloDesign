
DELETE FROM shop_order;
DELETE FROM shop_cart;
DELETE FROM shop_goods;

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '봄 앞치마', '봄 앞치마1', 'attach/spring/apron_1.png', 'spring', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '앞치마2', '봄 앞치마2', 'attach/spring/apron_2.png', 'spring', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '앞치마3', '봄 앞치마3', 'attach/spring/apron_3.png', 'spring', 'apron');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 5000, '[sale]물꽃 에코백', '물 위에 붕붕 뜬 꽃 water collection 에코백입니다. ', 'attach/spring/bag_1.jpg', 'spring', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 9000, '겨울왕국 눈꽃 에코백', '[한정판] 겨울왕국 눈꽃 컬렉션 에코백입니다.', 'attach/spring/bag_2.png', 'spring', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 5000, '[sale]금붕어 왈츠 에코백', '마치 금붕어가 왈츠 추듯한 느낌의 water collection 에코백입니다.', 'attach/spring/bag_3.png', 'spring', 'eco');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '의자1', '봄 의자1', 'attach/spring/chair_1.png', 'spring', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '의자2', '봄 의자2', 'attach/spring/chair_2.jpg', 'spring', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '의자3', '봄 의자3', 'attach/spring/chair_3.png', 'spring', 'chair');


INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '머그컵1', '봄 머그컵1', 'attach/spring/cup_1.png', 'spring', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '머그컵2', '봄 머그컵2', 'attach/spring/cup_2.jpg', 'spring', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '머그컵3', '봄 머그컵3', 'attach/spring/cup_3.png', 'spring', 'mug');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 앞치마1', '여름 앞치마1', 'attach/summer/apron_1.png', 'summer', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 앞치마2', '여름 앞치마2', 'attach/summer/apron_2.png', 'summer', 'apron');


INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 9000, '[hot]에메랄드 핑크빛 에코백', '에메랄드 바탕의 핑크빛 꽃이 인상깊은 에코백입니다.', 'attach/summer/bag_1.png', 'summer', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 7000, '행복기운 식물 에코백 ', '행복기운을 듬뿍담은 식물 에코백입니다.', 'attach/summer/bag_2.png', 'summer', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 9000, '[hot]은은한 여름꽃 에코백', '은은한 핑크빛이 맴도는 여름꽃 에코백입니다.', 'attach/summer/bag_3.png', 'summer', 'eco');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 의자1', '여름 의자1', 'attach/summer/chair_1.png', 'summer', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 의자2', '여름 의자2', 'attach/summer/chair_2.png', 'summer', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 의자3', '여름 의자3', 'attach/summer/chair_3.jpg', 'summer', 'chair');


INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 머그컵1', '여름 머그컵1', 'attach/summer/cup_1.jpg', 'summer', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 머그컵2', '여름 머그컵2', 'attach/summer/cup_2.png', 'summer', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '여름 머그컵3', '여름 머그컵3', 'attach/summer/cup_3.png', 'summer', 'mug');


INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 앞치마1', '가을 앞치마1', 'attach/fall/fall_apron1.jpg', 'fall', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 앞치마2', '가을 앞치마2', 'attach/fall/fall_apron2.jpg', 'fall', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 앞치마3', '가을 앞치마3', 'attach/fall/fall_apron3.jpg', 'fall', 'apron');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 에코백1', '가을 에코백1', 'attach/fall/fall_ecobag1.jpg', 'fall', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 에코백2', '가을 에코백2', 'attach/fall/fall_ecobag2.jpg', 'fall', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 에코백3', '가을 에코백3', 'attach/fall/fall_ecobag3.jpg', 'fall', 'eco');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 의자1', '가을 의자1', 'attach/fall/fall_chair1.jpg', 'fall', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 의자2', '가을 의자2', 'attach/fall/fall_chair2.jpg', 'fall', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 의자3', '가을 의자3', 'attach/fall/fall_chair3.jpg', 'fall', 'chair');


INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 머그컵1', '가을 머그컵1', 'attach/fall/fall_mug1.jpg', 'fall', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 머그컵2', '가을 머그컵2', 'attach/fall/fall_mug2.jpg', 'fall', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '가을 머그컵3', '가을 머그컵3', 'attach/fall/fall_mug3.jpg', 'fall', 'mug');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 앞치마1', '겨울 앞치마1', 'attach/winter/winter_apron1.jpg', 'winter', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 앞치마2', '겨울 앞치마2', 'attach/winter/winter_apron2.jpg', 'winter', 'apron');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 앞치마3', '겨울 앞치마3', 'attach/winter/winter_apron3.jpg', 'winter', 'apron');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 에코백1', '겨울 에코백1', 'attach/winter/winter_ecobag1.jpg', 'winter', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 에코백2', '겨울 에코백2', 'attach/winter/winter_ecobag2.jpg', 'winter', 'eco');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 에코백3', '겨울 에코백3', 'attach/winter/winter_ecobag3.jpg', 'winter', 'eco');

INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 의자1', '겨울 의자1', 'attach/winter/winter_chiar1.jpg', 'winter', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 의자2', '겨울 의자2', 'attach/winter/winter_chiar2.jpg', 'winter', 'chair');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 의자3', '겨울 의자3', 'attach/winter/winter_chiar3.jpg', 'winter', 'chair');


INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 머그컵1', '겨울 머그컵1', 'attach/winter/winter_mug1.jpg', 'winter', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 머그컵2', '겨울 머그컵2', 'attach/winter/winter_mug2.jpg', 'winter', 'mug');
INSERT INTO shop_goods VALUES(shop_goods_num_seq.NEXTVAL, 1000, '겨울 머그컵3', '겨울 머그컵3', 'attach/winter/winter_mug3.jpg', 'winter', 'mug');