create table std
(
sid int,
sname varchar(100),
branch varchar(50),
marks int
);

insert into std values(1,'namita','bba',70);
insert into std values(2,'arkit','IT',50);
insert into std values(3,'prayag','IT',60);
insert into std values(4,'amaan','IT',10);
insert into std values(5,'soni','bcom',35);

insert into std(sid,sname) values(6,'harsh');
insert into std(sid,sname) values(7,'gannu');

delete from std
where sid=5 AND marks=35;

select sid,sname
from std;

select sname,marks
from std
where marks=10;

select sname,marks,branch
from std
where sname='arkit';

create table fact1
(
fid int,
fname varchar(40),
qualification varchar(20),
deptno number(10)
);

insert into fact1 values(1,'amaan','7th',3);
insert into fact1 values(2,'ubaid','6th',4);
insert into fact1 values(3,'madhu','4th',5);
insert into fact1 values(4,'prayag','5th',6);
insert into fact1 values(5,'shiva','Btech',1);
insert into fact1 values(6,'jerry','Btech',2);

select *
from fact1
where qualification='Btech' AND deptno=1;

select *
from std
where marks >= 35;

select *
from std
where branch = 'IT' or branch= 'bba';

select *
from std
where marks IN (70,60,10);

select *
from std
where branch ='IT' AND marks>=50;

select sname
from std
where branch !='BBA';

select sname
from std
where branch='Bcom' or marks>=50;

select fname
from fact1
where deptno=1 or deptno=3

select *
from fact1
where  qualification = 'Btech';

select *
from fact1
where  qualification IN ('Btech','ph.d');

select *
from std
where  branch!='IT' and branch!='bcom';

select *
from std
where marks NOT BETWEEN 50 AND 60;

select *
from std
where  branch IS NULL;

select *
from fact1
where fname like 'a%';

select sname,marks
From std
where sname like 's_____';

select sname,marks
From std
where sname NOT like 's_____';

UPDATE STD
SET MARKS=MARKS+20
where sid > 3;

update STD
set sname='ssuSSmeet'
where SID=1;


ALTER TABLE STD
ADD (FYMARKS NUMBER,PERCENTAGE NUMBER);

UPDATE STD
SET FYMARKS =56;

UPDATE STD
SET PERCENTAGE = MARKS+FYMARKS/250*100;

ALTER TABLE STD
MODIFY PERCENTAGE NUMBER(4,2);