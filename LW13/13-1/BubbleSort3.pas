PROGRAM BubbleSort(INPUT, OUTPUT);
VAR 
  F1, F2: TEXT;
  Sorted: CHAR;
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
    END
END;

PROCEDURE BubbleStep(VAR F1, F2: TEXT);
VAR 
  Ch1, Ch2: CHAR;
BEGIN 
  RESET(F1);
  REWRITE(F2);
  IF NOT EOF(F1) AND NOT EOLN(F1)
  THEN 
    BEGIN 
      READ(F1, Ch1);
      WHILE NOT EOLN(F1) AND NOT EOF(F1)
      DO 
        BEGIN 
          READ(F1, Ch2);
          IF Ch1 < Ch2 
          THEN 
            BEGIN 
              WRITE(F2, Ch1);
              Ch1 := Ch2
            END
          ELSE 
            BEGIN 
              Sorted := 'N';
              WRITE(F2, Ch2)
            END
        END
     END;
  WRITELN(F2, Ch1)
END;

BEGIN
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO 
    BEGIN
      { Копируем F1 в F2, проверяя отсортированность
       и переставляя первые и соседние символы по порядку}
      BubbleStep(F1, F2);
      { Копируем F2 в F1 }
      Sorted := 'Y'
    END;
  CopyFile(F2, OUTPUT); 
  WRITELN('#')
END.
