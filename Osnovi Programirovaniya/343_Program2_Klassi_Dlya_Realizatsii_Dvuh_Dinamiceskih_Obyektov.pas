program case3;
uses RoomMod;
procedure Print(var R:TRoomD);  {процедура с полиморфным объектом}
begin
  writeln('Plotshad= ',R.Square:6:2);
end;
var A:TRoomD;  B:TVRoomD;  {объявляем объекты-переменные}

begin
  A.Init(3.5,5.1);  {конструируем объект A}
  B.Init(3.5,5.1,2.7);  {конструируем объект B}
  Print(A);  {выведет "Площадь= 17.85"}
  Print(B);  {выведет "Площадь= 94.64"}
  readln;
end.
