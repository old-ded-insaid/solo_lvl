/*Набор пар ключ-значение

Данные хранятся в отсортированном по ключу порядке

Не поддерживает DML-операции (не может участвовать в селектах, не может храниться в таблицах)

При объявлении как константа должен быть сразу инициализирован функцией

Порядок элементов в ассоциативном массиве с строковым индексом зависит от параметров NLS_SORT и NLS_COMP

Нельзя объявить тип на уровне схемы, но можно в пакете

Не имеет конструктора

Индекс не может принимать значение null (но допускает пустую строку — подробности и ссылка на пример в первом комментарии)

Datatype – это любой тип данных, кроме ref cursor

Используются для:
Для помещения в память небольших таблиц-справочников
Для передачи в качестве параметра коллекции

*/
declare
 type ass_mass is table of number index by pls_integer;
 ass1 ass_mass := ass_mass(1,2,3);
 ass2 ass_mass := ass_mass(3,2,1);
 ass3 ass_mass := ass_mass(2,1,3,4);
begin
  for i in ass1.first..ass1.last
    loop
      dbms_output.put_line(ass1(i));
   end loop;
  ass1.delete(3);--удаляет значение но не освобождает память
    for i in ass1.first..ass1.last
    loop
      dbms_output.put_line(ass1(i));
   end loop;
  --ass1.TRIM(3); не работает тут
  --ass1.extend(3); не работает тут
  ass1(3) := 33;
    for i in ass1.first..ass1.last
    loop
      dbms_output.put_line(ass1(i));
   end loop;
   dbms_output.put_line(ass1.count || ' count');
   dbms_output.put_line(ass1.LIMIT || ' LIMIT -  вложеная таблица и асс по null');
   dbms_output.put_line(ass1.prior(2) || ' prior предыдущий номер массива');
   dbms_output.put_line(ass1.next(2) || ' next следующий номер массива');
end;
/
begin
  dbms_output.put_line('-----');
end;
/
declare
  type ass_mass is table of number index by varchar2(100);
  ass1 ass_mass;
  i varchar2(100);
begin
  ass1('qw') := 11;
  ass1('we') := 22;
  ass1('er') := 33;
  
  /*for i in ass1.first..ass1.last
    loop
       dbms_output.put_line(ass1(i) /*|| ' ' || i);
    end loop;*/
  --ass1.delete(2);
   /* for i in ass1.first..ass1.last
    loop
       dbms_output.put_line(ass1(i));
    end loop;*/
    i := ass1.first;
    while i is not null loop
      dbms_output.put_line(ass1(i) || ' ' || i);
      i := ass1.next(i);
      end loop;
exception
  when no_data_found then
    dbms_output.put_line('нет элемента массива');
end;
/
/*
DECLARE
  -- Ассоциативный массив, индексированный строкой:
  
  TYPE population IS TABLE OF NUMBER  -- Тип ассоциативного массива
    INDEX BY VARCHAR2(64);            --  индексированный по строке
  
  city_population  population;        -- переменная ассоциативного массива
  i  VARCHAR2(64);                    -- Скалярная переменная
  
BEGIN
  -- Добавление элементов (пары ключ-значение) в ассоциативный массив: 
  city_population('Деревня')   := 2000;
  city_population('Райцентр')  := 750000;
  city_population('Мегаполис') := 1000000;
 
-- Изменим значение, связанное с ключом «Деревня»: 
  city_population('Деревня')  := 2001;
 
  -- Печатать ассоциативный массив:
 
  i := city_population.FIRST;  -- Получим первый элемент массива
 
  WHILE i IS NOT NULL LOOP
    DBMS_Output.PUT_LINE
      ('Население ' || i || ' равно ' || city_population(i)||' жителей');
    i := city_population.NEXT(i);  -- Получим следующий элемент массива
  END LOOP;
END;*/
/
declare
  type assss is table of number index by varchar2(100);
  ass assss;
  i varchar2(200);
begin
  ass('том') := 100;
  ass('джерри') := 200;
  ass('бутч') := 300;
  i := ass.first;
  while i is not null 
    loop
      dbms_output.put_line(i || ' имеет ' || ass(i));
      i := ass.next(i);
    end loop;
 end;
