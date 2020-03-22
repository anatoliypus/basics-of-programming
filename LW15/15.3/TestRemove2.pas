PROGRAM TestRemove2(INPUT, OUTPUT);
USES Queue;
VAR
  Ch: CHAR;

PROCEDURE RemoveBlanks(VAR Ch: CHAR; Blank: CHAR);
BEGIN 
  WHILE Ch = Blank
  DO
    BEGIN
      DelQ;
      HeadQ(Ch)
    END
END;

PROCEDURE RemoveExtraBlanks;
{Удаляет лишниe пробелы между словами на одной строке}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd :='$';
  AddQ(LineEnd); {помечаем конец текста в очереди}
  HeadQ(Ch);
  {удаляем пробелы}
  RemoveBlanks(Ch, Blank);
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
      RemoveBlanks(Ch, Blank);
      {Вставляем пробел между словами}
    END;
  DelQ {удаяем LineEnd из очереди}
END; {RemoveExtraBlanks}

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
  RemoveExtraBlanks;
  WRITE('Выход: ');
  HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN('#')
END. {TestRemove}