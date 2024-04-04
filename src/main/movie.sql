
drop table user_table;
drop table movie_table;
drop table foodstore_table ;
drop table screening_table;
drop table movie_receipt;
drop table food_receipt;
drop table movie_purchase;
drop table food_purchase;

CREATE TABLE user_table (
   user_no   int auto_increment   NOT NULL primary key,
   user_hp   varchar(20)   NULL,
   user_name   varchar(20)   NULL,
   user_birth   varchar(20)   NULL,
   user_remarks   varchar(50)   NULL
);
ALTER TABLE user_table
ADD COLUMN user_point int NULL;


CREATE TABLE foodstore_table (
   f_no   int auto_increment   NOT NULL primary key,
   f_name   varchar(30)   NULL,
   f_price   int   NULL,
   filePath   varchar(500)   NULL,
   orgName   varchar(500)   NULL,
   saveName   varchar(500)   NULL,
   fileSize   long   NULL,
   f_remarks   varchar(50)   NULL
);

CREATE TABLE movie_table (
   m_no   int auto_increment   NOT NULL primary key,
   m_name   varchar(50)   NULL,
   m_price   int   NULL,
   filePath   varchar(500)   NULL,
   orgName   varchar(500)   NULL,
   saveName   varchar(500)   NULL,
   fileSize   long   NULL,
   m_remarks   varchar(50)   NULL
);

CREATE TABLE screening_table (
   s_no   int auto_increment   NOT NULL primary key,
   m_no   int   NOT NULL,
   s_date   date   NULL
);

CREATE TABLE movie_receipt (
   m_r_no   int auto_increment   NOT NULL primary key,
   s_no   int   NOT NULL,
   user_no   int   NOT NULL,
   m_r_date   date   NULL
);

CREATE TABLE food_receipt (
   f_r_no   int auto_increment   NOT NULL primary key,
   user_no   int   NOT NULL,
   f_r_date   date   NULL
);

CREATE TABLE movie_purchase (
   m_p_no   int auto_increment   NOT NULL primary key,
   m_r_no   int   NOT NULL,
   m_s_no   varchar(20)   NULL
);

CREATE TABLE food_purchase (
   f_p_no   int auto_increment   NOT NULL primary key,
   f_r_no   int   NOT NULL,
   f_no   int   NOT NULL
);


ALTER TABLE screening_table ADD CONSTRAINT FK_movie_table_TO_screening_table_1 FOREIGN KEY (
   m_no
)
REFERENCES movie_table (
   m_no
);

ALTER TABLE movie_receipt ADD CONSTRAINT FK_screening_table_TO_movie_receipt_1 FOREIGN KEY (
   s_no
)
REFERENCES screening_table (
   s_no
);

ALTER TABLE movie_receipt ADD CONSTRAINT FK_user_table_TO_movie_receipt_1 FOREIGN KEY (
   user_no
)
REFERENCES user_table (
   user_no
);

ALTER TABLE food_receipt ADD CONSTRAINT FK_user_table_TO_food_receipt_1 FOREIGN KEY (
   user_no
)
REFERENCES user_table (
   user_no
);

ALTER TABLE movie_purchase ADD CONSTRAINT FK_movie_receipt_TO_movie_purchase_1 FOREIGN KEY (
   m_r_no
)

REFERENCES movie_receipt (
   m_r_no
);

ALTER TABLE food_purchase ADD CONSTRAINT FK_food_receipt_TO_food_purchase_1 FOREIGN KEY (
   f_r_no
)
REFERENCES food_receipt (
   f_r_no
);

ALTER TABLE food_purchase ADD CONSTRAINT FK_foodstore_table_TO_food_purchase_1 FOREIGN KEY (
   f_no
)
REFERENCES foodstore_table (
   f_no
);

    
SELECT 
    mr.m_r_no AS '영화예매번호',
    m.m_name AS '제목',
    mr.m_r_date AS '상영일자',
    s.s_date AS '상영시간',
    GROUP_CONCAT(DISTINCT mp.m_s_no ORDER BY mp.m_s_no ASC) AS '좌석번호',
    COUNT(DISTINCT mp.m_s_no) AS '인원수',
    m.m_price AS '영화가격',
    u.user_name AS '구매자이름',
    u.user_point AS '포인트'
FROM 
    movie_receipt mr
    JOIN screening_table s ON mr.s_no = s.s_no
    JOIN movie_table m ON s.m_no = m.m_no
    JOIN movie_purchase mp ON mr.m_r_no = mp.m_r_no
    JOIN user_table u ON mr.user_no = u.user_no
WHERE
    u.user_hp = '010-1234-5678'
GROUP BY
    mr.m_r_no, m.m_name, mr.m_r_date, s.s_date, m.m_price, u.user_name;
    
    SELECT 
				    mr.m_r_no AS '영화예매번호',
				    m.m_name AS '제목',
				    mr.m_r_date AS '상영일자',
				    s.s_date AS '상영시간',
				    GROUP_CONCAT(DISTINCT mp.m_s_no ORDER BY mp.m_s_no ASC) AS '좌석번호',
				    COUNT(DISTINCT mp.m_s_no) AS '인원수',
				    m.m_price AS '영화가격',
				    u.user_name AS '구매자이름',
				    u.user_point AS '포인트'
				FROM 
				    movie_receipt mr
				    JOIN screening_table s ON mr.s_no = s.s_no
				    JOIN movie_table m ON s.m_no = m.m_no
				    JOIN movie_purchase mp ON mr.m_r_no = mp.m_r_no
				    JOIN user_table u ON mr.user_no = u.user_no
				WHERE
				    u.user_hp = '010-1234-5678'
				GROUP BY
				    mr.m_r_no, m.m_name, mr.m_r_date, s.s_date, m.m_price, u.user_name;
    
    
    
    -- user_table에 데이터 삽입
INSERT INTO user_table (user_hp, user_name, user_birth, user_remarks, user_point)
VALUES ('010-0000-0000', 'John Doe', '1990-05-15', 'Regular customer', 100);

-- foodstore_table에 데이터 삽입
INSERT INTO foodstore_table (f_name, f_price, filePath, orgName, saveName, fileSize, f_remarks)
VALUES ('Hamburger', 10000, '/path/to/image', 'hamburger.jpg', 'hamburger_001.jpg', 1024, 'Delicious fast food');

-- movie_table에 데이터 삽입
INSERT INTO movie_table (m_name, m_price, filePath, orgName, saveName, fileSize, m_remarks)
VALUES ('Avengers: Endgame', 15000, '/path/to/image', 'avengers.jpg', 'avengers_001.jpg', 2048, 'Epic superhero movie');

-- screening_table에 데이터 삽입
INSERT INTO screening_table (m_no, s_date)
VALUES (1, '2024-01-01');

-- movie_receipt에 데이터 삽입
INSERT INTO movie_receipt (s_no, user_no, m_r_date)
VALUES (1, 1, '2024-01-01');

-- food_receipt에 데이터 삽입
INSERT INTO food_receipt (user_no, f_r_date)
VALUES (1, '2024-01-01');

-- movie_purchase에 데이터 삽입
INSERT INTO movie_purchase (m_r_no, m_s_no)
VALUES (1, 'A1');

-- food_purchase에 데이터 삽입
INSERT INTO food_purchase (f_r_no, f_no)
VALUES (1, 1);






-- user_table에 데이터 삽입
INSERT INTO user_table (user_hp, user_name, user_birth, user_remarks, user_point)
VALUES ('010-1234-5678', '홍길동', '1990-05-15', '정기고객', 100);

-- foodstore_table에 데이터 삽입
INSERT INTO foodstore_table (f_name, f_price, filePath, orgName, saveName, fileSize, f_remarks)
VALUES ('햄버거', 10000, '/경로/이미지', 'hamburger.jpg', 'hamburger_001.jpg', 1024, '맛있는 패스트푸드');

-- movie_table에 데이터 삽입
INSERT INTO movie_table (m_name, m_price, filePath, orgName, saveName, fileSize, m_remarks)
VALUES ('어벤져스: 엔드게임', 15000, '/경로/이미지', 'avengers.jpg', 'avengers_001.jpg', 2048, '매력적인 슈퍼히어로 영화');

-- screening_table에 데이터 삽입
INSERT INTO screening_table (m_no, s_date)
VALUES (1, '2024-01-01');

-- movie_receipt에 데이터 삽입
INSERT INTO movie_receipt (s_no, user_no, m_r_date)
VALUES (1, 1, '2024-01-01');

-- food_receipt에 데이터 삽입
INSERT INTO food_receipt (user_no, f_r_date)
VALUES (1, '2024-01-01');

-- movie_purchase에 데이터 삽입
INSERT INTO movie_purchase (m_r_no, m_s_no)
VALUES (1, 'A1');

-- food_purchase에 데이터 삽입
INSERT INTO food_purchase (f_r_no, f_no)
VALUES (1, 1);

SELECT 
    mr.m_r_no,
    m.m_name,
    mr.m_r_date,
	s.s_date,
    GROUP_CONCAT(DISTINCT mp.m_s_no ORDER BY mp.m_s_no ASC),
    COUNT(DISTINCT mp.m_s_no),
    m.m_price,
    u.user_name,
    u.user_point
FROM 
    movie_receipt mr
    JOIN screening_table s ON mr.s_no = s.s_no
    JOIN movie_table m ON s.m_no = m.m_no
    JOIN movie_purchase mp ON mr.m_r_no = mp.m_r_no
    JOIN user_table u ON mr.user_no = u.user_no
WHERE
      mr.m_r_no = 1
GROUP BY
       mr.m_r_no, m.m_name, mr.m_r_date, s.s_date, m.m_price, u.user_name;

