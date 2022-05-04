select * from employees e
connect by prior e.employee_id = e.manager_id
and e.job_id != 'SA_MAN'


select e.employee_id
     , e.first_name
     , e.manager_id
     , level
     , prior (first_name)
  from employees e
connect by prior e.employee_id = e.manager_id

select e.employee_id
     , e.first_name
     , e.manager_id
     , level
     , prior (first_name)
  from employees e
connect by  e.employee_id = prior e.manager_id
start with e.employee_id = 179

select e.employee_id
     , e.first_name
     , e.manager_id
     , level
     , prior (first_name)
  from employees e
connect by  e.employee_id = prior e.manager_id


select e.employee_id
     , e.first_name
     , e.manager_id
     , level
     , prior (first_name)
     , CONNECT_BY_ISCYCLE
  from employees e
connect by NOCYCLE prior e.employee_id =  e.manager_id

select e.employee_id
     , lpad(' ', (level - 1)*5) || e.first_name
     , e.manager_id
     , level
     , Connect_By_Isleaf
     , prior (first_name)
     , CONNECT_BY_ISCYCLE
     , SYS_CONNECT_BY_PATH(first_name,' : ')
  from employees e
connect by NOCYCLE prior e.employee_id =  e.manager_id


select e.employee_id
     , lpad(' ', (level - 1)*5) || e.first_name
     , e.manager_id
     , level
     , Connect_By_Isleaf
     , CONNECT_BY_ROOT(first_name)
     , prior (first_name)
     , CONNECT_BY_ISCYCLE
     , SYS_CONNECT_BY_PATH(first_name,' : ')
  from employees e
connect by NOCYCLE prior e.employee_id =  e.manager_id


