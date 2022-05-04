with t as (
            select d.department_name den
                 , sum(e.salary) summ
              from employees e
                 , departments d
             where d.department_id = e.department_id
             group by department_name)
select * from t where den= 'Marketing';

with t as (
            select d.department_name den
                 , sum(e.salary) summ
              from employees e
                 , departments d
             where d.department_id = e.department_id
             group by department_name)
select * from t where summ = (select max(summ) from t );
