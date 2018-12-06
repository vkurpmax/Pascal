program lesson4_Program1;
uses crt;
label 1; {this is used with a goto statement}
var sel: string;
  n1,n2,total:real;
  yn:char; {this is a character variable type, which holds single characters ONLY}


begin
  1:clrscr;
  total:=0; {always initialise interger/real variables}
  gotoxy(4,3);
  writeln('1.Addition');
  gotoxy(4,4);
  writeln('2.Subtraction');
  gotoxy(4,5);
  writeln('3.Exit');
  gotoxy(6,8);
  write('Select: ');
  sel:=readkey;

  if sel='1' {condition} then
  begin {more than one statement}
    clrscr;
    write('Input No.1:');
    readln(n1);
    write('Input No.2:');
    readln(n2);
    total:=n1+n2;
    writeln('Addition: ',N1:2:3,' + ',n2:2:3,' = ',total:2:3);
    write('Press any key to continue...');
    readkey;
    goto 1; {this returns execution back to the beginning of the program, otherwise the program terminates}
  end; {closing the if statement(begin)}

  if sel='2' then {note that the assignment statement is not used within an if statement}
  begin
    clrscr;
    write('Input No.1:');
    readln(N1);
    write('Input No.2:');
    readln(n2);
    total:=n1-n2;
    write('Substraction: ');
    write(n1:2:3,' - ',n2:2:3,' - ',total:2:3);
    write('Press any key to continue...');
    readkey;
    goto 1;
  end; {closing the if statement}

  if sel='3' then
  begin
    clrscr;
    write('Are you sure?(Y/N)');
    YN:=readkey;
    if YN='y' then halt; {1 statement, so no need of begin..End}
    if YN='n' then goto 1; {the goto statement is not recommended for frequent use}
  end;
end.
