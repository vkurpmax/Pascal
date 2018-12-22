program ex;
Type pTRoomD3=^TRoomD3;
  TRoomD3=object
    length,width:real;  {поля: длина и ширина комнаты}
    function Square:real; virtual;  {метод определения площади}
    constructor Init(l,w:real);  {конструктор}
    destructor Done; virtual;  {деструктор}
  end;
Function TRoomD3.Square:real;  {метод определения площади}
begin
  Square:=length*width;
end;
Constructor TRoomD3.Init(l,w:real);  {конструктор}
begin
  length:=l;
  width:=w;
end;
Destructor TRoomD3.Done;
begin
end;
Type pTBRoomD=^TBRoomD;
  TBRoomD=object(TRoomD3);
    pb:pTRoomD3;
    function Square:real; virtual;
    function BSquare:real;  {площадь балкона}
    constructor Ini(l,w:real; lb,wb:real);
    destructor Done; virtual;
  end;
Constructor TBRoomD.Init;
Begin
  inherited Init(l,w);
  if (lb=0) or (wb=0) then
    pB:=nil
  else
    begin
      New(pB);
      if pB=nil then
        begin
          writeln('Ne hvataet dlya razmatsheniya polya');
          done;  {завершение обработки; не нужно, если такой
                 обработки нет и деструктор пустой}
          fail;  {отменяет все выполненные заказы на память}
        end;
      else
        pB^.Init(lb,wb);
    end;
  end;
Function TBRoomD.BSquare;
begin
  if pB<>nil then
    BSquare:=pB^.Square
  else
    BSquare:=0;
end;
function TBRoomD.Square;
begin
  Square:=inherited Square+BSquare;
end;
Destructor TBRoomD.Done;
begin {освобождаем память, выделенную под динамическое поле}
  if pB<>nil then
    Dispose(pB);
end;
Function HeapFunc(size:Word):integer;far;
begin
  HeapFunct:=1;
end;
var A:TBRoomD; pB1:pTBRoomD; pB2:pTRoomD3;
begin
  {берем на себя обработку ошибок выделения памяти}
  HeapError:=@HeapFunc;
  {статический объект с динамическим полем}
  if A.Init(3.2,5.1,2.5,1) then {конструктор возвращает true или false}
    begin
      writeln(A.Square:6:2,A.BSquare:6:2);  {выводим площади}
      A.Done;  {вызываем деструктор как обычную процедуру}
    end
  else
    writeln('Ne hvataet pamyati dlya razmatsheniya obyekta.');
  {динамический объект с динамическим полем - указатель типа
  класса-потомка}
  pB1:=New(pTBRoomD,Init(3.2,5.1,2.5,1));  {new вернет адрес или nil}
  if pB1<>nil then
    begin
      writeln(pB1^.Square:6:2,pB1^.BSquare:6:2);  {выводим площади}
      Dispose(pB1,Done);  {уничтожаем объект}
    end
  else
    writeln('Ne hvataet pamyati dlya razmetsheniya obyekta.');
  {динамический объект с динамическим полем - указатель типа
  класса-родителя}
  pB2:=new(pTBRoomD,Init(3.2,5.1,2.5,1));  {new вернет адрес или nil}
  if pB2<>nil then
    begin
      writeln(pB2^.Square:6:2,  {необходимо позднее связывание - случай 2}
      pTBRoomD(pB2)^.BSquare:6:2);  {явное переопределение типа
        указателя, иначе метод класса-потомка для указателя
        типа класса-родителя не "виден" (см. параграф 11.1)}
      Dispose(pB2,Done);  {позднее связывние - случай 2}
    end
  else
    writeln('Ne hvataet pamyati dlya razmetsheniya obyekta.');
end.
