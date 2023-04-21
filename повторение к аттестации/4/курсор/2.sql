select e.first_name, e.email, e.salary
  from employees e
  where mod(e.employee_id, 2) = 0;
/

declare
  cursor asd is
    select e.first_name, e.email, e.salary
      from employees e
      where mod(e.employee_id, 2) = 0;
  l_fio employees.first_name%type;
  l_email employees.email%type;
  l_sal employees.salary%type;
begin
  open asd;
  loop
    fetch asd
    into l_fio, l_email, l_sal;

    exit when asd%notfound;
    dbms_output.put_line(l_email ||' неси бабки ' || l_fio || ' твой долг:' || l_sal);
  end loop;
  close asd;
end;   
