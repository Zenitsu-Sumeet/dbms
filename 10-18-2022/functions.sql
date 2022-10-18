-----SYNTAX OF FUNCTION------------
CREATE [OR REPLACE] FUNCTION function_name
[(parameter_name [IN | OUT | IN OUT] type [, ...])]
RETURN return_datatype
{IS | AS}
BEGIN
< function_body >
END [function_name];
---------------------------------------------------------------------

---------------Basic calculator program-------------
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

--1.calling function
    select calc(10,20,'*') "Answer"
    from dual;

--2.calling function from program
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

----Factorial of number-----
DECLARE 
   num number; 
   factorial number;  
   
    FUNCTION fact1(x number) 
    RETURN number  
        IS 
            f number;
            n number;
        BEGIN 
            
                WHILE x > 0 LOOP
                    f:=x*f;        
                    x:=x-1;           
                END LOOP; 
             
    END;  
BEGIN 
   num:= &num; 
   factorial := fact1(num); 
   dbms_output.put_line(' Factorial '|| num || ' is ' || factorial); 
END; 
/

