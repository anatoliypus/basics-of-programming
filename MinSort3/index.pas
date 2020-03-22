PROGRAM MinSort3(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3, InputCorrect: CHAR;
BEGIN
  InputCorrect := '1';
  IF NOT EOLN
  THEN
    READ(Ch1)
  ELSE
    InputCorrect := '0';
  IF NOT EOLN
  THEN
    READ(Ch2)
  ELSE
    InputCorrect := '0';
  IF NOT EOLN
  THEN
    READ(Ch3)
  ELSE
    InputCorrect := '0';
  IF InputCorrect = '0'
  THEN
    WRITELN('Incorrect input data!')
  ELSE
    BEGIN
      WRITELN('Your input data: ', Ch1, Ch2, Ch3);
      WRITE('Sorted data: ');
      IF Ch1 < Ch2
      THEN
        IF Ch1 < Ch3
        THEN
          BEGIN
            WRITE(Ch1);
            Ch1 := Ch3
          END
        ELSE {Ch1 < Ch2; Ch1 >= Ch3 }
          WRITE(Ch3)
      ELSE {Ch1 >= Ch2}
        IF Ch2 < Ch3
        THEN
          BEGIN
            WRITE(Ch2);
            Ch2 := Ch3
          END
        ELSE {Ch1 >= Ch2; Ch2 >= Ch3}
          WRITE(Ch3);
      IF Ch1 > Ch2
      THEN
        WRITELN(Ch2, Ch1)
      ELSE
        WRITELN(Ch1, Ch2)
    END
END.
