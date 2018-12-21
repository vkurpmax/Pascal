program case2;
uses RoomMod;
var pA:^TRoomD;  {объявляем указатель на объекты класса}
  B:TVRoomD;  {объявляем объект класса}

begin
  B.Init(3.5,5.1,2.7);  {констрируем объект B}
  writeln('Plotshad= ',B.Square:6:2);  {выведет "Площадь= 94.64"}
  pA:=@B;  {присваиваем указатело базового класса адрес объекта
           производного класса}
  writeln('Plotshad= ',pA^.Square:6:2);  {выведет "Площадь= 94.64"}
  readln;
end.
