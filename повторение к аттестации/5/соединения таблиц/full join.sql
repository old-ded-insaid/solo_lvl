-- показываются все записи которые могут объедениться, дополняются записи потовые есть только в левой таблицы
--, потом дополняются записи из правой таблицы

select * from employees e 
full join departments d on (d.department_id = e.department_id)
