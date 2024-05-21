PROGRAM Formating(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3, Ch4, Ch5: CHAR;
  FlagBegin, FlagEOLN, FlagStaple, FlagEnd: CHAR;
BEGIN
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch1);
      READ(Ch2);
      READ(Ch3);
      READ(Ch4);
      READ(Ch5)              
    END;
  FlagBegin := '0';
  FlagEOLN := '0';
  FlagStaple := '0';
  FlagEnd := '0';
  WHILE NOT EOLN
  DO
    BEGIN
      IF (Ch1 = 'B') AND (Ch2 = 'E') AND (Ch3 = 'G') AND
         (Ch4 = 'I') AND (Ch5 = 'N')
      THEN
        BEGIN
          WRITELN('BEGIN');
          FlagBegin := '1'
        END;
      WHILE FlagBegin = '1'
      DO
        BEGIN
          WRITE('  ');
          FlagEOLN := '0';
          WHILE FlagEOLN = '0'
          DO
            BEGIN
              IF NOT ((Ch2 = ')') AND (Ch3 = ' ')) AND (Ch4 = ';') AND
                 (Ch5 <> ';') AND (Ch5 <> ' ') OR
                 NOT ((Ch1 = ')') AND (Ch2 = ' ')) AND (Ch3 = ';') AND
                 (Ch4 = ' ') AND (Ch5 <> ';') AND (Ch5 <> ' ')
              THEN
                WRITE(Ch5);
              Ch1 := Ch2;
              Ch2 := Ch3;
              Ch3 := Ch4;
              Ch4 := Ch5;
              READ(Ch5);              
              IF ((Ch1 = 'L') AND (Ch2 = 'N') AND (Ch3 = ' ') AND
                 (Ch4 = ' ') AND (Ch5 = ' ') OR (Ch4 = ')') AND (Ch5 <> ';') OR
                 (Ch4 = ';') AND (Ch5 <> ';') AND (Ch5 <> ' ') OR 
                 (Ch4 = ' ') AND (Ch5 = 'E') OR EOLN OR (Ch5 = '.')) AND
                 ((FlagStaple = '0') OR EOLN)   
              THEN
                FlagEOLN := '1' 
              ELSE
                IF NOT ((Ch1 = ')') AND (Ch2 = ' ')) AND (Ch3 = ';') AND
                   (Ch4 = ' ') AND (Ch5 <> ';') AND
                   ((FlagStaple = '0') OR EOLN)
                THEN
                  FlagEOLN := '1' 
                ELSE
                  IF Ch5 <> ' '
                  THEN
                    WRITE(Ch5);     
              IF Ch5 = ','
              THEN
                WRITE(' ');
              IF Ch5 = '('
              THEN
                FlagStaple := '1';
              IF Ch5 = ')'
              THEN
                FlagStaple := '0'             
            END;
          IF NOT ((Ch1 = ')') AND (Ch2 = ' ') AND (Ch3 = ';'))
          THEN
            WRITELN;
          IF ((Ch1 = 'L') AND (Ch2 = 'N') AND (Ch3 = ' ') AND
             (Ch4 = ' ') AND (Ch5 = ' ') OR
             (Ch4 = ')') AND (Ch5 <> ';') OR
             (Ch4 = ' ') AND (Ch5 = 'E') OR 
             (Ch4 = ';') AND (Ch5 = 'E') OR EOLN OR (Ch5 = '.')) AND
             ((FlagStaple = '0') OR EOLN)
          THEN
            FlagBegin := '0';
          IF FlagStaple = '1'
          THEN
            WRITE('END.') 
        END;  
      Ch1 := Ch2;
      Ch2 := Ch3;
      Ch3 := Ch4;
      Ch4 := Ch5;
      READ(Ch5);
      IF (Ch5 = ';') AND (FlagEnd = '0')
      THEN
        BEGIN
          FlagBegin := '1';
          WRITELN('  ;')
        END;
      IF (Ch5 = '(') AND (FlagEnd = '0')
      THEN
        BEGIN
          FlagBegin := '1';
          WRITE('(')
        END;  
      IF (Ch2 = 'E') AND (Ch3 = 'N') AND (Ch4 = 'D') AND ((Ch5 = ' ') OR 
         (Ch5 = '.'))
      THEN
        WRITE('END.');
      IF (Ch5 = '.') AND (FlagStaple = '0')
      THEN
        FlagEnd := '1'       
    END  
END.    
