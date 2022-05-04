/*
курсор
набор данных в котором мы можем идти в цикле
область пал€ти в которую вложен запрос
€вный корсор - который мы объ€вл€ем в declare
*/

select e.first_name, e.last_name, e.email
  from employees e
  where e.email is not null
    --and extract(month from e.hire_date) = extract(month from sysdate)
    and extract(day from e.hire_date) = extract(day from sysdate);

insert into employees e ( e.employee_id, first_name, last_name ,email, e.hire_date, e.job_id)
    values (207, 'јнтон', '»ль€шик', 'asd@mail.ru', sysdate, 'AC_MGR' )
    
    select * from employees e
    
begin
  send_email;
end;


declare
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

    l_text := '”важаемый клиент '|| l_f_name || ' ' || l_l_name || ' с др теб€';

  exit when c_cur%notfound;
  end loop;  
  close c_cur;
end;
