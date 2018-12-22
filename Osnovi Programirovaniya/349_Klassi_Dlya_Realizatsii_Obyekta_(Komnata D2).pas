program ex;
Type
  pTRoomD2=^TRoomD2;
  TRoomD2=object
    length,width:real;  {поля: длина и ширина}
    function Square:real; virtual;  {метод определения площади}
    constructor Init(l,w:real);  {конcтруктор}
    destructor Done;  {деструктор}
  end;
Function TRoomD2.Square:real;  {тело метода определения площади}
begin
  Square:=length*width;
end;
Constructor TRoomD2.Init(l,w:real);  {тело конструктора}
begin
  length:=l;
  width:=w;
end;
Destructor TRoomD2.Done;
begin
end;
Type pTVRoomD2=^TVRoomD2;
  TVRoomD2=object(TRoomD2)
    h,height:real;  {дополнительное поле класса}
    function Square:real; virtual;  {виртуальный полиморфный метод}
    constructor Init(l,w:real);  {конструктор}
  end;
constructor TVRoomD2.Init(l,w:real);
begin
  inherited Init(l,w);  {инициализирует поля базового класса}
  height:=h;  {инициализируем собственное поле класса}
end;
Function TVRoomD2.Square:real;
begin
  Square:=inherited Square+2*height*(length+width);
end;
var pA:pTRoomD2; pB:pTVRoomD2;  {объявляем указатели}

begin
  {объект базового класса - указатель базового класса}
  pA:=New(pTRoomD2,Init(3.5,5.1));  {конструируем объект}
  writeln('Plotshad= ',pA^.Square:6:2);  {выведет "Площадь= 17.85"}
  Dispose(pA,Done);  {уничтожаем объект}
  {объект производного класса - указатель производного класса}
  pB:=New(pTVRoomD2,Init(3.5,5.1,2.7));  {конструируем объект}
  writeln('Plotshad= ',pB^.Square:6:2);  {выведет "Площадь= 96.64"}
  Dispose(pB,Done);  {уничтожаем объект}
  {проявление полиморфных свойств:
  объект производного класса - указатель базового класса}
  pA:=New(pTVRoomD2,Init(3.5,5.1,2.7));  {конструируем объект}
  writeln('Plotshad= ',pA^.Square:6:2);  {выведет "Площадь= 94.64"}
  Dispose(pA,Done);  {уничтожаем объект}
end.
