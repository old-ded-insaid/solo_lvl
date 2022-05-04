

select row_number() over (order by e.employee_id asc), e.employee_id from employees e;
select rank() over (order by e.employee_id asc), e.employee_id, e.manager_id from employees e;

select dense_rank() over (order by e.employee_id asc), e.employee_id, e.manager_id from employees e;

select ntile(20) over (order by e.employee_id asc), e.employee_id, e.manager_id from employees e;

select first_value(e.employee_id) over(partition by e.salary order by e.salary desc) from employees e;
select last_value(e.first_name) over(partition by e.job_id order by e.salary desc) from employees e;
select nth_value(e.first_name, 2) over(partition by e.job_id order by e.salary desc)  from employees e

select distinct nth_value(e.salary, 3) over(partition by e.job_id order by e.salary desc)  from employees e


select e.employee_id, e.first_name, 
      lag(e.first_name, 1, 'r') over( order by e.employee_id asc)  from employees e
      
select e.employee_id, e.first_name, 
lead(e.first_name, 1, 'r') over( order by e.employee_id asc)  from employees e


select e.employee_id, e.first_name, 
ratio_to_report(e.salary ) over(partition by e.job_id)  from employees e

select e.employee_id
     , lpad(' ',(level-1)*4)||e.first_name
     , e.manager_id
     , level
     , prior e.first_name pr
     , connect_by_isleaf
     , connect_by_iscycle
     , connect_by_root(e.first_name)
     , sys_connect_by_path(e.first_name, ' : ')
     from employees e
connect by nocycle prior e.employee_id =  e.manager_id
--start with e.first_name = 'Shelley'
ORDER SIBLINGS BY e.employee_id


select e.employee_id
     , lpad(' ', (level-1)*4)||e.first_name
     , e.manager_id
     , level
     , connect_by_isleaf
     , connect_by_iscycle
     , prior(e.first_name)
     , connect_by_root (e.first_name)
     , sys_connect_by_path(e.first_name, ' ')
     from employees e
connect by nocycle e.employee_id =  prior e.manager_id
start with e.first_name = 'Pat'
order SIBLINGS by e.employee_id

select e.employee_id
     , lpad(' ',(level-1)*4)||e.first_name
     , e.manager_id
     , level
     , prior e.first_name
     , connect_by_isleaf
     , connect_by_iscycle
     , connect_by_root(e.first_name)
     , sys_connect_by_path(e.first_name, ' ')
     from employees e
connect by nocycle prior e.employee_id = e.manager_id
start with e.first_name = 'Karen'
order siblings by e.first_name
