PROGRAM Reverse(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  F1Path: STRING;
  F1, F2: TEXT;
BEGIN
  F1Path := '1.txt';
  ASSIGN(F1, F1Path);
  ASSIGN(F2, '');
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  RESET(F2);
  WHILE NOT EOLN(F2)
  DO
    BEGIN
      READ(F2, Ch);
      WRITE(Ch)
    END;
END.
