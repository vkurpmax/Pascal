program ex;
var a:array[1..15,1..15] of integer;
  s,n,k,p,i,j:integer;

begin
  writeln('Vvedite razmer matritsi n<=15');
  readln(n);
  writeln('Vvedite ',n,' strok(i) po ',n,' elementa(ov):');
  for i:=1 to n do
    for j:=1 to n do
      read(a[i,j]);
  readln;
  writeln('Vvedite indeksi elementa p,k:');
  readln(p,k);
  writeln('Ishodniy massiv');
  for i:=1 to n do
    begin
      for j:=1 to n do
        write(a[i,j]:4);
      writeln;
    end;
  s:=0;  {начальное значение суммы верхней части}
  for i:=1 to p do {цикл определения суммы верхней части}
    begin
      for j:=1 to i-p+k-1 do  {цикл обхода элементов левой части}
        s:=s+a[i,j];
      for j:=p+k-i+1 to n do  {цикл обхода элементов правой части}
        s:=s+a[i,j];
    end;
  for i:=p+1 to n do {цикл определения суммы нижней части}
    begin
      for j:=i-p+k-1 to n do   {цикл обхода элементов левой части}
        s:=s+a[i,j];
      for j:=i-p+k-1 to n do   {цикл обхода элементов правой части}
        s:=s+a[i,j];
    end;
  writeln('Summa elementov ravna ',s);
  readln;
end.
{программа определения суммы элементов,
расположенных в закрашенных областях,
полученных при построкнии диагоналей,
проходящих через элемент [p,k]}
