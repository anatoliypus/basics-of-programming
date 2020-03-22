PROGRAM PaulRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN
  Looking := 'Y';
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  WHILE (Looking = 'Y') AND NOT EOLN
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF (W1 = 'L') OR (W1 = 'l')
      THEN
        IF (W2 = 'A') OR (W2 = 'a')
        THEN
          IF (W3 = 'N') OR (W3 = 'n')
          THEN
            IF (W4 = 'D') OR (W4 = 'd')
            THEN
              Looking := 'L';
        IF Looking <> 'L'
        THEN
          IF (W2 = 'S') OR (W2 = 's')
          THEN
            IF (W3 = 'E') OR (W3 = 'e')
            THEN
              IF (W4 = 'A') OR (W4 = 'a')
              THEN
                Looking := 'S'
    END;
  WRITELN('Looking is ', Looking)
END.
