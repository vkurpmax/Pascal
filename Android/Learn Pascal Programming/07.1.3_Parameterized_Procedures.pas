program Lesson7_Program2;
uses crt;

procedure DrawLine(x:integer; y:integer);
{the declaration of the variables in brackets are called parameters}
var counter:integer; {normally this is called a local variable}
begin
  gotoxy(x,y); {here I use the arguments of x and y}
  textcolor(green);
  for counter:=1 to 10 do
  begin
    write(chr(196));
  end;
end;

begin
  drawline(10,5);
  drawline(10,6);
  drawline(10,7);
  drawline(10,10);
  readkey;
end.
