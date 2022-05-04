------- ������������� �����������������. LIST

---- 1. LIST-����������������� (������)
drop table list_tab;

create table list_tab(
  order_id number,
  sernum varchar2(100 char),
  state_code varchar2(10 char)
)
partition by list (state_code) -- ��������
(
 partition region_east   values ('MA','NY'),
 partition region_west values ('CA','AZ'),
 partition region_south values ('TX','KY'),
 partition region_null  values (null),
 partition region_unknown values (default)
);

-- ��������� ������
insert into list_tab(order_id, sernum, state_code) values (1, '111', 'MA');
insert into list_tab(order_id, sernum, state_code) values (2, '222', 'TX');
insert into list_tab(order_id, sernum, state_code) values (3, '333', null);
insert into list_tab(order_id, sernum, state_code) values (4, '444', 'ZZZ');
insert into list_tab(order_id, sernum, state_code) values (5, '555', 'CA');
commit;

-- ������� ��������, � ����� ���� ����� ������
select * from list_tab partition (region_east);
select * from list_tab partition (region_west);
select * from list_tab partition (region_south);
select * from list_tab partition (region_null);
select * from list_tab partition (region_unknown);


---- 2. LIST-����������������� (������) + �������������� ��������� ������
drop table auto_list_tab;

create table auto_list_tab(
  order_id number,
  sernum varchar2(100 char),
  state_code varchar2(10)
)
partition by list (state_code) automatic -- �������������� ���������
(
partition p_ca values ('CA')
);

-- ��������� ������
insert into auto_list_tab(order_id, sernum, state_code) values (1, '111', 'MA');
insert into auto_list_tab(order_id, sernum, state_code) values (2, '222', 'TX');
insert into auto_list_tab(order_id, sernum, state_code) values (2, '222', 'CA');
insert into auto_list_tab(order_id, sernum, state_code) values (3, '333', null);
insert into auto_list_tab(order_id, sernum, state_code) values (4, '444', 'ZZZ');
commit;

-- �������, ����� ������ �������
select * from user_tab_partitions t where t.table_name = 'AUTO_LIST_TAB';
