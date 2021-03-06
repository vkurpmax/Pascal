unit RoomMod;

{$mode objfpc}{$H+}

interface
  Type
    TRoomD=Object
      length,width:real;  {поля и ширина комнаты}
      function Square:real; virtual;  {метод определения площади}
      constructor Init(l,w:real);  {конструктор}
    end;
    Type TVRoomD=object(TRoomD)
      height:real;  {дополнительное поле класса}
      function Square:real; virtual;  {виртуальный полиморфный метод}
      constructor Init(l,w,h:real);  {конструктор}
    end;



implementation
Function TRoomD.Square:real;  {тело метода определения площади}
begin
  Square:=length*width;
end;
Constructor TRoomD.Init(l,w:real);  {тело конструктора}
begin
  length:=l;
  width:=w;
end;
constructor TVRoomD.Init(l,w,h:real);
begin
  inherited Init(l,w);  {инициализирует поля базового класса}
  height:=h;  {инициализируем собственное поле класса}
end;
Function TVRoomD.Square:real;
begin
  Square:=inherited Square+2*height*(length+width);
end;
end.
