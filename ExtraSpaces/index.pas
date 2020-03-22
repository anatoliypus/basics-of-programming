PROGRAM ExtraSpaces(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  State := 'B';
  WHILE NOT EOF AND (State <> 'F')
  DO
    BEGIN
      IF EOLN AND NOT EOF
      THEN
        BEGIN
          READLN;
          WRITELN('#');
          IF NOT EOLN
          THEN
            READ(Ch)
          ELSE
            State := 'F'
        END
      ELSE
        READ(Ch);

      IF State = 'B'
      THEN
        IF Ch <> ' '
        THEN
          State := 'O';

      IF State = ' '
      THEN
        IF Ch <> ' '
        THEN
          IF NOT EOLN
          THEN
            BEGIN
              State := 'O';
              IF NOT (Ch IN [':', ';', '.', ',', '?', '!'])
              THEN
                WRITE(' ')
            END;

      IF State = 'P'
      THEN
        IF Ch <> ' '
        THEN
          BEGIN
            IF NOT (Ch IN [':', ';', '.', ',', '?', '!'])
            THEN
              WRITE(' ');
            State := 'O'
          END;

      IF State = 'O'
      THEN
        BEGIN
          IF Ch IN [':', ';', '.', ',', '?', '!']
          THEN
            BEGIN
              WRITE(Ch);
              State := 'P'
            END
          ELSE
            IF Ch = ' '
            THEN
              State := ' '
            ELSE
              WRITE(Ch)
        END
    END
END.
