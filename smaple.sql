CREAT TABLE employees(
    id  integer  PRIMARY KEY,
    name  text    NOT NULL,
    age integer,
    gender text,
    department_id integer
);

CREATE TABLE department(
    id integer PRIMARY KEY,
    name text 
);

INSERT INTO employees(name,age,gender,department_id)
            VALUES('伊賀将之',38,'男性',3),
            (2,'山田花子',52,'女性',1),
                   (3,'鈴木一郎',23,'男性',2),
                 (4,'鈴木一子',44,'女性',1),                 
                 (5,'佐藤次郎',18,'男性',3);

INSERT INTO department(id,name)
VALUES(2,'営業部'),
(3,'管理部');

UPDATE employees SET name='坂本龍馬',age=31 WHERE id=5;


select 
e.id,

INSERT INTO employee(id,name,age,height,weight,department_id)
VALUES ()

INSERT INTO employees(id , name , age , gender , department_id)
VALUE(6,'松本' , 25 , '男性' ,5 ),
(7,'佐藤' , 23 , '男性' ,6 );

i

INSERT INTO employees(name)
VALUES ('takamaru');


select e.id アチディ ,e.name,'名前', e.age, e.gender ,e.department_id ,d.id,d.name from employees e left outer join departments d ON e.department_id=d.id;

create table members(id serial primary KEY);

INSERT INTO test_members(name,age,dep_id)
values('山田太郎',62,1),
('佐藤花子',33,2),
('遠藤次郎',55,1);

select * from test_members where dep_id=2;

select m.name , m.age , d.name from test_members m inner join test_deps d on m.dep_id=d.id;

INSERT into members(name,birth_day,gender,color_id)
values(?,?,?,?);

INSERT into 


