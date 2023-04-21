select e.employee_id
     , e.first_name
     , e.manager_id
  from employees e
connect by prior e.employee_id = e.manager_id
  start with e.employee_id = 100;
-- ������ ����
select e.employee_id
     , e.first_name
     , e.manager_id
  from employees e
 where e.employee_id != 101
connect by prior e.employee_id = e.manager_id
  start with e.employee_id = 100;
--������ �����
select e.employee_id
     , e.first_name
     , e.manager_id
     , level l
  from employees e
connect by prior e.employee_id = e.manager_id
       and e.employee_id !=101
  start with e.employee_id = 100;
  
  --

select e.employee_id
     , e.first_name
     , e.manager_id
     , level l
     , prior e.first_name as mng_name
     , Connect_By_Isleaf
     , CONNECT_BY_ROOT(e.employee_id)
     , CONNECT_BY_ISCYCLE
  from employees e
connect by  NOCYCLE prior e.employee_id = e.manager_id
  start with e.employee_id = 100;


select e.employee_id
     , lpad(' ', (level - 1) * 2) || e.first_name
     , e.job_id
     , e.manager_id
     , level
  from employees e
connect by nocycle prior e.employee_id = e.manager_id
start with e.manager_id is null
;

select e.employee_id
     , lpad(' ', (level - 1) * 2) || e.first_name
     , e.job_id
     , e.manager_id
     , level
  from employees e
connect by nocycle  e.employee_id = prior e.manager_id
start with e.employee_id = 203 
;

select e.employee_id
     , lpad(' ', 4*(level - 1)) || e.first_name
     , e.job_id
     , e.manager_id mng
     , prior e.first_name as mng_name -- ��� ����������
     , level as lvl -- ������� ����
     , Connect_By_Isleaf leaf  -- 0 ���� �������� ������ 1 ��� �������� �������
     , CONNECT_BY_ROOT(e.first_name) as boss -- ��� �������� ������������
     , CONNECT_BY_ISCYCLE
     , Sys_Connect_By_Path(first_name, ', ')
  from employees e
 connect by NOCYCLE prior e.employee_id = e.manager_id
 start with e.employee_id = 100;
 --ORDER SIBLINGS BY employee_id desc; -- ����������� ��������� ��������� ������ � �������� ������ ������ ��������.


select e.employee_id
     , lpad(' ', 4*(level - 1)) || e.first_name
     , e.job_id
     , e.manager_id mng
     , prior e.first_name as mng_name -- ��� ����������
     , level as lvl -- ������� ����
     , Connect_By_Isleaf
     , CONNECT_BY_ROOT(e.first_name) as boss -- ��� �������� ��������
     , CONNECT_BY_ISCYCLE
     , Sys_Connect_By_Path(first_name, ', ')
  from employees e
 connect by NOCYCLE prior e.employee_id = e.manager_id
 start with e.employee_id = 100
 ORDER SIBLINGS BY employee_id desc; -- ����������� ��������� ��������� ������ � �������� ������ ������ ��������.



