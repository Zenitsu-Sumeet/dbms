CREATE TABLE emp14(
    empno number,
    ename VARCHAR2(20),
    design VARCHAR2(15),
    sal number(5)
);


alter table emp14
MODIFY ename VARCHAR2(100)  not null;