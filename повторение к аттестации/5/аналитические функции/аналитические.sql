--first_value
select t.job_id
     , first_value(t.first_name) over(partition by t.job_id) fn
  from employees t;
  
select t.employee_id
     , first_name
     , t.last_name
     , t.job_id
     , t.salary
     , first_value(t.first_name || ' ' || t.last_name) over (partition by t.job_id order by t.salary desc) fn
  from employees t
 where t.job_id in ('FI_ACCOUNT', 'PU_CLERK', 'IT_PROG');
 
 --last_value
 select t.employee_id
     , first_name
     , t.last_name
     , t.job_id
     , t.salary
     , last_value(t.first_name || ' ' || t.last_name) over (partition by t.job_id order by t.salary asc) fn
     , last_value(t.first_name || ' ' || t.last_name) over (partition by t.job_id order by t.salary asc
     rows between unbounded preceding and unbounded following) fn2
  from employees t
 where t.job_id in ('FI_ACCOUNT', 'PU_CLERK', 'IT_PROG');
-- nth_value
select t.employee_id
     , first_name
     , t.last_name
     , t.job_id
     , t.salary
     , nth_value(first_name, 2) over (partition by t.job_id order by t.salary asc) nv
     , nth_value(first_name, 2) over (partition by t.job_id order by t.salary asc
     rows between unbounded preceding and unbounded following) nv2
  from employees t

select distinct  t.job_id
     , nth_value(salary, 3) over (partition by t.job_id order by t.salary desc) nv
  from employees t
  
-- lag
select t.employee_id
     , t.first_name
     , t.job_id
     , salary
     , lag(first_name, 1) over (partition by t.job_id order by t.salary) l
     , lag(first_name, 2) over (partition by t.job_id order by t.salary) l2
  from employees t
  where t.job_id in ('FI_ACCOUNT', 'PU_CLERK', 'IT_PROG');
  
-- lead
select t.employee_id
     , t.first_name
     , t.job_id
     , salary
     , lead(first_name, 1) over (partition by t.job_id order by t.salary) l
     , lead(first_name, 2) over (partition by t.job_id order by t.salary) l2
  from employees t
  where t.job_id in ('FI_ACCOUNT', 'PU_CLERK', 'IT_PROG');

-- ratio_to_report
select t.employee_id
     , t.first_name
     , t.job_id
     , salary
     , ratio_to_report(salary) over (partition by t.job_id) l
  from employees t
  where t.job_id in ('FI_ACCOUNT', 'PU_CLERK', 'IT_PROG');
