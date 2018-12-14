program ex;
var a,b:array[1..40] of integer;
  i,k,n:integer;

begin
  writeln('Vvedite kolicestvo elementov massiva <=40');
  readln(n);
  writeln('Vvedite ',n,' elementov massiva A');
  for i:=1 to n do read(a[i]);
  readln;
  writeln('Ishodniy massiv:');
  for i:=1 to n do write (a[i]:3);
  writeln;
  k:=0;   {начальное значение индекса формируемого массива}
  for i:=1 to n do
    if a[i]>0 then   {если элемент > 0}
      begin
        k:=k+1;      {изменение индекса формируемого массива}
        b[k]:=a[i];  {перепись найденного элемента}
      end;
  if k=0 then
    writeln('V massive A nyet polozitelnih elementov.')
  else
    begin
      writeln(' Massiv rezultat B');
      for i:=1 to k do write(b[i]:3); writeln;
    end;
  readln;
end.
