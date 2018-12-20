program project1;
Uses Room;
Type TVRoom2=object(TRoom)
  height:real;  {дополнительное поле класса}
  function Square:real;  {переопределенный метод класса}
  procedure Init(l,w,h:real);  {переопределенный
                               инициализирующий метод}
end;
procedure TVRoom2.Init;
begin
  {инициализируем поля базового класса}
  inherited Init(l,w);  {или TRoom.Init(l,w)}
  height:=h;  {инициализируем собственное поле класса}
end;
function TVRoom2.Square;
begin
  square:=inherited Square+2*height*(length+widht);  {обращаемся
                    к переопределенному методу базового класса}
end;
var A:TVRoom2;

begin
  A.Init(3.4,5.1,2.8);
  writeln('Plotshad sten i potolka= ',A.Square);
end.
