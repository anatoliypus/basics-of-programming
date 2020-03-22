PROGRAM Sorting(INPUT, OUTPUT);
{Процедура CopyFile копирует из одного
 файла в другой}
PROCEDURE CopyFile(VAR FileIn, FileOut: TEXT);
VAR
  Ch: CHAR;
BEGIN
  REWRITE(FileOut);
  RESET(FileIn);
  WHILE NOT EOLN(FileIn) AND NOT EOF(FileIn)
  DO
    BEGIN
      READ(FileIn, Ch);
      WRITE(FileOut, Ch)
    END;
  WRITELN(FileOut)
END;

{PROCEDURE Split(VAR F1, F2, F3: TEXT)
 Разбивает F1 на F2 и F3}
 PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
  {Копировать F1 попеременно в F2 и F3}
  Switch := '0';
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '0'
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '1'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '0'
        END
    END;
  WRITELN(F2);
  WRITELN(F3);
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Сливает F2, F3 в F1  в сортированном порядке}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch1);
  READ(F3, Ch2);
  WHILE NOT EOF(F2) AND NOT EOF(F3)
  DO
    BEGIN
      IF Ch1 < Ch2
      THEN
        BEGIN
          WRITE(F1, Ch1);
          READ(F2, Ch1);
        END
      ELSE
        BEGIN
          WRITE(F1, Ch2);
          READ(F3, Ch2);
        END
    END;

  {Копировать остаток F2 в F1}
  IF NOT EOLN(F2)
  THEN 
    BEGIN 
      WHILE NOT EOLN(F2)
      DO 
        BEGIN 
          READ(F2, Ch1);
          WRITE(F1, Ch1)
        END;
      WRITE(F1, Ch1)
    END;

  {Копировать остаток F3 в F1}
  IF NOT EOLN(F3)
  THEN 
    BEGIN 
      WHILE NOT EOLN(F3)
      DO 
        BEGIN 
          READ(F3, Ch1);
          WRITE(F1, Ch1)
        END;
      WRITE(F1, Ch1)
    END;
  WRITELN(F1, '#')
END; {Merge}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
BEGIN {RecursiveSort}
  REWRITE(F2);
  REWRITE(F3);
  RESET(F1);
  IF NOT EOLN(F1)
  THEN {Файл имеет как минимум 2 символа}
    BEGIN
      Split(F1, F2, F3);
      RecursiveSort(F2);
      RecursiveSort(F3);
      Merge(F1, F2, F3);
    END
END;   {RecursiveSort}


BEGIN
  RecursiveSort(INPUT)
END.
