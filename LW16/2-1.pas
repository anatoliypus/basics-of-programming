PROGRAM PaulRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;

PROCEDURE CheckSea(W1, W2, W3: CHAR; VAR Sea: BOOLEAN);
BEGIN 
  Sea := ((W1 = 'S') OR (W1 = 's')) AND ((W2 = 'E') OR (W2 = 'e')) AND ((W3 = 'A') OR (W3 = 'a'))
END;

PROCEDURE CheckLand(W1, W2, W3: CHAR; VAR Land: BOOLEAN);
BEGIN 
  Land := ((W1 = 'L') OR (W1 = 'l')) AND ((W2 = 'A') OR (W2 = 'a')) AND ((W3 = 'N') OR (W3 = 'n')) AND ((W4 = 'D') OR (W4 = 'd'))
END;

PROCEDURE Move(VAR W1, W2, W3, W4: CHAR);
BEGIN 
  W1 := W2;
  W2 := W3;
  W3 := W4;
  READ(W4)
END;

PROCEDURE Initialize(VAR W1, W2, W3, W4: CHAR; VAR Looking, Land, Sea: BOOLEAN);
BEGIN 
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE;
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
END;

BEGIN
  Initialize(W1, W2, W3, W4, Looking, Land, Sea);
  WHILE Looking AND NOT (Land OR Sea)
  DO
    BEGIN
      Looking := NOT EOLN;
      Move(W1, W2, W3, W4);
      CheckLand(W1, W2, W3, Land);
      CheckSea(W1, W2, W3, Sea)
    END;
  WRITELN('Land - ', Land, ' Sea - ', Sea, ' Looking - ', Looking)
END.
