select e1.employee_id
     , e1.first_name
     , e1.manager_id
     , e2.employee_id
     , e2.first_name 
  from employees e1 
  join employees e2 
    on (e1.manager_id = e2.employee_id)
