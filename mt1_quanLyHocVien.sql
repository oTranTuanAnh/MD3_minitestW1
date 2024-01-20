create database StudentManager;
use StudentManager;
create table class (
id int not null primary key,
name varchar(20),
languages varchar(20),
descriptions text);
create table address (
id int not null primary key,
address varchar(50));
create table students (
id int not null primary key,
fullname varchar(50),
address_id int,
age int,
phone varchar(15) unique,
classes_id int,
foreign key (address_id) references address(id),
foreign key (classes_id) references class(id));
create table course (
id int not null primary key,
name varchar(50),
description text);
create table points (
id int not null primary key,
course_id int,
student_id int,
point float,
foreign key (course_id) references course(id),
foreign key (student_id) references students(id));

insert into address values (1, "HN"), (2, "SG"), (3, "Hue"), (4, "DN"), (5, "HP");
insert into class values (1, "A1","VN","tieng viet"),
(2, "A2","Java","lap trinh java"),
(3, "B1","Python","lap trinh game"),
(4, "B2","Eng","tieng anh"),
(5, "H","PHP","code dao");
insert into students values (1,"Pham Khanh Linh", 1, 20, "0172859674",2),
(2,"Nguyen Minh Anh", 3, 22, "0987564739",2),
(3,"Pham Duy Nam", 1, 20, "0776583392",1),
(4,"Nguyen Van Tuan", 4, 25, "0976342546",3),
(5,"Le Tien Dat", 5, 22, "0867564938",5),
(6,"Nguyen Minh Quang", 1, 20, "0334256445",4),
(7,"Nguyen Ngoc Anh", 4, 21, "0465766568",2),
(8,"Cao Van Huy", 3, 22, "0332299878",4),
(9,"Nguyen Huong Giang", 3, 25, "04657576767",5),
(10,"Vu Minh Nhat", 1, 22, "0878787878459",5);
insert into course (id, name) values (1, "toan"), (2, "vat ly"), (3, "van hoc"), (4, "lich su"), (5, "the duc");
insert into points values (1,2,5,7),
(2,3,4,7),(3,4,4,6),(4,2,6,8),(5,3,7,5),(6,2,4,8),(7,1,10,2),(8,5,8,5),(9,4,8,9),(10,4,6,5.5),(11,5,3,7.5),(12,5,4,8),(13,3,7,10),(14,5,5,8),(15,5,4,6.5);
select * from class;
select * from students;
select * from course; 
select * from points;

-- viet cau query tim kiem hv co ho Nguyen
select s.id, s.fullname
from students s where s.fullname like "Nguyen%";
-- viet cau query tim kiem hv co ten Anh
select s.id, s.fullname
from students s where s.fullname like "%Anh";
-- viet cau query tim kiem hv co do tuoi tu 15-18
select s.id, s.fullname, s.age
from students s where s.age between 15 and 18;
-- viet cau query tim kiem hv co id la 12 hoac 13
select s.id, s.fullname, s.age
from students s where s.id = 12 or s.id = 13;
-- viet cau query thong ke so luong hoc vien cac lop
select c.name, count(c.id) as count_students
from class c left join students s on c.id = s.classes_id group by c.name;
-- viet cau query thong ke so luong hoc vien tai cac tinh
select a.address, count(a.id) as count_students
from address a left join students s on a.id = s.address_id group by a.id;
-- viet cau query tinh diem trung binh cua cac khoa hoc
select cs.id, cs.name, avg(p.point) as avg_point
from course cs left join points p on cs.id = p.course_id group by cs.id;