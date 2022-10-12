CREATE TABLE emp7 (
    empno number(3),
    ename VARCHAR2(20),
    design VARCHAR2(15),
    sal number(5)
    check(sal>500 AND sal<10000),
    deptno number(2)
);

insert into emp7 values(1,'sumeet','sde',5000,5)
insert into emp7 values(2,'sumeet','sde',4000,9)



