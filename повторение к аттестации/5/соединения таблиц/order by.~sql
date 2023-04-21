select *
  from employees e
     , departments d
     , locations l
  where e.department_id = d.department_id
    and d.location_id = l.location_id
  order by case when l.city = 'Toronto' then 1
                when l.city = 'Seattle' then 2
                else 3
           end desc
  
  
; 
