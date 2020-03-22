PROGRAM TestRemove1(INPUT,OUTPUT); {Читает строку из входа ,пропускает ее через RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
BEGIN {TestRemove}
  EmptyQ;
  WRITE('Вход: ');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQ(Ch)
    END;
  WRITELN;
  WRITE('Выход: ');
  HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN
END. {TestRemove}