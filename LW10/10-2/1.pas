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
              WHILE ((Ch <> ' ') AND (State <> 'F')) AND (Ch <> ';')
              DO
                BEGIN
                  WRITE(Ch);
                  IF NOT EOLN
                  THEN
                    READ(Ch)
                  ELSE
                    State := 'F'
                END;
              IF State <> 'F'
              THEN
                State := 'O'
            END
        END;

      IF State = ';'
      THEN
        BEGIN
          IF Ch = ';'
          THEN
            WRITE(Ch)
          ELSE
            IF (Ch <> ' ') AND (NOT EOLN)
            THEN
              State := 'O';
          IF EOLN
          THEN
            State := 'F'
        END;

      IF State = 'O'
      THEN
        BEGIN
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
                    WHILE (Ch = ' ') AND (NOT EOF AND NOT EOLN)
                    DO
                      READ(Ch);
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
                        IF Ch = 'E'
                        THEN
                          State := 'E'
                  END
            END
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
