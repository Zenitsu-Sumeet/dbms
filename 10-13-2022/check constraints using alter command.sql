CREATE TABLE emp8 (
    empno number,
    ename VARCHAR2(20),
    design VARCHAR2(15),
    sal number(5)
);
ALTER table emp9 ADD
check(sal>500 and sal<10001)