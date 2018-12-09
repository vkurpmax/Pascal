program Lesson7_Program1a;
uses crt;
var counter:integer;

begin
  textcolor(green);

  gotoxy(10,5);
  for counter:=1 to 10 do
  begin
    write(chr(196));
  end;

  gotoxy(10,6);
  for counter:=1 to 10 do
  begin
    write(chr(196));
  end;

  gotoxy(10,7);
  for counter:=1 to 10 do
  begin
    write(chr(196));
  end;

  gotoxy(10,10);
  for counter:=1 to 10 do
  begin
    write(chr(196));
  end;

  readkey;
end.
