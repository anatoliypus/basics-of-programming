PROGRAM ExtraSpaces(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOF AND NOT EOLN
  THEN
    BEGIN
      READ(Ch);
      WHILE ((Ch = ' ') AND NOT EOLN) AND NOT EOF
      DO
        READ(Ch);
    END;
  WHILE NOT EOLN AND NOT EOF
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        WRITE(Ch)
      ELSE
        BEGIN
          WHILE (Ch = ' ') AND NOT EOLN
          DO
            READ(Ch);
          IF NOT EOLN
          THEN
            WRITE(' ', Ch)
        END;
      READ(Ch)
    END;
  WRITELN('#');
END.
