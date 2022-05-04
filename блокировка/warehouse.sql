/*begin
    execute immediate 'drop table warehouse';
    dbms_output.put_line('1');
  exception
    when others then
      dbms_output.put_line('��� ����� ������� ');
end;*/

drop table warehouse;

create table warehouse(
  product_id     number(10) not null,
  rest           number(20) not null
);

-- �� ������ ���� 100 ������ ������ � ID = 1
insert into warehouse values (1, 100);
commit;

select * from warehouse;
