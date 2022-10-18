
------Static Procedure------------
create table emp_new
(
    eid number,
    ename varchar(30),
    designation varchar(30),
    salary number,
    dno number
);



create or replace procedure procedure_static
is
    emp_count int;
begin
    select count(*) into emp_count
    from emp_new;
    dbms_output.put_line('Number of employee: '||emp_count);
end procedure_static;
/
    
exec procedure_static;   
    
    
    
-----Dynamic Procedure---------
Procedure to display number of employees from given department number.

create or replace procedure pro_count(depno int)
is
    e_count int;
begin
    select count(eid) into e_count
    from emp_new
    where dno=depno;
    dbms_output.put_line('Number of employee from depatment number '||depno||' is '||e_count);
end pro_count;
/
    
exec pro_count(3);   

-------------------------------------------------------------------------------------------------
Procedure to display number of employees from given designation

create or replace procedure pro_desi(vdesg emp_new.designation%type)
as
    ecount int;
begin
    select count(eid) into ecount
    from emp_new
    where designation=vdesg;
    dbms_output.put_line('Give Designation: '||vdesg||' And'||' Total number of employees '||ecount);
end pro_desi;
/

exec pro_desi('mang');
    
---------------------------------------------------------------------------------------  
    
write a program to reverse the given number

create or replace procedure proc_rev(n int)
is 
    rno int;
begin
    dbms_output.put_line('Given number:'|| n);
    for x in reverse 1..length(n)
        loop
            rno:= rno || substr(n,x,1);
        end loop;
     dbms_output.put_line('reverse number: ' || rno);
end proc_rev;
/    
    
exec proc_rev(56789);


----------------------------------------------------------------------------------------

create table customer
(
    accno number,
    cust_name varchar(50),
    amount number
);
    

create or replace procedure proc_deposite(vactno in customer.accno%type, vamt in out customer.amount%type)
is
begin
    update customer
    set amount=amount+vamt
    where accno=vactno;
    
    select amount into vamt
    from customer
    where accno=vactno;
    
    dbms_output.put_line('account number' ||vactno||'Updated amount: '||vamt);
end;
/


var abc number;
exec :abc:=2000
exec proc_deposite(100013,:abc);

------------------------------------------------------------











    