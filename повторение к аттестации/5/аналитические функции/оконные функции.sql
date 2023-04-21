select t.first_name
     , last_name
     , t.job_id
     , salary
     , max(nvl(t.salary,0)) over (partition by job_id) max_sal
     , avg(nvl(t.salary,0)) over (partition by job_id) avg_sal
     , sum(nvl(t.salary,0)) over (partition by t.department_id) dep
     , round(nvl(t.salary,0)) / sum(nvl(t.salary,0)) over (partition by t.department_id)
  from employees t
 order by 3 desc;
