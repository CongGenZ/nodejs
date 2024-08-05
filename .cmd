-- Tạo cơ sở dữ liệu school
CREATE DATABASE school;

-- Chọn cơ sở dữ liệu school
USE school;

-- Tạo bảng student
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    birthday DATE,
    email VARCHAR(100),
    address VARCHAR(100)
);
-- Thêm dữ liệu vào bảng student


INSERT INTO student (name, birthday, email) VALUES
('Nguyen Van A', '2000-01-15', 'nguyenvana@example.com'),
('Tran Thi B', '1999-05-20', 'tranthib@example.com'),
('Le Van C', '2001-07-22', 'levanc@example.com');


-- Thêm cột address vào bảng student
ALTER TABLE student
ADD COLUMN address VARCHAR(255);

-- Đổi tên cột name thành full_name
ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(100);


bài 3
SELECT * FROM  student 
 SELECT  full_name,email 
 FROM student 
 WHERE birthday > '1995-12-31'

 SELECT * FROM student 
 ORDER BY  birthday DESC 
 

 bài 4
  UPDATE student
  SET email = NULL
  WHERE full_name LIKE 'Nguyen%;


  DELETE FROM student
  WHERE birthday  < '1992-12-31'


  Bài 5
  CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);
 
 
 INSERT INTO courses (NAME ,DESCRIPTION) VALUES 
 ('Mathematics', 'A course about advanced mathematics.'),
('Physics', 'An introduction to the principles of physics.'),
('Chemistry', 'Basic concepts and experiments in chemistry.');


CREATE TABLE enrollments(
   student_id INT,
   course_id INT,
   FOREIGN KEY (student_id) REFERENCES  student(id),
   FOREIGN KEY  KcoursesEY (course_id) REFERENCES courses(id)
   
);

INSERT INTO enrollments (student_id, course_id) VALUES

(1, 1),  
(2, 2),  
(3, 3),  
(1, 2),  
(2, 3);  

bai 6

-- Lấy thông tin về tên sinh viên và tên khóa học mà họ tham gia
SELECT s.full_name, c.name AS course_name
FROM enrollments e
JOIN student s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id;

-- Lấy thông tin về tất cả sinh viên và khóa học của họ (bao gồm cả những sinh viên chưa tham gia khóa học nào)
SELECT s.full_name, c.name AS course_name
FROM student s
LEFT JOIN enrollments e ON s.id = e.student_id
LEFT JOIN courses c ON e.course_id = c.id;
