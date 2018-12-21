program case1;
Type TRoomP=object
  length, width:real;  {поля: длина и ширина комнаты}
  function Square:real; virtual;  {метод определения площади}
  procedure Print;  {метод вывода результата на экран}
  constructor Init(l,w:real);  {коснтруктор}
end;
function TRoomP.Square:real;  {тело метода определения площади}
begin
  Square:=length*width;
end;
procedure TRoomP.Print;  {тело метода вывода результатов}
begin
  writeln('Plotshad= ',Square:6:2);  {теперь вызов метода
                                     происходит через ТВМ класса}
end;
Constructor TRoomP.Init(l,w:real);  {тело конструктора}
begin
  length:=l;
  width:=w;
end;
Type TVRoomP=object(TRoomP)
  height:real;  {дополнительное поле класса}
  function Square:real; virtual;  {виртуальный полиморфный метод}
  constructor Init(l,w,h:real);  {конструктор}
end;
Constructor TVRoomP.Init(l,w,h:real);
begin
  inherited Init(l,w);  {инициализируем поля базового класса}
  height:=h;  {инициализируем собственное поле класса}
end;
function TVRoomP.Square:real;
begin
  Square:=inherited Square+2*height*(length+width);
end;
var A:TRoomP; B:TVRoomP;  {объявляем объекты-переменные}

begin
  A.Init(3.5,5.1);  {конструируем объект А}
  A.Print;  {выведет "Площадь = 17.85"}
  B.Init(3.5,5.1,2.7);  {конструируем объект В}
  B.Print;  {выведе "Площадь = 94.64" - верно!!!}
  readln;
end.
