------- ������������� �����������������. RANGE

---- 1. RANGE-����������������� (�� ���������)
drop table range_tab;

create table range_tab(
  order_id number,
  sernum varchar2(100 char), 
  order_date date
)
partition by range (order_date) -- ��������
(
  partition pmin values less than (date'2008-01-01'), -- ����� ����������� �������
  partition p200802 values less than (date'2008-02-01'), -- �����-�� ������������� ��������
  partition p200803 values less than (date'2008-03-01'), -- �����-�� ������������� ��������
  partition pmax values less than (maxvalue) -- ����� ������������ �������
);

-- ��������� ������
insert into range_tab(order_id, sernum, order_date) values (1, '111', sysdate); -- ������� � pmax
insert into range_tab(order_id, sernum, order_date) values (2, '222', date'2008-02-01'); -- ������� � p200803
insert into range_tab(order_id, sernum, order_date) values (3, '333', date'2001-12-20'); -- ������� � pmin
insert into range_tab(order_id, sernum, order_date) values (4, '444', date'2008-01-01'); -- ������� � 200802
insert into range_tab(order_id, sernum, order_date) values (5, '555', date'2008-02-20'); -- ������� � p200803
insert into range_tab(order_id, sernum, order_date) values (6, '666', date'2008-01-20'); -- ������� � p200802
insert into range_tab(order_id, sernum, order_date) values (7, '777', date'2008-02-20'); -- ������� � p200803
commit;

-- ������� ��������, � ����� ���� ����� ������
select * from range_tab partition (pmin); -- �� ��� ��������� � ����� ������ ��������
select * from range_tab partition (p200802); -- �� ��� ��������� � �������������
select * from range_tab partition (p200803); -- �� ��� ��������� � �������������
select * from range_tab partition (pmax); -- �� ��� ��������� � ������������ ��������

select * from range_tab; -- ��� ������

-- �������� � ��������� �������
select * from user_tab_partitions t where t.table_name = 'RANGE_TAB';


---- 2. RANGE-����������������� (�� ���������) + ����� � �������������� ����������
drop table auto_range_tab;

create table auto_range_tab(
  order_id number,
  sernum varchar2(100 char),
  order_date date
)
partition by range (order_date)
interval(interval '1' day) -- �������� ������� 1 ����
-- interval(interval '1' month) -- �������� ������� 1 �����
-- interval(interval '1' year) -- �������� ������� 1 ���
(
  partition pmin values less than (date'2008-01-01') -- ����� ����������� �������
);

-- �������
insert into auto_range_tab(order_id,
                           sernum,
                           order_date)
select level, 'sernum_'||level, sysdate + level from dual connect by level <= 20;
commit;

-- �������, ��� � �������
select * from auto_range_tab order by order_date;

-- �������, ����� ������ �������
select * from user_tab_partitions t where t.table_name = 'AUTO_RANGE_TAB';
