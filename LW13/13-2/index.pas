PROGRAM LexicalComparing(INPUT, OUPUT);
VAR 
  Ch: CHAR;
  F1, F2: TEXT;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '2'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '1'
    END; 
  IF ((Result = '0') AND NOT EOLN(F1)) AND EOLN(F2)
  THEN 
    Result := '2';
  IF ((Result = '0') AND EOLN(F1)) AND NOT EOLN(F2)
  THEN 
    Result := '1';
END; {Lexico}

PROCEDURE ReadFiles;
BEGIN
  REWRITE(F1);
  REWRITE(F2);
  WHILE NOT EOLN AND (Ch <> ' ')
    DO 
      BEGIN 
        READ(Ch);
        IF Ch <> ' '
        THEN 
          WRITE(F1, Ch);
      END;
    WHILE NOT EOLN 
    DO 
      BEGIN 
        READ(Ch);
        WRITE(F2, Ch)
      END;
  WRITELN(F1);
  WRITELN(F2)
END;

BEGIN
  ASSIGN(F1, 'assign/1.txt');
  ASSIGN(F2, 'assign/2.txt');
  ReadFiles;
  Lexico(F1, F2, Ch);
  IF Ch = '0'
  THEN 
    WRITELN('The words are equal')
  ELSE IF Ch = '2'
  THEN 
    WRITELN('Word 1 is more than word 2')
  ELSE 
    WRITELN('Word 1 is less than word 2')
END.