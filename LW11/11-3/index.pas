PROGRAM WithoutLast(INPUT, OUTPUT);
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
          IF NOT EOLN
          THEN
            WRITE(Ch)
          ELSE
            WRITELN
        END;
        IF NOT EOF
        THEN
          READLN
    END;
END.
