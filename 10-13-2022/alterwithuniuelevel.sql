CREATE TABLE emp12(
    empno number,
    ename VARCHAR2(20),
    design VARCHAR2(15),
    sal number(5)
);

alter table emp12
add unique(design,sal);