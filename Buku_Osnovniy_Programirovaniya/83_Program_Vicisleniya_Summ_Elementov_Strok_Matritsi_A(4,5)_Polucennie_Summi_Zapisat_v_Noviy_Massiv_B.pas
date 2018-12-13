program ex;
var A:array[1..4,1..5] of real;
  B:array[1..4] of real;
  i,j:byte;

begin
  writeln('Vvedite matritsu postrochno:');
  for i:=1 to 4 do {вводим матрицу}
  begin
    for j:=1 to 5 do read(A[i,j]);
    readln;
  end;
  writeln('Rezultati:');
  for i:=1 to 4 do      {для каждой строки}
    begin
      B[i]:=0;  {обнуляем накапливаемую сумму}
      for j:=1 to 5 do B[i]:=B[i]+A[i,j];     {суммируем элементы строки}
      for j:=1 to 5 do write(A[i,j]:7:2);     {выводим строку}
      writeln('  Summa ravna ',B[i]:7:2);      {выводим сумму}
    end;
  readln;
end.
