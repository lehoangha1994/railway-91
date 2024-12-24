DROP DATABASE IF EXISTS lesson_02;
CREATE DATABASE lesson_02;
USE lesson_02;

-- Tạo bảng department
DROP TABLE IF EXISTS department;
CREATE TABLE department(
    department_id INT,
    department_name VARCHAR(50)
);

-- thêm dữ liệu vào bảng 
INSERT INTO department (department_id,department_name)
VALUES	(1,"Giám đóc"),
		(2,"Bảo vệ");

-- hiển thị dữ kiệu trong bảng 
TABLE department;


-- ràng buộc dữ liệu (constraints)
-- NULL/ NOT NULL

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	email VARCHAR(50) NOT NULL -- bắt buộc phải có . nếu "" :empty vẫn thoa man  
);

-- vd : them email có là null 
INSERT INTO student (email) VALUES (NULL);

INSERT INTO student (email) VALUES ("lehoangha");
TABLE student;

-- UNIQUE KEY : Duy nhất 
-- các ràng buộc có thể combo với nhau
DROP TABLE IF EXISTS customer;
CREATE TABLE customer  (
	phone  CHAR(10) UNIQUE   NOT NULL 
);

INSERT INTO customer (phone)
VALUES ("123456"),
		("123457");
TABLE customer;

-- Ràng buộc DEFAULT : Mặc định

DROP TABLE IF EXISTS answer;
CREATE TABLE answer  (
	is_correct BOOLEAN DEFAULT FALSE,
    create_date DATE DEFAULT (CURRENT_DATE)
);

-- VÍ DỤ : thêm answer không truyền vào create_date ,nhưng nó sẽ vẫn đúng và nó sẽ lấy ngày hôm nay 
INSERT INTO answer (is_correct)
VALUES (TRUE);

TABLE answer;

-- ràng buộc CHECK : kiểm tra 
DROP TABLE IF EXISTS account;
CREATE TABLE account  (
	age INT CHECK (age >=18)
);

-- VD : thêm account có tuôi 
INSERT INTO account (age) VALUES (15);
INSERT INTO account (age) VALUES (20);
TABLE account;

-- ràng buộc PRIMARY : khóa chính 
-- yêu cầu phải duy nhất và not null :UNIQUE + NOT NULL 
-- 1. Một bảng có tối đa 1 khóa chính 
-- 2. Một khóa chính có thể gồm 1 hoặc nhiều cột 
-- 3.AUTO_INCREMENT : Tự động tăng -> nó sẽ thỏa mãn duy nhất và NOT NULL 
-- VD : Khá chính 1 cột 
DROP TABLE IF EXISTS question;
CREATE TABLE question  (
	 question_id INT PRIMARY KEY AUTO_INCREMENT ,
     content VARCHAR (50)
);
INSERT INTO question (content)
VALUES ("Câu hỏi MySQL"),
		("abcg");
TABLE question;

-- Khóa chính 2 cột 
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
	 group_id INT,
     account_id INT,
     join_date DATE,
     PRIMARY KEY (group_id,account_id) 
     -- chú ý nếu 2 cột trở lên sẽ ko tự đọng tăng được 
);
-- VD :Thêm 2 group account 
INSERT INTO group_account (group_id, account_id, join_date)
VALUES (1, 1, "2023-06-19"),
       (1, 2, "2024-12-24");

TABLE group_account;





