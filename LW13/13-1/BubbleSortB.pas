PROGRAM BubbleSort(INPUT, OUTPUT);
VAR 
  FileToSort, HelpFile: TEXT;
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

PROCEDURE BubbleStep(VAR FileToSort, HelpFile: TEXT; VAR Sorted: CHAR);
VAR 
  Ch1, Ch2: CHAR;
BEGIN 
  RESET(FileToSort);
  REWRITE(HelpFile);
  IF NOT EOF(FileToSort) AND NOT EOLN(FileToSort)
  THEN 
    BEGIN 
      READ(FileToSort, Ch1);
      WHILE NOT EOLN(FileToSort) AND NOT EOF(FileToSort)
      DO 
        BEGIN 
          READ(FileToSort, Ch2);
          IF Ch1 < Ch2 
          THEN 
            BEGIN 
              WRITE(HelpFile, Ch1);
              Ch1 := Ch2
            END
          ELSE 
            BEGIN 
              Sorted := 'N';
              WRITE(HelpFile, Ch2)
            END
        END;
       WRITELN(HelpFile, Ch1)
     END
END;

BEGIN
  CopyFile(INPUT, FileToSort);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO 
    BEGIN
      { Копируем FileToSort в HelpFile, проверяя отсортированность
       и переставляя первые и соседние символы по порядку}
      BubbleStep(FileToSort, HelpFile, Sorted);
      { Копируем HelpFile в FileToSort }
      Sorted := 'Y'
    END;
  CopyFile(HelpFile, OUTPUT); 
  WRITELN('#')
END.
