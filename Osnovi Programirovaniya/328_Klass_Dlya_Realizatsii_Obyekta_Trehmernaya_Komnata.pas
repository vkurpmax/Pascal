program ex;
uses Room;
Type TVRoom=object(TRoom)
  height:real;  {поле для хранения высоты}
  function V:real;  {метод определения объема}
  procedure NewInit(l,w,h:real);  {инициализирующий метод}
end;
Procedure TVRoom.NewInit;
begin
  Init(l,w);  {инициализируем наследуемые поля класса}
  height:=h;  {инициализируем собственное поле класса}
end;
Function TVRoom.V;
begin
  V:=Square*height;  {обращаемся к методу базового класса}
end;
var A:TVRoom;

begin
  A.NewInit(3,4,5.1,2.8);
  writeln('Plotshad komnati = ',A.Square:6:2);
  writeln('Obyom komnati = ',A.V:6:2);
  readln;
end.
