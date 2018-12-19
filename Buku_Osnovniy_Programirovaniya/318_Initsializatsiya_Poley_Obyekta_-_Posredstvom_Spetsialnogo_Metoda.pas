program ex;
Type TRoom=object
  length, width:real; {поля: длина и ширина комнаты}
  function Square:real;  {метод определения площади}
  Procedure Init(l,w:real);  {инициализирующий метод}
  end;
{метод определения площади}
Function TRoom.Square:real;
Begin
  Square:=length*width;
end;
{инициализирующий метод}
Procedure TRoom.Init;
begin
  length:=l;
  width:=w;
end;
var A:TRoom;  {объявляем объект-переменную}
{основная программа}

begin
  A.Init(3.5,5.1);  {инициализируем поля объекта}
  writeln('Plotshad komnati ravna ',A.Square);
  readln;
end.
