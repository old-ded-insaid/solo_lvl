/*
select for update
блокировка - механизм использующий для управления одновременным доступом к общемуресурсу
*/

--- таблица для демонстрации блокировок
begin
    execute immediate 'drop table wallet';
    dbms_output.put_line('1');
  exception
    when others then
      dbms_output.put_line('нет такой таблицы ');
end;


create table wallet(
  wallet_id number(30),
  balance   number(20,2)
);


-- два кошелека с балансами
insert into wallet values (1, 100);
insert into wallet values (2, 200);
commit;

select * from wallet;
