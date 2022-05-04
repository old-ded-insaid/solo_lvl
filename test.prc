create or replace procedure test (
    p_ur number
  , p_cl out  sys_refcursor)
is
begin
  open p_cl for
    select * from employees e
     where mod(e.employee_id, p_ur) = 0;
end;
/
