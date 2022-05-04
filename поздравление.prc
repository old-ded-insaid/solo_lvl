create or replace procedure send_email is
Cursor c_cur is
  (select e.first_name, e.last_name, e.email, e.employee_id
     from employees e
    where e.email is not null
      and extract(month from e.hire_date) = extract(month from sysdate)
      and extract(day from e.hire_date) = extract(day from sysdate));
  l_text varchar2(300);
  l_f_name varchar2(300);
  l_l_name varchar2(300);
  l_email varchar2(300);
  l_id employees.employee_id%type;
begin
  open c_cur;
  loop
    
    fetch c_cur
    into l_f_name
       , l_l_name
       , l_email
       , l_id;
       
    l_text := 'Уважаемый клиент '|| l_f_name || ' ' || l_l_name || ' с др тебя';
    
    begin
      dbms_output.put_line (l_text || ' ' || l_email );
    exception
      when others then
        dbms_output.put_line ('ошибка отправки для клиента ' || l_id || ' ' || l_f_name || ' ' || l_l_name ||sqlerrm);
    end;
  
  exit when c_cur%notfound;
  end loop;  
  close c_cur;
end;
/
