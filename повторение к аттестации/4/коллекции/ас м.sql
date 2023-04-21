/*
DECLARE
    TYPE aa_type_str IS TABLE OF INTEGER INDEX BY VARCHAR2(10);
    aa_str aa_type_str;
BEGIN
    aa_str('Z') := 26;
    aa_str('A') := 1;
    aa_str('K') := 11;
    aa_str('R') := 18;
    aa_str(1) := 20;

    DBMS_OUTPUT.PUT_LINE('Before deletions:');
    DBMS_OUTPUT.PUT_LINE('FIRST = ' || aa_str.FIRST);
    DBMS_OUTPUT.PUT_LINE('LAST = ' || aa_str.LAST);

    aa_str.DELETE(1);
    aa_str.DELETE('Z');

    DBMS_OUTPUT.PUT_LINE('After deletions:');
    DBMS_OUTPUT.PUT_LINE('FIRST = ' || aa_str.FIRST);
    DBMS_OUTPUT.PUT_LINE('LAST = ' || aa_str.LAST);
END;
*/

DECLARE
    TYPE aa_type_str IS TABLE OF INTEGER INDEX BY pls_integer;
    aa_str aa_type_str;
BEGIN
    aa_str('Z') := 26;
    aa_str('A') := 1;
    aa_str('K') := 11;
    aa_str('R') := 18;
    aa_str(1) := 20;

    DBMS_OUTPUT.PUT_LINE('Before deletions:');
    DBMS_OUTPUT.PUT_LINE('FIRST = ' || aa_str.FIRST);
    DBMS_OUTPUT.PUT_LINE('LAST = ' || aa_str.LAST);

    aa_str.DELETE(1);
    aa_str.DELETE('Z');

    DBMS_OUTPUT.PUT_LINE('After deletions:');
    DBMS_OUTPUT.PUT_LINE('FIRST = ' || aa_str.FIRST);
    DBMS_OUTPUT.PUT_LINE('LAST = ' || aa_str.LAST);
END;
