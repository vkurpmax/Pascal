program ex;
Type TRoom=object
  length,width:real;  {поля: длина и ширина комнаты}
  function Square:real;  {метод определения площади}
  end;
Function TRoom.Square:real;  {тело метода определения площади}
begin
  Square:=length*width;
end;
const
  A:TRoom=(length:3.5; width:5.1);  {добавляем константу}

begin
  writeln('Plotshad komnati ravna ',A.Square);
  readln;
end.
