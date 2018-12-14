program ex;
var a:array[1..10,1..10] of integer;
  B,max,n,m,k,i,j:integer;

begin
  writeln('Vvedite razmeri matritsi n,m<=10');
  readln(n,m);
  writeln('Vvedite ',n:4,' strok po ',m:4,'elementov');
  for i:=1 to n do
    begin
      for j:=1 to m do read(a[i,j]);
      readln;
    end;
  writeln('Vvedite znaceniye B:');
  readln(B);
  writeln('Ishodniy massiv');
  for i:=1 to n do
    begin
      for j:=1 to m do write(a[i,j]:4);
      writeln;
    end;
  k:=0;       {количество остающихся строк}
  for i:=1 to n do        {цикл по строкам}
    begin
      max:=a[i,1];        {исходное значение максимума строки}
      for j:=1 to m do    {цикл поиска максимума строки}
        if a[i,j]>max then max:=a[i,j];
      if max<>B then  {если максимум строки на равен B}
        begin         {то оставляем строку}
          k:=k+1;     {увеличиваем количество остающихся строки}
          for j:=1 to m do a[k,j]:=a[i,j];    {копируем строку на место}
        end;
    end;
  if k<>0 then     {если в матрице осталась хоть одна строка}
    begin
      writeln('Sformirovannaya matritsa');
      for i:=1 to k do
        begin
          for j:=1 to m do write(a[i,j]:4);
          writeln;
        end;
    end
  else
    writeln('Vse stroki matritsi udaleni');
  readln;
end.
