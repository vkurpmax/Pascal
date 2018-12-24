program ex_large_mas;
const nn=16000;  {максимальное количество строк}
var i,j,n,m:word;  s:real;
  ptrstr:array[1..nn] of pointer;  {статический массив указателей на
                                   строки матрицы}
type tpreal=^real;
{функция формирования адреса элемента матрицы}
Function AddrR(i,j:word):tpreal;
  begin
    AddrR:=Ptr(Seg(ptrstr[i]^),Ofs(ptrstr[i]^)+(j-1)*SizeOf(real))
  end;
{собственная функция обработки ошибок}
function heapfunc(size:word):integer; far;
  begin
    heapfunc:=1;
  end;
{основная программа}

begin
  randomize;
  heaperror:=@heapfunc;  {подключаем собственную функцию обработки ошибок}
  writeln('Vvedite n,m');
  readln(n,m);
  for i:=1 to n do
    begin
      GetMem(ptrstr[i],m*sizeof(real));  {запрашиваем память под строку матрицы}
      if ptrstr[i]=nil then  {если памяти не хватает,}
        begin  {то завершаем программу}
          writeln('Ne hvataet pamyati pod matritsu.');
          for j:=1 to i-1 do
            FreeMem(ptrstr[j],m*sizeof(real));  {освобождаем уже выделенную память}
          Halt(2);
        end;
      for j:=1 to m do
        AddrR(i,j)^:=random;  {если память есть, то заполняем строку случайнными числами}
    end;
  s:=0;
  for i:=1 to n do
    for j:=1 to m do
      s:=s+AddrT(i,j)^;
  writeln('Znacenie summi =',s:15:10);
  writeln('Srednee znacenie =',s/(n*m):15:10);
  for i:=1 to n do
    FreeMem(ptrstr[i],m*sizeof(real));  {освобождаем использованную память}
  readln;
end.
