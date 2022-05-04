﻿select level from dual connect by level <= 10;

select sysdate
     , level
     , sysdate+level
     , to_char(sysdate+level, 'dy') 
  from dual 
connect by level <30

select * from ( select sysdate
                     , level
                     , sysdate+level
                     , to_char(sysdate+level, 'dy') day
                  from dual
               connect by level <30) d
                 where d.day not in('вс', 'сб')
                 
select * 
  from (select level l
          from dual 
       connect by level < 100)
  where mod(l,3) <> 0;


select s.id
     , level le
     , lpad(' ', (level - 1) * 5) || s.fio le
     , s.bossid
     , s.statusname
      from Sotrudniki s
connect by prior s.id =  s.bossid
order by 1,2;

select level
     , lpad(' ', (level - 1) * 5) || 'q'
  from dual connect by level <10


select s.id
     , level le
     , lpad(' ', 4*level, ' ')|| s.fio
     , s.bossid
     , s.statusname
       from Sotrudniki s
 start with s.id = 2
connect by prior s.id =  s.bossid
order siblings by 1;

/*вывести на экран sin от  до 1 с шагом 0,1 не выводить sin0.3 b 0.7
вывести на экран календарь предыдущего месяца
создать таблицу детали где одна едталь может быть частью другой
*/

select e.employee_id
     , lpad(' ', (level - 1) * 4) ||e.first_name
     , e.manager_id
     , level
      from employees e
connect by prior e.employee_id = e.manager_id;

select e.employee_id
     , lpad(' ', (level - 1) * 4) ||e.first_name
     , e.manager_id
     , level
      from employees e
connect by  e.employee_id = prior e.manager_id;

select e.employee_id
     , lpad(' ', (level - 1) * 4) ||e.first_name
     , e.manager_id
     , level
      from employees e
      start with e.first_name = 'Alexander'
connect by  e.employee_id = prior e.manager_id;


select * from EMP

Select Level
     ,Emp.Empno
     ,Emp.Ename
     , -- Manager no
      Emp.Mgr Manager_No
     , -- Name of manager
     -- Prior: The Operator point to prior record.
      Prior Emp.Ename Manager_Name
From   Emp
Connect By Prior Emp.Empno = Emp.Mgr
Start  With Emp.Mgr Is Null;

Select Level
     ,Emp.Empno
     ,Emp.Ename
     , -- Manager no
      Emp.Mgr Manager_No
     , -- Name of manager
     -- Prior: The Operator point to prior record.
      Prior Emp.Ename Manager_Name
From   Emp
Connect By Prior Emp.Empno = Emp.Mgr
Start  With Emp.Mgr = 7839;

Select Level
     ,Emp.Empno Emp_No
     ,Lpad(' '
          ,4 * (Level - 1)) || Emp.Ename Emp_Name
     ,Emp.Mgr Manager_No
     ,Prior Emp.Ename Manager_Name
From   Emp
Where  Emp.Ename != 'JONES'
Connect By Prior Emp.Empno = Emp.Mgr
Start  With Emp.Mgr Is Null;
/*позволяют строить соедиления самой с собой*/

Select Level
     ,Emp.Empno Emp_No
     ,Lpad(' '
          ,4 * (Level - 1)) || Emp.Ename Emp_Name
     ,Emp.Mgr Manager_No
     ,Prior Emp.Ename Manager_Name
From   Emp
Connect By Prior Emp.Empno = Emp.Mgr
   And    Emp.Ename != 'JONES'
Start  With Emp.Mgr Is Null;


CONNECT_BY_ISCYCLE	Столбец определяющий повторяется ли значение? Если да, возвращает 1 если нет, то 0. Этот столбец должен использоваться с оператором NOCYCLE в пункте connect by
SYS_CONNECT_BY_PATH(Cột, giá trị ngăn cách)	Созлать путь значения столбца от коренного node до настоящего node, каждый node отделяется "разделенными значениями". 
ORDER SIBLINGS BY	Упорядочить дочерние node одинакового уровня (level)

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level -- Показывает уровень node (глубина), коренной node (root) c уровенем (level) 1
  from employees e
connect by e.employee_id = e.manager_id;

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level ф -- Показывает уровень node (глубина), коренной node (root) c уровенем (level) 1
     , Prior first_name н-- Prior Оператор показывает родителя подветки
  from employees e
connect by Prior e.employee_id = e.manager_id; 

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level le
     , Prior first_name н
     , Connect_By_Isleaf "true/false" -- Листовой node или нет? Если листовой Node возвращает 1, если нет возвращает 0, 1 ставится от 3 level
  from employees e
connect by Prior e.employee_id = e.manager_id;

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level le 
     , Prior first_name н
     , Connect_By_Isleaf "true/false"
     , CONNECT_BY_ROOT(first_name) р -- Возвращает значение столбца коренного node (level = 1)
  from employees e
connect by Prior e.employee_id = e.manager_id;

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level le
     , Prior first_name н
     , Connect_By_Isleaf "true/false"
     , CONNECT_BY_ROOT(first_name)
  from employees e
connect by NOCYCLE Prior e.employee_id = e.manager_id; --	Оператор в connect by для того, чтобы убрать бесконечный цикл. Например А управляет В,  управляет С, С управляет А. Тогда connect by определяет управляющего который повторяется бесконечно и оператор NOCYCLE будет полезен в данной ситуации.

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level le 
     , Connect_By_Isleaf "true/false"
     , CONNECT_BY_ROOT(first_name)
     , CONNECT_BY_ISCYCLE --Столбец определяющий повторяется ли значение? Если да, возвращает 1 если нет, то 0. Этот столбец должен использоваться с оператором NOCYCLE в пункте connect by
  from employees e
connect by NOCYCLE Prior e.employee_id = e.manager_id;

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level le 
     , Connect_By_Isleaf "true/false"
     , CONNECT_BY_ROOT(first_name)
     , CONNECT_BY_ISCYCLE
     , SYS_CONNECT_BY_PATH(first_name, ' ; ')-- Создать путь значения столбца от коренного node до настоящего node, каждый node отделяется "разделенными значениями". 
  from employees e
connect by NOCYCLE Prior e.employee_id = e.manager_id;

select e.employee_id
     , e.first_name
     , e.manager_id
     , Level le 
     , Connect_By_Isleaf "true/false"
     , CONNECT_BY_ROOT(first_name)
     , CONNECT_BY_ISCYCLE
     , SYS_CONNECT_BY_PATH(first_name, ' ; ')
  from employees e
connect by NOCYCLE Prior e.employee_id = e.manager_id
ORDER SIBLINGS BY employee_id; --Упорядочить дочерние node одинакового уровня (level)
