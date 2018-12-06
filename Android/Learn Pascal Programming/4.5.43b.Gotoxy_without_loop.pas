program lesson4_Program3b;
uses crt;
var counter:integer; {loop counter}

begin
  for counter:=1 to 5 do
  begin
    gotoxy(25,5+counter);
    writeln('I');
  end;

  for counter:=5 downto 1 do
  begin {an example of 'downto' instead of 'to', note the 'gotoxy(_,_)'}
    gotoxy(32,11-counter);
    writeln('I');
  end;

  for counter:=1 to 6 do
  begin
    gotoxy(25+counter,11);
    writeln('-');
  end;

  for counter:=6 downto 1 do
  begin
    gotoxy(32-counter,5);
    writeln('-');
  end;

  {--------------The Courner(+)--------------}
  gotoxy(25,5);
  writeln('+');
  gotoxy(25,11);
  writeln('+');
  gotoxy(32,5);
  writeln('+');
  gotoxy(32,11);
  writeln('+');
  gotoxy(45,7);
  writeln('+');

  writeln('Made with for loops :)');
  readln;
end.
