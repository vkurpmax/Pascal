program ex;
Uses Room;  {подключаем модуль с описанием класса TRoom}
var A:TRoom;  {объявляем объект-переменную}

begin
  A.Init(3.5,5.1);  {инициализируем поля объекта}
  writeln('Komnata: dlina= ',A.length,'; shirina= ',A.width);
  writeln('Plotshad komnati= ',A.Square);
end.
