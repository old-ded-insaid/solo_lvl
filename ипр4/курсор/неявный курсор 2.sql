declare
  l_num number;
begin
  update employees e
     set e.phone_number = '89537946928'
   where e.employee_id = 207;

  l_num := sql%rowcount;
  dbms_output.put_line (l_num);
end;
