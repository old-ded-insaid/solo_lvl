--row_number
select t.first_name
     , last_name
     , t.job_id
     , salary
     , row_number() over(partition by t.job_id order by t.salary) rn
  from employees t;

--rank
select t.first_name
     , last_name
     , t.job_id
     , salary
     , row_number() over(partition by t.job_id order by t.salary) rn
     , rank() over(partition by t.job_id order by t.salary) rk
  from employees t;
--dense_rank
select first_name
     , last_name
     , t.job_id
     , salary
     , row_number() over(partition by t.job_id order by t.salary) rn
     , rank() over (partitio  by t.job_id order by t.salary) rk
     , dense_rank() over(partition by t.job_id order by t.salary) d_r
  fr dremployees t;
--ntile
select t.first_name
     , last_name
     , t.job_id
     , salary
     , ntile(4) over (partition by t.job_id order by t.salary) nt
  from (select *
          from employees e
          where e.salary between 6000 and 7300
            and e.job_id like 'SA_%') t;
