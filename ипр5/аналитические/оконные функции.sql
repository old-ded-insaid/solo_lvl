select * from employees;
select distinct sum(e.salary) over (partition by e.department_id order by salary) sym,
                max(e.salary) over (partition by e.department_id ),
                count(e.salary) over (partition by e.department_id ),
                department_id 
           from employees e;
select distinct max(e.salary) over (partition by e.department_id ) sym from employees e;


select e.first_name
     , e.last_name
     , d.department_name
     , e.salary
     , sum(e.salary) over (partition by d.department_id) summ
     , round(e.salary/sum(e.salary) over (partition by d.department_id),2) summ
  from employees e
            , departments d
        where e.department_id = d.department_id
        order by d.department_id;
        
select e.first_name
     , e.last_name
     , d.department_name
     , e.salary
     , sum(e.salary) over (partition by d.department_id) summ
     , round(e.salary/sum(e.salary) over (partition by d.department_id),2) summ
     , ratio_to_report (e.salary) over (partition by d.department_id) summ2
  from employees e
            , departments d
        where e.department_id = d.department_id
        order by d.department_id;
