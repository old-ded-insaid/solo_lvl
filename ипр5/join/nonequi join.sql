/*non equi join

�����: 1. 
������: 1. 

����: 1. �������� ������ � on
      2. ����������� ������ � ������� ����������

*/

select *
from  employees e join jobs j on (e.job_id = j.job_id and salary*2 <j.max_salary);

select e.first_name, e.salary, j.min_salary, j.max_salary 
from  employees e join jobs j on (e.job_id = j.job_id and salary=j.max_salary);

select e.first_name, e.salary, j.min_salary, j.max_salary 
from  employees e join jobs j on (e.job_id = j.job_id and salary<j.max_salary);

select e.first_name, e.salary, j.min_salary, j.max_salary 
from  employees e join jobs j on (e.job_id = j.job_id and salary between j.min_salary+2000 and j.max_salary+3000);
