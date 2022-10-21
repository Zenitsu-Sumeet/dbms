----SYNTAX--------
CREATE [OR REPLACE] TRIGGER trigger_name
{BEFORE | AFTER } triggering_event ON table_name
[FOR EACH ROW]
[ENABLE / DISABLE ]
[WHEN condition]
DECLARE
    declaration statements
BEGIN
    executable statements
EXCEPTION
    exception_handling statements
END;


------Example--------

create table customer1
(
    id int,
    name varchar(50),
    age int,
    address varchar(100),
    salary int
);

:NEW � It holds a new value for the columns of the base table/view during the trigger execution
:OLD � It holds old value of the columns of the base table/view during the trigger execution


CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON customer1
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
   sal_diff number;
BEGIN
   sal_diff := :NEW.salary  - :OLD.salary;
   dbms_output.put_line('Old salary: ' || :OLD.salary);
   dbms_output.put_line('New salary: ' || :NEW.salary);
   dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/

INSERT INTO CUSTOMEr1 VALUES (8, 'Krish', 23, 'HPA', 9500.00 );

UPDATE customer1
SET salary = salary + 500
WHERE id = 7;

-------------------------BEFORE INSERT TRIGGER-----------------------------------------------------

CREATE TABLE orders
( order_id number(5),
  quantity number(4),
  cost_per_item number(6,2),
  total_cost number(8,2),
  create_date date,
  created_by varchar2(10)
);



CREATE OR REPLACE TRIGGER orders_before_insert
BEFORE INSERT ON orders
FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

   -- Find username of person performing INSERT into table
   SELECT user INTO v_username
   FROM dual;

   -- Update create_date field to current system date
   :new.create_date := sysdate;

   -- Update created_by field to the username of the person performing the INSERT
   :new.created_by := v_username;

END;
/

--------------------AFTER INSERT TRIGGER----------------
create table orders_audit
   ( order_id int,
     quantity int,
     quantity_after int,
     cost_per_item int,
     total_cost int,
     username varchar(50));

drop table orders_audit;

CREATE OR REPLACE TRIGGER orders_after_insert
AFTER INSERT ON orders
FOR EACH ROW
DECLARE
   v_username varchar2(10);
BEGIN
   -- Find username of person performing the INSERT into the table
   SELECT user INTO v_username
   FROM dual;
   -- Insert record into audit table
   INSERT INTO orders_audit
   (order_id,quantity,cost_per_item,total_cost,username)
   VALUES
   ( :new.order_id,
     :new.quantity,
     :new.cost_per_item,
     :new.total_cost,
     v_username );

END;
/


---------------------BEFORE UPDATE---------------------------------------
CREATE OR REPLACE TRIGGER orders_before_update
BEFORE UPDATE
   ON orders
   FOR EACH ROW

DECLARE
   v_username varchar2(10);
    v_total_cost int;
BEGIN

   -- Find username of person performing UPDATE on the table
   SELECT user INTO v_username
   FROM dual;
    --update the total cost
     v_total_cost:= :new.quantity * :old.cost_per_item;
    :new.total_cost :=v_total_cost;
   -- Update updated_date field to current system date
   :new.create_date := sysdate;

   -- Update updated_by field to the username of the person performing the UPDATE
   :new.created_by := v_username;

END;

/
update orders
set quantity=15
where order_id=2;

------DISABLE TRIGGER----------------
ALTER TRIGGER orders_before_insert DISABLE;

---------ENABLE TRIGGER----------------
ALTER TRIGGER orders_before_insert ENABLE;

-----------AFTER UPDATE---------------
CREATE OR REPLACE TRIGGER orders_after_update
AFTER UPDATE ON orders
FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

   -- Find username of person performing UPDATE into table
   SELECT user INTO v_username
   FROM dual;

   -- Insert record into audit table
   INSERT INTO orders_audit
   ( order_id,
     quantity,
     cost_per_item,
     total_cost,
     quantity_after,
     username )
   VALUES
   ( :new.order_id,
     :old.quantity,
     :new.cost_per_item,
     :new.total_cost,
     :new.quantity,
     v_username );
END;
/
-------------------------------
ALTER TRIGGER orders_after_update DISABLE;

update orders
set quantity=15
where order_id=2;



