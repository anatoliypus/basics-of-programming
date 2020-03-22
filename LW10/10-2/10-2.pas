PROGRAM Formatting(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  State := 'B';
  WHILE (NOT EOF AND NOT EOLN) AND (State <> 'F')
  DO
    BEGIN
      READ(Ch);
      IF State = 'B'
      THEN
        BEGIN
          IF (Ch = 'B') OR (Ch = 'b')
          THEN
            BEGIN
              WHILE ((Ch <> ' ') AND (State <> 'F')) AND ((Ch <> 'n') AND (Ch <> 'N'))
              DO
                BEGIN
                  WRITE(Ch);
                  IF NOT EOLN
                  THEN
                    READ(Ch)
                  ELSE
                    State := 'F'
                END;
              WRITE(Ch);
              IF NOT EOLN
              THEN
                READ(Ch)
              ELSE
                State := 'F';
              IF State <> 'F'
              THEN
                State := 'O'
            END
        END;

      IF State = 'O'
      THEN
        BEGIN
          IF (Ch = 'E') OR (Ch = 'e')
          THEN
            State := 'E'
          ELSE
            IF Ch = ';'
            THEN
              BEGIN
                WRITE(';');
                State := ';'
              END
            ELSE
              IF Ch = '('
              THEN
                State := '('
              ELSE
                IF Ch <> ' '
                THEN
                  BEGIN
                    IF Ch = ';'
                    THEN
                      BEGIN
                        WRITELN;
                        WRITE('  ;');
                        State := ';'
                      END
                    ELSE
                      IF (Ch = 'E') OR (Ch = 'e')
                      THEN
                        State := 'E'
                      ELSE
                        BEGIN
                          WRITELN;
                          WRITE('  ');
                          WHILE (((Ch <> ' ') AND (Ch <> ';')) AND (Ch <> '(')) AND (State <> 'F')
                          DO
                            BEGIN
                              WRITE(Ch);
                              IF NOT EOLN
                              THEN
                                READ(Ch)
                              ELSE
                                State := 'F'
                            END;
                      END;
                  END
        END;

    IF State = ';'
    THEN
      State := 'O';
      WHILE (State = ';') AND (State <> 'F')
      DO
        BEGIN
          IF Ch = ';'
          THEN
            WRITE(Ch)
          ELSE
            IF Ch = ' '
            THEN
              IF NOT EOLN
              THEN
                READ(Ch)
              ELSE
                State := 'F'
            ELSE
              IF (Ch = 'E') OR (Ch = 'e')
              THEN
                State := 'E'
              ELSE
                State := 'O';
          IF NOT EOLN
          THEN
            READ(Ch)
          ELSE
            State := 'F'
        END;

      IF State = '('
      THEN
        BEGIN
          WHILE (Ch <> ')') AND (State <> 'F')
          DO
            BEGIN
              IF Ch <> ' '
              THEN
                IF Ch = ','
                THEN
                  WRITE(', ')
                ELSE
                  WRITE(Ch);
              IF NOT EOLN
              THEN
                READ(Ch)
              ELSE
                State := 'F'
            END;
          IF State <> 'F'
          THEN
            BEGIN
              WRITE(')');
              State := ';'
            END
        END;

      IF State = 'E'
      THEN
        BEGIN
          WRITELN;
          WHILE ((Ch <> ' ') AND (Ch <> '.')) AND (State <> 'F')
          DO
            BEGIN
              WRITE(Ch);
              IF NOT EOLN
              THEN
                READ(Ch)
              ELSE
                State := 'F'
            END;
          IF Ch = ' '
          THEN
            State := '.';
          IF Ch = '.'
          THEN
            BEGIN
              WRITE('.');
              State := 'F'
            END
        END;

      IF State = '.'
      THEN
        BEGIN
          WHILE (Ch <> '.') AND (State <> 'F')
          DO
            IF NOT EOLN
            THEN
              READ(Ch)
            ELSE
              State := 'F';
          IF State <> 'F'
          THEN
            BEGIN
              WRITE('.');
              State := 'F'
            END
        END
    END;
  WRITELN
END.
