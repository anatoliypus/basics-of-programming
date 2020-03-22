PROGRAM Split(INPUT,OUTPUT);
  {Копирует INPUT в OUTPUT,сначала нечетные,а затем четные
   элементы}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;

PROCEDURE CopyOut(VAR F1: TEXT);
VAR 
  Ch: CHAR;
BEGIN
  {Копируем F1 в OUTPUT}
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO 
    BEGIN 
      READ(F1, Ch);
      WRITE(Ch)
    END
END;

BEGIN
  ASSIGN(Odds, 'assign/1.txt');
  ASSIGN(Evens, 'assign/2.txt');
  {Разделяет INPUT в Odds и Evens}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN 
          IF Next = '0' 
          THEN 
            BEGIN 
              READ(Ch);
              WRITE(Evens, Ch);
              Next := '1'
            END 
          ELSE 
            BEGIN 
              READ(Ch);
              WRITE(Odds, Ch);
              Next := '0'
            END 
        END;
      READLN;
      WRITELN(Odds);
      WRITELN(Evens)
    END;
  WRITELN(Odds);
  WRITELN(Evens);
  CopyOut(Odds);
  CopyOut(Evens);
  WRITELN('#')
END.