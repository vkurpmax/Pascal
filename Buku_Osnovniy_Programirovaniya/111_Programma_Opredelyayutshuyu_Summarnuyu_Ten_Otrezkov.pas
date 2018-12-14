program ex;
var x:array[1..100,1..2] of real;
  i,j,n,k:integer;
  xk,S,w:real;

begin
  write('Vvedite kolicestvo otrezkov:');
  readln(n);
  writeln('Vvedite nacala i kontsi otrezkov.');
  for i:=1 to n do readln(x[i,1],x[i,2]);
  {сортировка отрезков по возрастанию левой границы}
  j:=1; k:=1;
  while k<>0 do
    begin
      k:=0;
      for i:=1 to n-j do
        if x[i,1]>x[i+1,1] then
          begin
            k:=k+1;        {меняем отрезки местами}
            w:=x[i,1];
            x[i,1]:=x[i+1,1];
            x[i+1,1]:=w;
            w:=x[i,2];
            x[i,2]:=x[i+1,2];
            x[i+1,2]:=w;
          end;
      j:=j+1;
    end;
  {определение тени}
  s:=x[1,2]-x[1,1]; {длина первого отрезка}
  xk:=x[1,2];       {правая граница первого отрезка}
  for i:=2 to n do
    if x[i,1]>=xk then      {случай б}
      begin s:=s+x[i,2]-x[i,1];
        xk:=x[i,2];
      end
    else
    if x[i,2]>xk then       {случай a}
      begin
        S:=s+x[i,2]-xk;
        xk:=x[i,2];
      end;
  writeln('Dlina teni ravna',s:6:2);
  readln;
end.
{разработать программу, определяющую суммарную "тень" отрезков,
параллельных оси х, на оси х.}
