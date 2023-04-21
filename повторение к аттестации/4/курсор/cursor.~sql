-- это селект который объявлен в plsql коде
-- курсор без параметров
cursor kyk is select e.first_name from employees e where e.employee_id > 150;


create or replace function kyk
return varchar2
is
  l_number varchar2(20);
  cursor kek is (select first_name from employees e where e.employee_id > 150 );
begin
  open kek;
  fetch kek into l_number;
  if kek%notfound then
    l_number := 'xcz';
  end if;
  close kek;
  return l_number;
end;

-- курсов с параметрами
cursor e2 (p_id number)
is
select e.first_name from employees e where e.employee_id = p_id;

cursor c3
return employees.first_name%type
is
select e.employee_id from employees e where e.employee_id = 150 ;
