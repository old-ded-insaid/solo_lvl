--�����
declare
cursor c_cur is
  select e.first_name from employees e;
cursor c_cur2 is
  select * from employees e;
  l_name employees.first_name%type;
  l_row employees%rowtype;
begin
  open c_cur;
  loop
    fetch c_cur
    into l_name;
    dbms_output.put_line(l_name);
  
    exit when c_cur%notfound;
  end loop;
  dbms_output.put_line('����� ������' || c_cur%rowcount);
  close c_cur;
  
    open c_cur2;
  loop
    fetch c_cur2
    into l_row;
    dbms_output.put_line(l_row.first_name);

  
    exit when c_cur2%notfound;
  end loop;

  dbms_output.put_line('����� ������' || c_cur2%rowcount);
  close c_cur2;
end;

--������� ����
declare
i number := 0;
begin
  for cur in (select * from employees e)
  loop
    dbms_output.put_line(cur.first_name);
    i := i + 1;
  end loop;
  dbms_output.put_line('kol '|| i);
end;

--�����
declare
cursor c_cur is
  select e.first_name from employees e;
  l_name employees.first_name%type;
  l_row employees%rowtype;
begin
  open c_cur;
  fetch c_cur
   into l_name;
  while c_cur%found
  loop
    dbms_output.put_line(l_name);
    fetch c_cur
     into l_name;
  end loop;
  -- exit when c_cur%notfound;
  dbms_output.put_line('����� ������' || c_cur%rowcount);
  close c_cur;
end;
