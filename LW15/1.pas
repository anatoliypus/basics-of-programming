PROGRAM ExtraBlanks(INPUT, OUTPUT);
  {Читает строку из входа ,пропускает ее через RemoveExtraBlanks}
USES 
  Queue;

VAR
  Ch: CHAR;
{PROCEDURE RemoveExtraBlanks;}
{Удаляет лишниe пробелы между словами на одной строке}

BEGIN {TestRemove}
  EmptyQ;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      AddQ(Ch);
    END;
  WRITELN;
  WRITELN('Вход:');
  WriteQ;
  WRITELN;
  {RemoveExtraBlanks;}
  WRITELN('Выход:');
  WriteQ;
  WRITELN 
END. {TestRemove}