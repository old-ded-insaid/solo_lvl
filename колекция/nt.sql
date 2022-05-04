declare
  type nest_table is table of employees.employee_id%type;
  l_num nest_table := nest_table();
begin
  --l_num.extend;
  select e.employee_id
  bulk collect into l_num from employees e;
  
  dbms_output.put_line(l_num(10));
end;
/
begin
  dbms_output.put_line('-------------------');
end;
/
declare
  type n_t is table of number;
  t1 n_t := n_t(1, 2, 3);
  t2 n_t := n_t(3, 2, 1);
  t3 n_t := n_t(2, 3, 1, 3);
  t4 n_t := n_t();
begin
  if t1 = t2 then
    dbms_output.put_line('t1 = t2');-- ������� �� �����������
  end if;

  if t1 in (t2, t3, t4) then
    dbms_output.put_line('t1 in (t2, t3, t4)');
  end if;

  if t1 in (t3) then
    dbms_output.put_line('t1 in (t3)');--�� ������ � ���������
  end if;
  
  if t3 in (t1) then
    dbms_output.put_line('t3 in (t1)');--�� ������ � ���������
  end if;
  
  if t1 submultiset of t3 then
    dbms_output.put_line('t1 submultiset of t3');--(1, 2, 3) ������ � ������������ (2, 3, 1, 3)
  end if;
  
  if t2 submultiset of t3 then
    dbms_output.put_line('t2 submultiset of t3');--(3, 2, 1) ������ � ������������ (2, 3, 1, 3)
  end if;
  
  if 3 member of t3 then
    dbms_output.put_line('������� 3 �������� ������ ���������');--��������� �������� ������� 3 ������ ���������
  end if;
  
  if t3 is not a set then
    dbms_output.put_line('������ � ��������� ���');--��������� �������� �� ��������� �����
  end if;
  
  if t4 is empty then
    dbms_output.put_line('������ ��������� t4');--����� �� ���������
  end if;
end;
/
begin
  dbms_output.put_line('-------------------');
end;
/
declare
  type n_t is table of number;
  nt n_t := n_t(2, 3, 1, 3);
begin
  --nt.delete(2);
  nt.extend(1,1);-- ������� ������� 1, ������ �� 5 ������� �������� 2
  nt.extend(2);-- �������� 2 ������ �������� (�������� ��������� �� 2 ������)
  for i in nt.first..nt.last
  loop
    dbms_output.put_line(nt(i));
  end loop;
  nt(6) := 5;
  nt(7) := 5;
  dbms_output.put_line('---');
  nt.trim;-- ������ ��������� �������, �� ���� 7��
  nt.delete(2);--������ 2�� �������
  nt(2) := 101;-- �������� �� 2 ������� �������� 101
  dbms_output.put_line('count = '|| nt.count);
  for i in nt.first..nt.last
  loop
    dbms_output.put_line(nt(i));
  end loop;
end;
/
begin
  dbms_output.put_line('-------------------');
end;
/
create or replace type my_tab_t as table of varchar2(30);
create table nes_table (id number, coll my_tab_t)
             nested table coll store as coll_tab;
insert into nes_table values (1, my_tab_t('q'));
insert into nes_table values (4, my_tab_t('w', 'a'));
insert into nes_table values (2, my_tab_t('e', 's'));
insert into nes_table values (3, my_tab_t('r', 'd'));
select * from nes_table;
select * from nes_table, table (nes_table.coll);
select * from nes_table, table (nes_table.coll) where id = 3;
/
begin
  dbms_output.put_line('-------------------');
end;
/
DECLARE
    TYPE nt_type IS TABLE OF NUMBER;
    nt nt_type := nt_type(11, 22, 33, 44, 55, 66);
BEGIN
    nt.TRIM; -- Trim last element 
    nt.DELETE(4); -- Delete fourth element 
    nt.TRIM(2); -- Trim last two elements 
    dbms_output.put_line(nt(1));
    dbms_output.put_line(nt(2));
    dbms_output.put_line(nt(3));
   -- dbms_output.put_line(nt(4));
    --dbms_output.put_line(nt(5));   
END;
