PROGRAM RCopyString(INPUT, OUTPUT);

PROCEDURE RCopy(VAR FileToCopy, DestFile: TEXT);
VAR 
  Ch: CHAR;
BEGIN 
  IF NOT EOLN(FileToCopy)
  THEN 
    BEGIN
      READ(FileToCopy, Ch);
      WRITE(DestFile, Ch);
      RCopy(FileToCopy, DestFile)
    END
END;

BEGIN 
  RCopy(INPUT, OUTPUT);
  WRITELN('#')
END.
