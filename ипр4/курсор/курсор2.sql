declare
  cursor c_cur is
    (select e.first_name || ' ' || e.last_name
          , e.email
       from employees e
      where e.email is not null
        and extract(day from e.hire_date) = extract(day from sysdate) + 3);
  l_name varchar2(300);
  l_email varchar2(300);
begin
  open c_cur;
  loop
    fetch c_cur
     into l_name
        , l_email;
     begin
       dbms_output.put_line('���� �� ������� '||l_name || ' ' || l_email);
     exception
       when others then
         dbms_output.put_line(l_name || ' ' || l_email || ' ' || sqlerrm);
     end;
  exit when c_cur%notfound;
  end loop;
  close c_cur;
end;
