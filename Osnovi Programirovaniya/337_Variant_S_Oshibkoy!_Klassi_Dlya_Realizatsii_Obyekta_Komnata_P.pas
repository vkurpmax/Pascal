program ex;
Type TRoomP=object
  length, width:real;  {поля: длина и ширина комнаты}
  function Square:real;  {метод определения площади}
  procedure Print;  {метод вывода результата на экран}
  procedure Init(l,w:real);  {инициализирующий метод}
end;
Function TRoomP.Square:real;  {метод определения площади}
begin
  Square:=length*width;
end;
Procedure TRoomP.Print;  {метод вывода результатов}
begin
  writeln('Plotshad= ',Square:6:2);  {внутренный вызов метода}
end;
procedure TRoomP.Init(l,w:real);  {тело инициализирующего метода}
begin
  length:=l;
  width:=w;
end;
Type TVRoomP=object(TRoomP)
  height:real;  {дополнительное поле класса}
  function Square:real;  {переопределенный метод класса}
  procedure Init(l,w,h:real);  {переопределенный инициализирующий метод}
end;
procedure TVRoomP.Init(l,w,h:real);
begin
  inherited Init(l,w);  {инициализирует поля базового класса}
  height:=h;  {инициализируем собственное поле класса}
end;
Function TVRoomP.Square:real;
begin  {обращаемся к методу базового класса}
  Square:=inherited Square + 2*height*(length+width);
end;
var A:TRoomP;  B:TVRoomP;  {объявляем объекты-переменные}
begin
  A.Init(3.5,5.1);  {инициализируем поля объекта A}
  A.Print;  {выведет "Площадь = 17.85"}
  B.Init(3.5,5.1,2.7);  {инициализируем поля объекта B}
  B.Print;  {выведет "Площадь = 17.85" - ошибка!!!}
  readln;
end.
