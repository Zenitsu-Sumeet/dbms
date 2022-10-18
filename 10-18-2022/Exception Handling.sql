--Using variable of exception type
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
        when Div_zero Then
            dbms_output.put_line('Your Divisor is zero');
End;
/


----NO_DATA_FOUND Exception------------
DECLARE
   temp varchar(20);
BEGIN
   Select employee_name into temp 
   from employee2  where employee_name='rohit';
  
exception
   WHEN no_data_found THEN
      dbms_output.put_line('Specified data not found');
end;
/

-----TOO_MANY_ROWS-----------
DECLARE
   temp varchar(20);
  
BEGIN
  
   SELECT employee_name into temp from employee2;
   dbms_output.put_line(temp);
  
EXCEPTION
   WHEN too_many_rows THEN
      dbms_output.put_line('error trying to SELECT too many rows');

end;
/

----Value Error-------
DECLARE
   temp number;   
  
BEGIN
   SELECT employee_name into temp from employee2 where employee_name='KAVI';
   dbms_output.put_line('The employee_name is '||temp);
  
EXCEPTION
   WHEN value_error THEN
   dbms_output.put_line('Error');
   dbms_output.put_line('Change data type of temp to varchar(20)');
  
END;
/



--Raise_application_error method
Accept age_v number prompt 'what is your age?';
Declare
    age number:=&age_v;
Begin
    if age < 18 then
        Raise_application_error(-20008,'you should be 18 or above for the drink');
    end if;
        Dbms_output.put_line('Sure, what would you like to have?');
    Exception when Others then
         Dbms_output.put_line(SQLERRM); --this is the utility function provided by oracle which retrieve the error msg from last occured exception
end;
/



Accept age_v number prompt 'what is your age?';
Declare
    age number:=&age_v;
Begin
    if age < 18 then
        Raise_application_error(-20008,'you should be 18 or above for the drink');
    end if;
        Dbms_output.put_line('Sure, what would you like to have?');
    Exception when Others then
         Dbms_output.put_line(SQLCODE); --this is the utility function provided by oracle which retrieve the error msg from last occured exception
end;
/


--------------Pragma exception_init-------------------
Accept age_v number prompt 'what is your age?';
Declare
    ex_age exception;
    age Number:=&age_v;
    pragma exception_init(ex_age,-20008);
Begin
    if age<18 then
        Raise_Application_error(-20008,'you should be 18 or above for the drinks!');
    end if;
    dbms_output.put_line('Sure! what would you like to have?');
    Exception when ex_age then
        dbms_output.put_line(SQLERRM);
end;
/
























