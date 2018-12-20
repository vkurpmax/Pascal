program Gr;
uses WinGr, Graph;
{объявление переменых}
var
  w1,w2:Twin_gr;
  dr,mode:integer;
{определление функции}
Function f(x:real):real; far;

begin
  f:=abs(cos(x*x)*x)
end;
{основная программа}
begin
  dr:=detect;
  InitGraph(dr,mode,'');
  W1.Init(-0.9,0.9,100,f,0,0,300,400);
  w1.Run;
  w2.Init(1,3,200,f,320,100,600,400);
  w2.Run;
end.
