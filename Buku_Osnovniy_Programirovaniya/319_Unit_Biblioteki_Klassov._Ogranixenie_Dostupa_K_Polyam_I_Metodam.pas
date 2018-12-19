unit Room;

{$mode objfpc}{$H+}

interface
Type TRoom=object;
  length,width:real;  {поля: длина и ширина комнаты}
  function Square:real;  {метод определения площади}
  procedure Init(l,w:real);  {инициализирующий метод}
  end;


implementation
Function TRoom.Square; {метод определения площади}
begin
  Square:=length*width;
end;
Procedure TRoom.Init;  {инициализирующий метод}
begin
  length:=l;
  width:=w;
end;
end.
