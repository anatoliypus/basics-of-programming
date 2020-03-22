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


BEGIN
  CopyFile(INPUT, FileToSort);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO 
    BEGIN
      { �������� FileToSort � F2, �������� �����������������
       � ����������� ������ � �������� ������� �� �������}
      { �������� HelpFile � FileToSort }
      Sorted := 'Y'
    END;
  CopyFile(FileToSort, OUTPUT); 
  WRITELN('#')
END.
