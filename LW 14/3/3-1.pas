PROGRAM Sorting(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;

PROCEDURE CopyFile(VAR FileIn, FileOut: TEXT);
VAR
  Ch: CHAR;
BEGIN
  REWRITE(FileOut);
  RESET(FileIn);
  WHILE NOT EOLN(FileIn) AND NOT EOF(FileIn)
  DO
    BEGIN
      READ(FileIn, Ch);
      WRITE(FileOut, Ch)
    END;
  WRITELN(FileOut)
END;

{PROCEDURE Split(VAR F1, F2, F3: TEXT)
 ????????? F1 ?? F2 ? F3}
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{????????? F1 ?? F2, F3}
VAR
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {?????????? F1 ??????????? ? F2 ? F3}
  {?????????? F1 ??????????? ? F2 ? F3}
  Switch := '0';
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '0'
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '1'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '0'
        END
    END;
  WRITELN(F2);
  WRITELN(F3);
END; {Split}

{PROCEDURE Merge(VAR F1, F2, F3: TEXT)
 ??????? F2 ? F3 ? F1}


BEGIN
  ASSIGN(F1, 'assign/1.txt');
  ASSIGN(F2, 'assign/2.txt');
  Split(INPUT, F1, F2);
  CopyFile(F1, OUTPUT);
  CopyFile(F2, OUTPUT);
END.
