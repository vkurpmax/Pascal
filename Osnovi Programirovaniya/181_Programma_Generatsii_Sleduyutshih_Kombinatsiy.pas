program ex;
const
  a:array[1..10] of byte=(1,1,1,1,1,1,1,1,1,1);
var i,m,n:integer;

begin
  readln(n,m);
  while a[1]<m+1 do {условие "сброса" счетника}
    begin
      for i:=1 to n do
        write(a[i]);  {вывод комбинации}
      write(' ');
      a[n]:=a[n]+1;   {добавление 1 в последний разряд}
      for i:=n downto 2 do        {анализ и осуществление переносов}
        if a[i]>m then
          begin
            a[i]:=1;
            a[i-1]:=a[i-1]+1;
          end;
    end;
  readln;
end.
{разработать программу генерации следующих комбинаций:
1111, 1112, 1113, 1121, 1122, 1131, 1132, 1133, 1211, ..., 3333.}
