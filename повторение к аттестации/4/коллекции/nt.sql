DECLARE 
    TYPE nested_typ IS TABLE OF NUMBER; 
    nt1 nested_typ := nested_typ(1,2,3); 
    nt2 nested_typ := nested_typ(3,2,1); 
    nt3 nested_typ := nested_typ(2,3,1,3); 
    nt4 nested_typ := nested_typ(1,2,4); 
    answer nested_typ; 
BEGIN 
    answer := nt1 MULTISET UNION nt4;
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt1 MULTISET UNION nt4 = ' || answer(i));
    end loop;
    dbms_output.put_line('--');
    answer := nt1 MULTISET UNION nt3; 
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt1 MULTISET UNION nt3 = ' || answer(i));
    end loop;
    dbms_output.put_line('--');
    answer := nt1 MULTISET UNION DISTINCT nt3;
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt1 MULTISET UNION DISTINCT nt3 = ' || answer(i));
    end loop;
    dbms_output.put_line('--');
    answer := nt2 MULTISET INTERSECT nt3; 
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt2 MULTISET INTERSECT nt3 = ' || answer(i));
    end loop;
    dbms_output.put_line('--');
    answer := nt2 MULTISET INTERSECT DISTINCT nt3; 
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt2 MULTISET INTERSECT DISTINCT nt3 = ' || answer(i));
    end loop;
    dbms_output.put_line('--');
    answer := SET(nt3); 
    for i in answer.first..answer.last loop
      dbms_output.put_line('SET(nt3) = ' || answer(i));
    end loop;
    dbms_output.put_line('--');
    answer := nt3 MULTISET EXCEPT nt2; 
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt3 MULTISET EXCEPT nt2 = ' || answer(i));
    end loop;
    dbms_output.put_line('--');
    /*answer := nt3 MULTISET EXCEPT DISTINCT nt2; 
     dbms_output.put_line(answer.count);
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt3 MULTISET EXCEPT DISTINCT nt2 = ' || answer(i));
    end loop;*/
    
    answer := nt2 MULTISET EXCEPT DISTINCT nt4; 
     dbms_output.put_line(answer.count);
    for i in answer.first..answer.last loop
      dbms_output.put_line('nt2 MULTISET EXCEPT DISTINCT nt4 = ' || answer(i));
    end loop;
END;
