PROGRAM ReverseString(INPUT, OUTPUT);

PROCEDURE Reverse(VAR FileToReverse, DestFile: TEXT);
VAR 
  Ch: CHAR;
BEGIN 
  IF NOT EOLN(FileToReverse)
  THEN 
    BEGIN
      READ(FileToReverse, Ch);
      Reverse(FileToReverse, DestFile);
      WRITE(DestFile, Ch)
    END
END;

BEGIN 
  Reverse(INPUT, OUTPUT);
  WRITELN('#')
END.
