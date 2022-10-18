--PL/SQL CODING FOR ADDITION OF TWO NUMBERS

declare
    a number;
    b number;
    c number;
begin
    a:=&a;
    b:=&b;
    c:=a+b;
    dbms_output.put_line('sum of '||a||' and '||b||' is '||c);
end;
 /
 
----------------------------------------------------------------------------------------

Write a PL/SQL Program using if condition to check the maximum number.

DECLARE
    b number;
    c number;
BEGIN
    B:=10;
    C:=20;
    if(C>B) THEN
        dbms_output.put_line('C is maximum');
    end if;
end;
/
 
------------------------------------------------------------------------------------------
 
Write a PL/SQL Program using if and else condition to check if number is greater than 5.

declare 
 n number;
begin
    dbms_output. put_line('enter a number');
    n:=&number;
    if n<5 then
        dbms_output.put_line('entered number is less than 5');
    else
        dbms_output.put_line('entered number is greater than 5');
    end if;
 end;
 /

---------------------------------------------------------------------------------------------

Write a PL/SQL Program GREATEST OF THREE NUMBERS USING IF ELSEIF
declare
    a number;
    b number;
    c number;
begin
    a:=&a;
    b:=&b;
    c:=&c;
    if(a>b)and(a>c) then
        dbms_output.put_line('A is maximum');
    elsif(b>a)and(b>c)then
        dbms_output.put_line('B is maximum');
    elsif(c>a)and (c>b)then
        dbms_output.put_line('C is maximum');
    elsif(a=b) and (b=a) then
        dbms_output.put_line('a and b is equal');
    elsif(c=a) and (a=c) then
        dbms_output.put_line('a and C is equal');    
    elsif(b=c) and (c=b) then
        dbms_output.put_line('c and b is equal');          
    else
        dbms_output.put_line('values are equal');
    end if;
end;
/ 

--------------------------------------------------------------------------------------

Write a PL/SQL Program to find Even and odd program 

accept num number prompt 'Enter a number';
Declare
     n number:=&num;
Begin
    if mod(n,2)=0 Then
        dbms_output.put_line(n || ' is Even');
    else
        dbms_output.put_line(n || ' is Odd');
    end if;
end;
/

----------------------------------------------------------------------------------------------
Write a PL/SQL Program to check if character is vowel or consonants

declare
    a char(1):= '&character';
Begin
    if upper(a) in ('A','E','I','O','U') THEN
        dbms_output.put_line('The character is in english vowels');
   else
        dbms_output.put_line('The character is in english consonants');
    end if;
end;
/   
    
---------------------------------------------------------------------------
Write a PL/SQL Program to take 5 marks from the user and calculate the percentage and accordingly show grades.

declare
    a number:=&maths;
    b number:=&English;
    c number:=&marathi;
    percen number:=0;
begin
    percen := ((a+b+c)/300)*100;
    dbms_output.put_line(round(percen));
    IF( percen >= 70) THEN 
        dbms_output.put_line('Grade A');
    ELSIF(percen >= 40 AND percen < 70) THEN
        dbms_output.put_line('Grade B'); 
    ELSIF(percen>=35 AND percen < 40) THEN
        dbms_output.put_line('Grade C');
    Else
          dbms_output.put_line('Fail');
    END IF;
end;
/
    
-----------------------------------------------------------------------------------------------------------------------    

Write  a program to print numbers from 1 to 5.

declare
    a Number;
begin
    a:=1;
    loop
        DBMS_OUTPUT.PUT_LINE(a);
        a:=a+1;
        EXIT WHEN(a>5);
    end loop;
End;
/
------------------------------------------------------------------------------------------------------------------------

Write  a program to print numbers from 1 to 5 using while loop.

DECLARE
    a NUMBER :=1;
BEGIN
    dbms_output.put_line('Program started');
    WHILE (a <= 5) 
        LOOP
        dbms_output.put_line(a);
        a:=a+1;
        END LOOP;
        dbms_output.put_line('Program completed' ); 	
END;
/


-------------------------------------------------------------------------------------------------------------------------

Write  a program to print table of given number take input from user.

declare
    num number;
    i number;
Begin
    i:=1;
    num:=&number;
    dbms_output.put_line('Multiplication');
    while(i<=10)
        loop
            dbms_output.put_line(i*num);
            i:=i+1;
        end loop;
end;
/
    
-------------------------------------------------------------------------------------------
Write  a program to print numbers from 1 to 5 using for loop.

BEGIN
  FOR l_counter IN 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE( l_counter );
  END LOOP;
END;
------------------------------------------------------------------------------------------- 
Write a program to print table of given number take input from user.

Declare
    num number;
Begin
    num:=&number;
    dbms_output.put_line('Multiplication');
    for counter In 1..10
        loop
            dbms_output.put_line(counter*num);
        end loop;
end;
/

------------------------------------------------------------------------------------------
Write a program to print table of given number in reverse take input from user.

Declare
    num number;
Begin
    num:=&number;
    dbms_output.put_line('Multiplication');
    for counter In reverse 1..10
        loop
            dbms_output.put_line(counter*num);
        end loop;
end;
/



----------------------------------------------------------------------------------------
Write a program to use goto statement.
    
Declare
    marks number;
Begin
    Marks:=&marks;
    if(Marks>100) then
        dbms_output.put_line('invalid input');
        goto Exit;
    end if;
    dbms_output.put_line('you have entered' || Marks);
    <<Exit>>
        dbms_output.put_line(' ');
end;






create or replace function calc(a number, b number,op char) 
return number
is
begin
    if op='+' then
        return(a+b);
    elsif op='-' then
        return(a-b);
    elsif op='*' then
        return(a*b);
    else
        return(a/b);
    end if;
end;
/
 select calc(10,20,'*') "Answer"
    from dual;



declare
    a int;
    b int;
    c char;
    d int;
    begin
        a:=&enter_first_value;
        b:=&enter_second_value;
        c:='&enter_operator';
        d:=calc(a,b,c);
        dbms_output.put_line('result:'||d);
end;
/

Declare
    dividend number:=24;
    divisor number:=0;
    result number;
    div_zero exception;
Begin
    If divisor=0 then
        Raise div_zero;
    end if;
    Result:=dividend/divisor;
    dbms_output.put_line('result is:' || Result);
    Exception 
        when div_zero Then
            dbms_output.put_line('Your Divisor is zero');
End;
/

DECLARE
   temp varchar(20);
BEGIN
   Select sname into temp 
   from student  where sname='rohit1';
   dbms_output.put_line(temp);
exception
   WHEN no_data_found THEN
      dbms_output.put_line('Specified data not found');
end;
/
 
 
 DECLARE
   temp varchar(20);
BEGIN
   SELECT sname into temp from student;
   dbms_output.put_line(temp);
  
EXCEPTION
   WHEN too_many_rows THEN
      dbms_output.put_line('error trying to SELECT too many rows');
end;
/



DECLARE
   temp number;   
  
BEGIN
   SELECT sname into temp from student where sname='rohit';
   dbms_output.put_line('The employee_name is '||temp);
  
EXCEPTION
   WHEN value_error THEN
   dbms_output.put_line('Error');
   dbms_output.put_line('Change data type of temp to varchar');
  
END;
/