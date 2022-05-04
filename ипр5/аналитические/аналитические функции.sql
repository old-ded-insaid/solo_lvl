select e.first_name
     , e.last_name
     , job_id
     , salary
     , first_value(first_name || ' ' || last_name) over(partition by job_id order by salary desc) as fv
  from employees e
  where e.job_id in ('FI_ACCOUNT','IT_PROG','PU_CLERK')
  
  
  select e.first_name
     , e.last_name
     , job_id
     , salary
     , last_value(first_name || ' ' || last_name) over(partition by job_id order by salary asc
     rows between unbounded preceding and unbounded following ) as fv
  from employees e
  where e.job_id in ('FI_ACCOUNT','IT_PROG','PU_CLERK')
  
select e.first_name
     , e.last_name
     , job_id
     , salary
     , nth_value(first_name || ' ' || last_name, 1) over(partition by job_id order by salary asc
     rows between unbounded preceding and unbounded following ) as fv
  from employees e
  where e.job_id in ('FI_ACCOUNT','IT_PROG','PU_CLERK')
  

SELECT DISTINCT department_id, NTH_VALUE(salary,2)
  OVER (PARTITION BY department_id ORDER BY salary DESC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       AS "SECOND HIGHEST"
  FROM employees
 WHERE department_id in (10,20)
 ORDER BY department_id;
 
 SELECT DISTINCT department_id, NTH_VALUE(salary,2)
  OVER (PARTITION BY department_id ORDER BY salary DESC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       AS "SECOND HIGHEST",
  NTH_VALUE(salary,3)
  OVER (PARTITION BY department_id ORDER BY salary DESC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       AS "THIRD HIGHEST"
  FROM employees
 WHERE department_id in (10,20)
 ORDER BY department_id;
 
 SELECT DISTINCT NTH_VALUE(salary,2)
  OVER (ORDER BY salary ASC
       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       AS "SECOND LOWEST"
  FROM employees;
  
select e.first_name
     , e.last_name
     , job_id
     , salary
     , nth_value(first_name || ' ' || last_name, 2) over(partition by job_id order by salary asc
     rows between unbounded preceding and unbounded following ) as fv
  from employees e
  where e.job_id in ('FI_ACCOUNT','IT_PROG','PU_CLERK')
  
select e.first_name
     , e.last_name
     , job_id
     , salary
     , lag(first_name || ' ' || last_name, 1, 'ky') over(partition by job_id order by salary asc) as fv
  from employees e
  where e.job_id in ('FI_ACCOUNT','IT_PROG','PU_CLERK')


select e.first_name
     , e.last_name
     , job_id
     , salary
     , lead(first_name || ' ' || last_name, 1, '-') over(partition by job_id order by salary asc) as fv
  from employees e
  where e.job_id in ('FI_ACCOUNT','IT_PROG','PU_CLERK')
  
  select e.first_name
     , e.last_name
     , job_id
     , salary
     , ratio_to_report(e.salary) over(partition by job_id) as fv
  from employees e
  where e.job_id in ('FI_ACCOUNT','IT_PROG')
