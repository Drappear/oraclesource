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