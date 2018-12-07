program Lesson7_Program1;
uses crt;

procedure DrawLine;
{This procedure helps me to avoid the rewriting the for loops}
var counter:integer;

begin
  textcolor(green);
  for counter:=1 to 10 do
  begin
    write(chr(196));
  end;
end;

begin
  gotoxy(10,5);
  drawline;
  gotoxy(10,6);
  drawline;
  gotoxy(10,7);
  drawline;
  gotoxy(10,10);
  drawline;
  readkey;
end.
