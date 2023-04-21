/*
элемент коллекции (фрагмент)
элементы -строки
индексы - номера строк

*/


/*коллекции
всего 3 вида коллекции:
1. varray
  размер фиксирован
  индекс начинается с 1
  коллекция всегда плотная
  --индекс и количество элементов всегда одинаковые
  элементы нужно инициировать перед использованием, без инициализации все операции кроме exist вызовут ошибку

  когда использовать:
  когда изместно сколько элементов в массиве будет
  и когда знаем что коллекция будет полная
*/
declare
  type ed_varry is varray(4) of varchar2(10); -- of number
  r_ed ed_varry := ed_varry(11, 22, 33, 4);
begin
  dbms_output.put_line('varray');
  for q in r_ed.first..r_ed.last loop
    dbms_output.put_line('r_ed(' || q || ') = ' || r_ed(q));
  end loop;
end;
--
declare
  type ed_varry is varray(4) of varchar2(10); -- of number
  r_ed ed_varry := ed_varry(11, 22, 33, 44);
  r_ed_rev ed_varry := ed_varry();
begin
  dbms_output.put_line('varray');
  r_ed_rev.extend(4);
  dbms_output.put_line('r_ed_rev.count = ' || r_ed_rev.count);
  for q in r_ed.first..r_ed.last loop
    r_ed_rev(r_ed_rev.count - q + 1) := r_ed(q);
    dbms_output.put_line('r_ed_rev(' || q || ') = ' || r_ed_rev(q));
  end loop;
  dbms_output.put_line('r_ed_rev.1 = ' || r_ed_rev(1));
  dbms_output.put_line('r_ed_rev.2 = ' || r_ed_rev(2));
  dbms_output.put_line('r_ed_rev.3 = ' || r_ed_rev(3));
  dbms_output.put_line('r_ed_rev.4 = ' || r_ed_rev(4));
end;


/*
2 вложеная таблица nested table
  нет ограничения по количеству элементов
  расширять можно только extend
  заполняется последовательно с индекса 1
  может быть плотнай и разряженной
  хранится сгенерированной в системной таблице бд и может использоваться для выбора извлечения значений
  индекс и последовательность не являются стабильными, то есть индекс и количества элементов могут варьироваться
  элементы нужно иницииоровать перед использованием, без инициализации все операции кроме exist вызовут ошибку
*/
declare
  type ed_n_t is table of number; --varchar2
  r_ed ed_n_t:= ed_n_t(11, 22, 33, 44);
begin
  dbms_output.put_line('nest_table');
  for q in r_ed.first..r_ed.last loop
    dbms_output.put_line('r_ed(' || q || ') = ' ||r_ed(q));
  end loop;
end;
--

declare
  type ed_n_t is table of number; --varchar2
  r_ed ed_n_t:= ed_n_t(11, 22, 33, 44);
  r_ed_rev ed_n_t:= ed_n_t();
begin
  dbms_output.put_line('nest_table');
  r_ed_rev.extend(4);
  dbms_output.put_line('r_ed_rev.count = ' || r_ed_rev.count);
  for q in r_ed.first..r_ed.last loop
    dbms_output.put_line('---');
    r_ed_rev(r_ed_rev.last - q + 1) := r_ed(q);
    dbms_output.put_line('r_ed_rev(' || q || ') = ' || r_ed_rev(q));
  end loop;
  
  dbms_output.put_line('r_ed_rev.1 = ' || r_ed_rev(1));
  dbms_output.put_line('r_ed_rev.2 = ' || r_ed_rev(2));
  dbms_output.put_line('r_ed_rev.3 = ' || r_ed_rev(3));
  dbms_output.put_line('r_ed_rev.4 = ' || r_ed_rev(4));
end;

/*
3. ассоциативный массив
  индекс может быть строкой или целым числом
  коллекция хранится не последовательно
  нет ограничения по количеству элементов
  индексы могут быть отрицательные
  не нужно инициализировать перед работой
  нельзя использовать bulk collect так как нижний индекс должен быть задан явно для каждой записи коллекции
  
  когда использовать:
  когда значем что колекция не большая
  
  когда не нужно использовать:
  когда коллекция должна храниться в таблице баз данных
  когда нужно будет проверить равенство
  когда нужно делать проверку на множества
*/

declare
  type ed_ass_mass is table of number /*string*/ index by pls_integer; /*string*/
  r_ed_coll ed_ass_mass := ed_ass_mass(11,22,33,44);
begin
  
  for q in r_ed_coll.first..r_ed_coll.last loop
    dbms_output.put_line('r_ed_coll(' || q || ') = ' || r_ed_coll(q));
  end loop;
end;
--
declare
  type ed_ass_mass is table of number /*string*/ index by pls_integer; /*string*/
  r_ed_coll ed_ass_mass := ed_ass_mass(11, 22, 33, 44);
  r_ed_coll2 ed_ass_mass;
begin
  dbms_output.put_line('ass_arr');
  r_ed_coll2(1) := null;
  r_ed_coll2(2) := null;
  r_ed_coll2(3) := null;
  r_ed_coll2(4) := null;
  dbms_output.put_line('r_ed_coll2.count = ' || r_ed_coll2.count);
  for q in r_ed_coll.first..r_ed_coll.last loop
    r_ed_coll2(r_ed_coll2.last - q + 1) := r_ed_coll(q);
    dbms_output.put_line('r_ed_coll2(' || q || ') = ' || r_ed_coll2(q));
  end loop;
  dbms_output.put_line('r_ed_coll2.1 = ' || r_ed_coll2(1));
  dbms_output.put_line('r_ed_coll2.2 = ' || r_ed_coll2(2));
  dbms_output.put_line('r_ed_coll2.3 = ' || r_ed_coll2(3));
  dbms_output.put_line('r_ed_coll2.4 = ' || r_ed_coll2(4));
end;
--
declare
    type nt_type is table of number;
    nt nt_type := nt_type(18, 22, 36, 45, 54, 63);
begin
    dbms_output.put_line('nt.count = ' || nt.count);
    for i in nt.first..nt.last loop
        dbms_output.put_line('nt(' || i || ') = ' || nt(i));
        dbms_output.put_line('----');
        dbms_output.put_line('nt.next(' || i || ') = ' || nt.next(i));
        dbms_output.put_line('----');
    end loop;

    nt.delete(5);
    dbms_output.put_line('nt.count = ' || nt.count);

    for i in nt.first..nt.last loop
      if nt.exists(i) then
         dbms_output.put_line('nt('||i||') = ' || nt(i));
      else
        dbms_output.put_line('nt('||i||') does not exist');
      end if;
    end loop;

    nt.trim(1);
    dbms_output.put_line('nt.count = ' || nt.count);

    for i in nt.first..nt.last loop
      if nt.exists(i) then
         dbms_output.put_line('nt('||i||') = ' || nt(i));
      else
        dbms_output.put_line('nt('||i||') does not exist');
      end if;
    end loop;
end;
/

-----------------

declare
  type ed_n_t is table of number; --varchar2
  r_ed ed_n_t:= ed_n_t(11, 22, 33, 44);
  r_ed_rev ed_n_t:= ed_n_t();
  q number := 1;
begin
  dbms_output.put_line('nest_table');
  r_ed_rev.extend(4);

  while r_ed.exists(q) loop
    dbms_output.put_line('r_ed(' || q || ') = ' || r_ed(q));
    r_ed_rev(r_ed_rev.last - q + 1) := r_ed(q);
    q := q + 1;
  end loop;

  for qq in r_ed_rev.first..r_ed_rev.last loop
     dbms_output.put_line('r_ed_rev(' || qq || ') = ' || r_ed_rev(qq));
  end  loop;
end;
