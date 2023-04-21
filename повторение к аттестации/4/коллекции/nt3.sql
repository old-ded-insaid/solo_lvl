/*declare
type zcx is table of employees%rowtype;
t_zxc zcx := zcx();
l_sad employees%rowtype;
begin
select *  into l_sad from employees e where e.employee_id = 150;

t_zxc.extend;
t_zxc(t_zxc.first) := l_sad;

dbms_output.put_line(t_zxc(1).employee_id);

end;*/
/*
declare
type zcx is table of employees%rowtype;
t_zxc zcx := zcx();
l_sad employees%rowtype;
begin
select *   bulk collect into t_zxc from employees e where e.employee_id = 150;
/*
t_zxc.extend;
t_zxc(t_zxc.first) := l_sad;

dbms_output.put_line(t_zxc(1).employee_id);

end;

*/
declare
  type emp_t is table of employees%rowtype;
  r_emp emp_t := emp_t();
begin
  for re in (select * from employees e where e.employee_id in (150,151,152)) loop
    r_emp.extend;
    r_emp(r_emp.last) := re;
    dbms_output.put_line(r_emp(r_emp.last).employee_id);
  end loop;
  dbms_output.put_line(r_emp.count);
end;

DECLARE
    TYPE nt IS TABLE OF employees.employee_id%type;
    t_nt nt;
BEGIN
    t_nt('Z') := 26;
    t_nt('A') := 1;
    t_nt('K') := 11;
    t_nt('R') := 18;
    --t_nt(1)   := 20;

    DBMS_OUTPUT.PUT_LINE('Before deletions:');
    DBMS_OUTPUT.PUT_LINE('FIRST = ' || t_nt.FIRST);
    DBMS_OUTPUT.PUT_LINE('LAST = ' || t_nt.LAST);

    --t_nt.DELETE(1);
    t_nt.DELETE('Z');

    DBMS_OUTPUT.PUT_LINE('After deletions:');
    DBMS_OUTPUT.PUT_LINE('FIRST = ' || t_nt.FIRST);
    DBMS_OUTPUT.PUT_LINE('LAST = ' || t_nt.LAST);
END;
