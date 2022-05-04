select * from employees;

select e.first_name
     , e.last_name
     , job_id
     , salary
     , row_number() over (partition by job_id order by salary desc) row_number_
     , rank() over (partition by job_id order by salary desc) rank_
     , dense_rank() over (partition by job_id order by salary desc) dense_rank_
  from employees e;
  
  select first_name
       , last_name
       , job_id
       , salary
       , ntile(2) over (partition by job_id order by salary desc) group_
    from (
          select * from employees e
          where salary between 6000 and 7000
          and e.job_id = 'SA_REP')
       order by group_ desc;
