program ex;
var a:array[1..10] of integer;
  B,i,k,n:integer;

begin
  writeln('Vvedite kolicestvo elementov n<=10');
  readln(n);
  writeln('Vvedite ',n,' elementov massiva');
  for i:=1 to n do read(a[i]);
  readln;  {вводим массив}
  writeln('Vvedite B:');
  readln(B);       {вводим B}
  writeln(' Ishodniy massiv ');
  for i:=1 to n do write(a[i]:5);
  writeln; {вводим исходный массив}
  k:=0;   {пока не найдено нт одного элемента массива}
  for i:=1 to n do
    begin
      if A[i]>=B then
        begin
          k:=k+1;
          A[k]:=A[i];
        end
    end;
  if k=0 then writeln('Vse elementi vicerknuti. Massiv pust.')
  else
    begin
      writeln('Rezultiruyutshiy massiv iz ',k,' elementov:');
      for i:=1 to k do write(a[i]:5);
      writeln;
    end;
  readln;
end.
