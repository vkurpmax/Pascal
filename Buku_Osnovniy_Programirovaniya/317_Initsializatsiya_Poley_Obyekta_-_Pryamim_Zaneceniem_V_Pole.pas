program ex;
Type TRoom=object
  length, width:real;  {поля: длина и ширина комнаты}
  function Square:real;  {метод определения площади}
  end;
Function TRoom.Square:real;  {тело метода определения площади}
begin
  Square:=length*width;
end;
var A:TRoom;  {объявляем объект-переменную}

begin
  A.length:=3.5;  {инициализируем поля объекта}
  A.width:=5.1;
  writeln('Plotshad komnati ravna ',A.Square);
  readln;
end.
