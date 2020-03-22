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
        IF Ch <> ' '
        THEN
          State := 'b';

      IF State = 'b'
      THEN
        IF (Ch <> 'N') AND (Ch <> 'n')
        THEN
          WRITE(Ch)
        ELSE
          BEGIN
            WRITE('N');
            IF NOT EOLN AND NOT EOF
            THEN
              BEGIN
                READ(Ch);
                State := 'O'
              END
            ELSE
              State := 'F'
          END;

      IF State = 'O'
      THEN
        IF Ch <> ' '
        THEN
          IF Ch = ';'
          THEN
            BEGIN
              State := ';';
              WRITE(';')
            END
          ELSE
            IF (Ch = 'E') OR (Ch = 'e')
            THEN
              State := 'E'
            ELSE
              BEGIN
                State := 'o';
                WRITELN;
                WRITE('  ')
              END;


      IF State = 'o'
      THEN
        BEGIN
          IF ((Ch <> '(') AND (Ch <> ';')) AND (Ch <> ' ')
          THEN
            WRITE(Ch)
          ELSE
            IF Ch = '('
            THEN
              State := '('
            ELSE
              IF Ch = ';'
              THEN
                State := ';'
              ELSE
                State := 'O'
        END;

      IF State = ';'
      THEN
        BEGIN
          IF Ch = ';'
          THEN
            WRITE(Ch)
          ELSE
            IF Ch <> ' '
            THEN
              State := 'O'
        END
    END;
  WRITELN
END.
