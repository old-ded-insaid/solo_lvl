/*declare
cursor asd is
 select e.first_name from employees e
  where e.employee_id = 150;

cursor asd1 is
 select * from employees e
  where e.employee_id = 150;
  l_name employees.first_name%type;
  l_row employees%rowtype;
begin
  open asd;
  loop
    fetch asd
     into l_name;

    exit when asd%notfound;
  end loop;
  dbms_output.put_line(l_name); 
  close asd;

  open asd1;
  loop
    fetch asd1
     into l_row;
  
    exit when asd1%notfound;
  end loop;
  dbms_output.put_line(asd1%rowcount);
  dbms_output.put_line(l_row.last_name); 
  close asd1;
end;*/

declare
  i number := 0;
begin
  for qwe in ( select * 
                 from employees e
                where e.employee_id = 150 ) loop
    dbms_output.put_line(qwe.email);
    dbms_output.put_line(qwe.manager_id); 
    i := i + 1;
  end loop;
end;
/
declare
  cursor zxc is
    select * 
      from employees e
     where e.employee_id = 150;
 l_row employees%rowtype;
begin
  open zxc;
  while zxc%found
  loop
    fetch zxc into l_row;
    dbms_output.put_line(l_row.manager_id);
  end loop;
  close zxc;
end;
