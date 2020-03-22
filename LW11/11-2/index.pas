PROGRAM Last(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          READ(Ch);
          IF EOLN
          THEN
            WRITELN(Ch, '#')
        END;
      IF NOT EOF
      THEN
        READLN
    END
END.
