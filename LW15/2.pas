PROGRAM ExtraBlanks(INPUT, OUTPUT);
  {Читает строку из входа ,пропускает ее через RemoveExtraBlanks}
USES 
  Queue;

VAR
  Ch: CHAR;

PROCEDURE RemoveExtraBlanks;
{Удаляет лишниe пробелы между словами на одной строке}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd :='$';
  AddQ(LineEnd); {помечаем конец текста в очереди}
  HeadQ(Ch);
  WHILE Ch = Blank
  DO
    BEGIN
      DelQ;
      HeadQ(Ch)
    END;
  {удаляем пробелы}
  WHILE Ch <> LineEnd
  DO
    BEGIN
      {читаем слово}
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
       DO
         BEGIN
           AddQ(Ch);
           DelQ;
           HeadQ(Ch)
         END;
      {удаляем пробелы}
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END;
      {Вставляем пробел между словами}
      IF Ch <> LineEnd
       THEN
         AddQ(Blank)
    END;
  DelQ {удаяем LineEnd из очереди}
END; {RemoveExtraBlanks}


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
  RemoveExtraBlanks;
  WRITELN('Выход:');
  WriteQ
END. {TestRemove}