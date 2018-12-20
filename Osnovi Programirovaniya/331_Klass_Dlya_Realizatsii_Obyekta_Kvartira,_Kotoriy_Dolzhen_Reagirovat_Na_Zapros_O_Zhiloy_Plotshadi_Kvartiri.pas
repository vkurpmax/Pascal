program ex;
uses Room;  {модуль Room определен в параграфе 10.3}
Type TFlat=object  {описание класса}
  n:byte;  {количество комнат}
  rooms:array[1..15] of TRoom;  {массив объектов TRoom}
  function FlatSquare:real;  {метод определения площади}
  procedure Init(an:byte; var arooms);  {метод инициализации}
end;
procedure TFlat.Init;  {тело метода инициализации}
var a:array[1..15] of TRoom absolute arooms;  {переопределение типа
                      массива наложение - см. параграф 5.5}
  i:byte;

begin
  n:=an;  {инициализируем поле количества комнат}
  for i:=1 to n do {инициализируем объетные поля, вызывая метод
              инициализации TRoom для каждой комнаты
              и передавая ему размеры комнат}
  rooms[i].Init(a[i].length,a[i].width);
end;
Function TFlat.FlatSquare;  {тело метода определения площади}
var s:real;
  i:integer;
begin
  s:=0;
  for i:=1 to n do  {суммируем площади комнат}
    S:=S+rooms[i].Square;
  FlatSquare:=S;
end;
Cosnt mas:array[1..3] of TRoom=((length:2:5; width:3.75),
                         (length:2.85; width:4.1),
                         (length:2.3; width:2.8));
var F:TFlat;  {объявляем объект-переменную}
begin
  F.Init(3,mas);  {инициалмзируем объект}
  writeln('Plotshad kvartiri= ',F.FlatSquare);  {определяем площадь}
end.
