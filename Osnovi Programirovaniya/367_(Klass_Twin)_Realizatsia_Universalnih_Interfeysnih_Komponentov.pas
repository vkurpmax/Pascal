program ex;
uses crt,Graph, unit1;
Type pChar=^TChar;
  {описание абстрактно класса}
  TChar=object
    ch:char;
    x,y:integer;
    constructor Init(ach:char; ax,ay:integer);
    procedure Move(t:integer);
    procedure Rel(t:integer); virtual;
    destructor Done; virtual;  {деструктор обязателен, так как
                               объекты динамические полиморфные}
  end;
constructor TChar.Init(ach:char; ax,ay:integer);
begin
  ch:=ach;
  x:=ax;
  y:=ay;
end;
procedure TChar.Rel(t:integer);
begin
end;
procedure TChar.Move(t:integer);
begin
  SetColor(GetBkColor);
  OuttextXY(x,y,ch);
  Rel(t);  {изменяем координаты}
  SetColor(ord(ch) mod 16);
  OutTextXY(x,y,ch);
end;
Destructor TChar.Done;
begin
end;  {деструктор пустой, так как объект не содержит
      объектных полей}
Type pLChar=^TLineChar;
  {описание класса символа, перемещающегося по горизонтали}
  TLineChar=object(TChar)
    xn:integer;
    constructor Init(ach:char; ax,ay:integer);
    procedure Rel(t:integer); virtual;
  end;
constructor TLineChar.Init;
begin
  inherited Init(ach,ax,ay);
  xn:=ax;
end;
procedure TLineChar.Rel;
begin
  x:=(xn+t) mod GetMaxX;
end;
Type pVChar=^TVLineChar;
  {описание класса символа, перемещающего по вертикали}
  TVLineChar=object(TChar)
    yn:integer;
    constructor Init(ach:char; ax,ay:integer);
    procedure Rel(t:integer); virtual;
  end;
constructor TVLineChar.Init;
begin
  inherited Init(ach,ax,ay);
  yn:=ay;
end;
Procedure TVLineChar.Rel;
begin
  y:=(yn+t) mod GetMaxY;
end;
Type pCChar=^TCirChar;
  {описание класса символа, перемещающегося по окружности}
  TCirChar=object(TChar)
    xc,yc,r:integer; t0:real;
    constructor Init(ach:char; ayc,ar:integer; at0:real);
    procedure Rel(t:integer); virtual;
  end;
constructor TCirChar.Init;
begin
  inherited Init(ach,axc+round(ar*sin(at0)),ayc+round(ar*cos(at0)));
  xc:=axc;
  yc:=ayc;
  r:=ar;
  t0:=at0;
end;
procedure TCirChar.Rel;
begin
  x:=xc+Round(r*sin(t0+t*0.05));
  y:=yc+Round(r*cos(t0+t*0.05));
end;
Type TString=object
  mas:array[1..10] of pChar;  {массив указателей на объекты}
  n:integer;  {реальное количество объектов}
  procedure Init(as:string; tmove:byte);  {создание объектов}
  procedure Move(t:integer);  {перемещение строк}
  procedure Done;  {уничтожение объектов}
end;
Procedure TString.Init;
var i:integer;
  begin
    n:length(as);
    for i:=1 to n do
      begin
        case tmove of
        1:mas[i]:=new(pLChar,Init(as[i],9*i,GetMaxY div 2));
        2:mas[i]:=new(pVChar,Init(as[i],GetMaxX div 2-n*5+10*i,0));
        3:mas[i]:=new(pCChar,Init(as[i],GetMaxX div 2,GetMaxY div2,100,2*pi*i-1)/n));
        end;
      end;
    end;
  end;
Procedure TString.Move;
var i:integer;
  begin
    for i:=n downto 1 do
      mas[i]^.Move(t);
    end;
procedure TString.Done;
var i:integer;
  begin
    for i:=1 to n do
      dispose(mas[i],Done);
  end;
var s:string; M:array[1..3] of string; i,t,dr,md:integer;
begin
  write('Vvedite stroku do 10 simvolov:');
  readln(s);
  InitGraph(dr,md'e:\bp\bgi');
  for i:=1 to 3 do M[i].Init(s,i);
  t:=0;
  while not KeyPressed and (t<1000) do
    begin
      for i:=1 to 3 do
        M[i].Move(t);  {перемещаем строки}
      t:=t+1;
      for i:=1 to 1000 do
        delay(1000);
    end;
  for i:=1 to 3 do
    M[i].Done;
  closeGraph;
end.
