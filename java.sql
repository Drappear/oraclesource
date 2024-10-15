CREATE TABLE usertbl(
userid varchar2(20) PRIMARY KEY,
name varchar2(20) NOT NULL,
password varchar2(20) NOT NULL,
age number(3) NOT NULL,
email varchar2(20) NOT null
);

INSERT INTO usertbl values('hong123', '홍길동', 'hong123', 25, 'hong123@gmail.com');

ALTER TABLE usertbl MODIFY email varchar2(50);

SELECT userid, name FROM usertbl WHERE userid = 'hong123' AND password = 'hong123';

UPDATE usertbl SET password ='hong456'
WHERE userid = 'hong123' AND password = 'hong123';

SELECT * FROM usertbl;

DELETE FROM usertbl WHERE userid = 'test2' AND password = '12345';


-- booktbl
-- code number(4) pk
-- title varchar2(50)
-- writer varchar2(30)
-- price number(10)

CREATE TABLE booktbl(
code number(4) PRIMARY KEY,
title varchar2(50) NOT null,
writer varchar2(30) NOT null,
price number(10) NOT NULL,
description varchar2(1000)
);

INSERT INTO booktbl values(1000, '자바의 정석', '신용균', 25000);
INSERT INTO booktbl values(1001, '자바의 신', '강신용', 29000);
INSERT INTO booktbl values(1002, '자바의 1000제', '남궁성', 32000);
INSERT INTO booktbl values(1003, '오라클', '박응용', 33000);
INSERT INTO booktbl values(1004, '점프 투 파이썬', '신기성', 35000;

INSERT INTO booktbl(code, title, writer, price, description) values(1000, '자바의 정석', '신용균', 25000, 'abcd');
-- 전체 조회
SELECT * FROM booktbl;

-- 도서번호 1000번인 도서 조회
SELECT * FROM booktbl WHERE code = 1000;

-- 도서번호 1001 번인 도서가격 수정
UPDATE booktbl SET PRICE = 28000 WHERE code = 1001;

-- 도서번호 1004번 도서 삭제
DELETE FROM booktbl WHERE code = 1004;

-- 도서명 '자바' 키워드가 들어있는 도서 조회
SELECT * FROM booktbl WHERE title LIKE '%자바%';