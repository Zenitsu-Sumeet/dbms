CREATE TABLE emp11(
    empno number,
    ename VARCHAR2(20),
    design VARCHAR2(15),
    sal number(5),
    UNIQUE(design,sal)
);