PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Arr: ARRAY [1..10] OF INTEGER;
  I, HelpData: INTEGER;
  Sorted: CHAR;
BEGIN
  FOR I := 1 TO 10
  DO
    READLN(Arr[I]);
  Sorted := 'N';
  WRITE('Your data: ');
  FOR I := 1 TO 10
  DO
    WRITE(Arr[I]);
  WRITELN;
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      FOR I := 1 TO 10
      DO
        IF Arr [I] > Arr [I + 1]
        THEN
          BEGIN
            Sorted := 'N';
            HelpData := Arr[I];
            Arr[I] := Arr[I + 1];
            Arr[I + 1] := HelpData
          END
    END;
  WRITE('Sorted data: ');
  FOR I := 1 TO 10
  DO
    WRITE(Arr[I]);
  WRITELN
END.
