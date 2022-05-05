/*
Размер коллекции изменяется динамически

Может быть в разряженном состоянии, как показано на картинке

Инициализируется конструктором collection_type ( [ value [, value ]... ] )

Если параметры в конструктор не передаются, возвращается пустая коллекция

Datatype – это любой тип данных, кроме ref cursor

Если содержит только одно скалярное значение, то имя колонки – Column_Value SELECT column_value FROM   TABLE(nested_table)

В комментариях к этой статье предлагают более предпочтительный вариант — он более универсальный, допускает не только скалярное значение в таблице:
SELECT value(t) x FROM   TABLE(nested_table) t

Если параметры в конструктор не передаются, возвращается пустая коллекция
*/
--Set operations с nested tables
declare
  type nes is table of number;
  n1 nes := nes(1,2,3);
  n2 nes := nes(3,2,1);
  n3 nes := nes(2,3,1,3);
  n4 nes := nes(1,2,4);
  ans nes;
begin
  dbms_output.put_line(n1.last);
  ans := n1 MULTISET UNION n4; -- Возвращает объединение двух коллекций
  ans := n1 MULTISET UNION n3; -- Возвращает объединение двух коллекций
  ans := n1 MULTISET UNION distinct n3; -- Возвращает объединение двух коллекций с дистинктом (убирает дубли)
  ans := n2 MULTISET INTERSECT n3; -- Возвращает пересечение двух коллекций
  ans := n2 MULTISET INTERSECT distinct n3; -- Возвращает пересечение двух коллекций с дистинктом (убирает дубли)
  ans := SET(n3); -- Возвращает коллекцию с дистинктом (т.е. коллекцию без дублей)
  ans := n3 MULTISET EXCEPT n2; --Возвращает разницу двух коллекций
  ans := n3 MULTISET EXCEPT DISTINCT n2; --Возвращает разницу двух коллекций с дистинктом (убирает дубли)
  /*
  nt1 MULTISET UNION nt4: 1 2 3 1 2 4 
  nt1 MULTISET UNION nt3: 1 2 3 2 3 1 3 
  nt1 MULTISET UNION DISTINCT nt3: 1 2 3 
  nt2 MULTISET INTERSECT nt3: 3 2 1 
  nt2 MULTISET INTERSECT DISTINCT nt3: 3 2 1 
  SET(nt3): 2 3 1 
  nt3 MULTISET EXCEPT nt2: 3 
  nt3 MULTISET EXCEPT DISTINCT nt2: empty set
  */
end;
/
--Логические операции с коллекциями
declare
  type nes is table of number;
  n1 nes := nes(1,2,3);
  n2 nes := nes(3,2,1);
  n3 nes := nes(2,3,1,3);
  n4 nes := nes();
begin
  if n1 = n2 then
    dbms_output.put_line('n1 = n2'); -- коллекции равны, пофиг на сортировку
    dbms_output.put_line('коллекции равны, пофиг на сортировку');
  end if;
  
  if n1 in (n2, n3, n4) then
     dbms_output.put_line('n1 in (n2, n3, n4)'); -- содержимое n1 содержится в n2,n3,n4
     dbms_output.put_line('содержимое n1 содержится в n2,n3,n4');
  end if;
  
  if n1 submultiset of n3 then
     dbms_output.put_line('1 submultiset of n3');
     dbms_output.put_line('содержимое n1 содержится в n3');
  end if;
  
  if 3 member n3 then
    dbms_output.put_line('3 member n3');
    dbms_output.put_line('3 содержится в n3');
  end if;
  
  if n3 is not a set then
    dbms_output.put_line('n3 is not a set');
    dbms_output.put_line('в n3 нет повторяющиеся значений');
  else
    dbms_output.put_line('в n3 есть повторяющиеся значений');
  end if;
  
  if n3 is a set then
    dbms_output.put_line('n3 is a set');
    dbms_output.put_line('в n3 нет повторяющиеся значений');
  else
    dbms_output.put_line('в n3 есть повторяющиеся значений');
  end if;
  
  if n4 is empty then
    dbms_output.put_line('n4 is empty');
    dbms_output.put_line('в переменной n4 пусто');
  else
    dbms_output.put_line('в переменной n4 не пусто');
  end if;

  if n3 is empty then
    dbms_output.put_line('n3 is empty');
    dbms_output.put_line('в переменной n3 пусто');
  else
    dbms_output.put_line('в переменной n3 не пусто');
  end if;
end;
/
begin
  dbms_output.put_line('-------------');
end;
/
--Методы коллекций
declare
  type nes is table of number;
  n nes := nes(1,2);
begin
  dbms_output.put_line(n(1));
  dbms_output.put_line(n(2));
  n.delete(1);
  dbms_output.put_line('n.delete(1) в n(1) пусто');
  n(1) := 11;
  n(2) := 22;
  n.EXTEND;
  for i in n.first..n.last
    loop
    dbms_output.put_line('в n(i) = ' || n(i));
    end loop;
  n(3) := 33;
  if n.EXISTS(3) then
    dbms_output.put_line('в n(3) = ' || n(3) );
  else
    dbms_output.put_line('в n(3) = null');
  end if;
  dbms_output.put_line('всего в массиве значений ' || n.count );
  dbms_output.put_line('максимальное количесво элементов в массиве, для вложеной таблице это null ' 
  || n.LIMIT );
  dbms_output.put_line('выведи следующий интекс от n(2) ' || n.next(2) );
  dbms_output.put_line('выведи предыдущий интекс от n(2) ' || n.prior(2) );
  n.trim;
  dbms_output.put_line('в n(3) пусто');
  n.DELETE(1);
    for i in n.first..n.last
    loop
    dbms_output.put_line('в n(i) = ' || n(i));-- в коллекции один элемент со значением 22
    end loop;
    n.DELETE(-1);
exception
  when COLLECTION_IS_NULL then
    dbms_output.put_line('вы пытаетесь оперировать с атомарно нулевой коллекцией.');
  when NO_DATA_FOUND then
    dbms_output.put_line('обозначает элемент, который был удален, или несуществующий элемент ассоциативного массива.');
  when SUBSCRIPT_BEYOND_COUNT then
    dbms_output.put_line('индекс превышает количество элементов в коллекции.');
  when SUBSCRIPT_OUTSIDE_LIMIT then
    dbms_output.put_line('индекс находится за пределами допустимого диапазона.');
 when VALUE_ERROR then
    dbms_output.put_line('индекс не имеет значения или не может быть преобразован в тип ключа. Это исключение может возникнуть, если ключ определен как диапазон PLS_INTEGER, а индекс находится за пределами этого диапазона.');
end;
/
begin
  dbms_output.put_line('-------------');
end;
/
/*declare
  type ness is table of employees.employee_id%type;
  type ness2 is table of employees.first_name%type;
  cursor c1 is select e.last_name from employees e;
  
  l_id ness;
  l_fi ness2;
begin
  /*select e.employee_id, e.first_name
    into l_id, l_fi
  from employees e; 
  
  open c1;
  loop
    fetch c1 bulk collect into l_id, l_fi limit 10;
    exit when l_id.count = 10;
    --do_something();
  end loop;
  close c1;
   -- delete from 
end;*/
