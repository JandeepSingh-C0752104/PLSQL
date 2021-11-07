
SET SERVEROUTPUT ON;
BEGIN
dbms_output.put_line('Hello World');
END;


/*Nested Block */

BEGIN
    dbms_output.put_line('Hello World');
        BEGIN
            dbms_output.put_line('PL/SQL');
        END;
END;


/* DECLARING A VARIABLE , ASSINGING A VARIABLE AND CONCATINATIOn*/

SET SERVEROUTPUT ON
DECLARE
    v_text VARCHAR(50) NOT NULL DEFAULT 'HELLO';
    /*to assign a variable here */
    v_text1 VARCHAR(50) NOT NULL :='Testing';
    v_num NUMBER NOT NULL :=50;
    v_num1 NUMBER(10,2) NOT NULL :=50.25;
    v_date DATE NOT NULL := SYSDATE;
    v_date1 DATE NOT NULL := '03-11-21 04:55:20';
    v_time TIMESTAMP(3) WITH TIME ZONE NOT NULL := SYSTIMESTAMP;
    
BEGIN
    v_text := 'PL/SQL' || ' COURSE';
    DBMS_OUTPUT.PUT_LINE(v_text ||' More text');
    DBMS_OUTPUT.PUT_LINE(v_text1);
    DBMS_OUTPUT.PUT_LINE(v_num);
    DBMS_OUTPUT.PUT_LINE(v_num1);
    DBMS_OUTPUT.PUT_LINE(v_date);
    DBMS_OUTPUT.PUT_LINE(v_date1);
    DBMS_OUTPUT.PUT_LINE(v_time);
END;

desc employees;

/* IF AND ELSIF */

SET SERVEROUTPUT ON

DECLARE
    v_num NUMBER(10) := 20;
BEGIN
    IF v_num <10 THEN
    DBMS_OUTPUT.PUT_LINE('It is less than 10');
    ELSIF v_num <20 THEN
    DBMS_OUTPUT.PUT_LINE('It is less than 20');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('It is equal to or greater than 20');
    END IF;
    
END;


/* CASE STATEMENTS */

DECLARE 
    V_JOBCODE VARCHAR(50):= 'SA_MAN';
    V_INCREASE NUMBER(10);
BEGIN
    CASE 
        WHEN V_JOBCODE = 'SA_MAN' THEN V_INCREASE := 0.2;
        WHEN V_JOBCODE = 'SA_REP' OR V_JOBCODE = 'IT_REP' THEN V_INCREASE := 0.3;
        ELSE V_INCREASE := 0;
    END CASE;
    DBMS_OUTPUT.put_line('The job salary is increased by: '|| V_INCREASE);
END;

/* LOOPS */

DECLARE 
    v_counter NUMBER(10) := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('counter is '||v_counter);
        v_counter := v_counter +1;
        EXIT WHEN v_counter >10;
    END LOOP;
END;

/*WHILE LOOP */

DECLARE 
    v_counter NUMBER(10) :=1;
BEGIN
    WHILE v_counter <=10
        LOOP
            DBMS_OUTPUT.PUT_LINE('The counter is '||v_counter);
            v_counter := v_counter+1;
        END LOOP;
END;

/*FOR LOOP */


BEGIN
    FOR i in 1..10
        LOOP
            DBMS_OUTPUT.PUT_LINE(i);
        END LOOP;
END;


-- SQL IN PL/SQL

DECLARE
    v_name varchar2(50);
    v_salary employees.salary%type;
BEGIN
    SELECT first_name || ' ' || last_name , salary INTO v_name, v_salary FROM employees WHERE employee_id = 120;
    DBMS_OUTPUT.put_line('The salary of '|| v_name || ' is : ' || v_salary);
END;
            
DECLARE
    v_name varchar2(50);
    v_salary employees.salary%type;
    v_employee_id employees.employee_id%type := 130;
BEGIN
    SELECT first_name || ' ' || last_name , salary INTO v_name, v_salary FROM employees WHERE employee_id = v_employee_id;
    DBMS_OUTPUT.put_line('The salary of '|| v_name || ' is : ' || v_salary);
END;
            
    
-- CREATING TABLE

CREATE TABLE employees_copy AS SELECT * FROM employees;


select * from employees_copy
ORDER BY employee_id DESC;

-- INSERTING JUNK DATA

BEGIN
    FOR i IN 207..216 
        LOOP
            INSERT INTO employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)
            VALUES (i,'employee_id'||i, 'temp_emp', 'abc@gmail.com', sysdate, 'IT_PROG',1000);
        END LOOP;
END;

-- UPDATING

DECLARE
    v_salary_increase NUMBER :=4000;
BEGIN
    FOR i IN 207..216 
        LOOP
            UPDATE employees_copy
                SET salary = salary + v_salary_increase
            WHERE employee_id = i;
        END LOOP;
END;