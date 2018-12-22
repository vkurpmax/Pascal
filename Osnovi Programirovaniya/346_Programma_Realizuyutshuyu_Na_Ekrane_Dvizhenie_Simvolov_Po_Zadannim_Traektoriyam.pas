program ex;
uses crt,Graph;
{описание абстрактного класса}
Type TChar=object
  ch:char;  {символ}
  x,y:integer;  {исходное положение}
  constructor Init(ach:char; ax,ay:integer);
  procedure Move(t:integer);
  procedure Rel(t:integer); virtual;
  end;
constructor TChar.Init(ach:char; ax,ay:integer);
begin
  ch:=ach;
  x:=ax;
  y:=ay;
end;
procedure TChar.Rel(t:integer);
begin
End;
Procedure TChar.Move(t:integer);
begin
  SetColor(GetBkColor);
  OuttextXY(x,y,ch);
  Rel(t);  {вызываем переопределяемый метод изменения координат}
  SetColor(ord(ch) mod 16);
  OutTextXY(x,y,ch);
end;
{описание класса символа, перемещающегося по горизонтали}
Type TLineChar=object(TChar)
  xn:integer;  {точка отсчета координат по горизонтали}
  constructor Init(ach:char; ax,ay:integer);
  procedure Rel(t:integer); virtual;
end;
Constructor TLineChar.Init;
begin
  inherited Init(ach,ax,ay);  xn:=ax;
end;
procedure TLineChar.Rel;
begin
  x:=(xn+t) mod GetMaxX;
end;
{описание класса символа, перемещающегося по вертикали}
Type TVLineChar=object(TChar)
  yn:integer;  {точка отсчета координат по вертикали}
  constructor Init(ach:char; ax,ay:integer);
  procedure Rel(t:integer); virtual;
end;
Constructor TVLineChar.Init;
begin
  inherited Init(ach,ax,ay);
  yn:=ay;
end;
procedure TVLineChar.Rel;
begin
  y:=(yn+t) mod GetMaxY;
end;
{описание класса сивола, перемещающегося по окружности}
Type TCirChar=object(TChar)
  xc,yx,r:integer;  {параметры окружности}
  t0:real;  {исходное положение - начальный угол}
  constructor Init(ach:char; axc,ayc,ar:integer; at0:real);
  procedure Rel(t:integer); virtual;
end;
Constructor TCirChar.Init;
begin
  inherited Init(ach,axc+round(ar*sin(at0)),ayc+round(ar*cos(at0)));
  xc:=axc;
  yc:=ayc;
  r:=ar;
  t0:=at0;
end;
procedure TCirChar.Rel;
begin
  x:=xc+Round(r*sin(t0+t*t0.05));
  y:=yx+Round(r*cos(t0+t*0.05));
end;
{объявление переменных}
var A:TLineChar;
  B:TVLineChar;
  C:TCirChar;
  t:integer;
  i:integer;
  dr,md:integer;
{основная программа}
begin
  dr:=detect;
  InitGraph(dr,md,'E:\BP\BGI');
  A.Init('a',0.25);
  B.Init('b',100,0);
  C.Init('c',GetMaxX div 2,GetMaxY div 2,80,0);
  t:=0;  {условное время движения}
  while not KeyPressed and (t<1000) do
    begin
      A.Move(t);  {перерисовываем символы}
      B.Move(t);
      C.Move(t);
      t:=t+1;  {увеличиваем условное время движения}
      for i:=1 to 1000 do
        Delay(1000);  {фиксируем кадр}
    end;
  CloseGraph;
End.
