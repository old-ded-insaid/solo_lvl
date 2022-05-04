declare
  type num_tbl is table of number index by pls_integer; --ассоц массив
  nums num_tbl;
  i pls_integer;
begin
  nums(1) := 500;
  nums(2) := 700;
  nums(3) := 800;
  nums(5) := -1000.05;
  nums.delete(5);
  for i in nums.first..nums.last
  loop
    if nums.exists(i) then
      dbms_output.put_line( i || ' '|| nums(i) );
    end if;
  end loop;
  
  dbms_output.put_line( '-----2------');
/*2*/
  i := nums.first;
  loop
    exit when i is null;
    dbms_output.put_line( i || ' '|| nums(i) );
    
    i := nums.next(i);
  end loop;
end;
/
--------
begin
  dbms_output.put_line( '-----varchar------');
end;
----
/
declare
  type num_tbl is table of number index by varchar(20); --ассоц массив
  nums num_tbl;
  i varchar(20);
begin
  nums('msk') := 500;
  nums('spb') := 700;
  nums('qwe') := 800;

  i := nums.first;
  loop
    exit when i is null;
    dbms_output.put_line( i || ' '|| nums(i) );
    
    i := nums.next(i);
  end loop;
end;
/
begin
  dbms_output.put_line( '-----------' );
end;
/
declare
  type varr is table of employees.first_name%type index by pls_integer;
  l_varr varr;
  l_varr2 varr;
begin
  l_varr(1) := 'кук';
  l_varr(2) := 'мук';
  l_varr(3) := 'хрюк';
  
  dbms_output.put_line(l_varr(3));
  
  l_varr2 := l_varr;
  
  dbms_output.put_line(l_varr2(2));
end;
/
begin
  dbms_output.put_line( '-----------' );
end;
/
declare
  type varr is table of employees%rowtype index by pls_integer;
  l_varr varr;
  l_varr2 varr;
begin
  l_varr(1).first_name := 'кук';
  l_varr(2).first_name := 'мук';
  l_varr(3).first_name := 'хрюк';
  
  dbms_output.put_line( l_varr(2).first_name );
end;
/
begin
  dbms_output.put_line( '-----------' );
end;
/
declare
  type varr_rec is record(id number, name varchar(50), c_date date);
  type varr is table of employees%rowtype index by pls_integer;
  l_varr varr;
  l_varr2 varr;
begin
  l_varr(1).employee_id := 666;
  l_varr(1).first_name := 'мук';
  l_varr(1).hire_date := sysdate;
  
  dbms_output.put_line( l_varr(1).employee_id );
  dbms_output.put_line( l_varr(1).first_name );
  dbms_output.put_line( l_varr(1).hire_date );
end;
/
begin
  dbms_output.put_line( '-----------' );
end;
/
declare
  type varr is table of number;
  l_varr varr;
begin
  l_varr := varr();-- пустая коллекция

  l_varr.extend;

  l_varr(1) := 666;
  
  dbms_output.put_line( l_varr(1) );
  
  l_varr.extend;
  l_varr(2) := 222;
  dbms_output.put_line( l_varr(2) );
end;
/
begin
  dbms_output.put_line( '-----------' );
end;
/
declare
  type varr is table of number;
  l_varr varr;
begin
  l_varr := varr();-- пустая коллекция

  l_varr.extend;

  l_varr(l_varr.last) := 666;
  
  dbms_output.put_line( l_varr(1) );
  
  l_varr.extend;
  l_varr(l_varr.last) := 222;
  dbms_output.put_line( l_varr(2));
  
  l_varr.delete(2);-- удаляет второй элемент
  if l_varr.exists(2) then
  dbms_output.put_line( l_varr(2));
  end if;
end;

--select e.employee_id, e.first_name, e.hire_date from employees e
