program ex;
type setChar=set of char;  {тип "множество символов"}
  str80=string[80];  {тип "строка длной 80 символов"}
  pTop=^Top;  {тип "указатель на вершину"}
  Top=record  {тип "вершина"}
    operator:string[5];  {знак операции}
    value:single;  {значение константы}
    left,right:pTop;  {указатель на левое и правое поддерево}
  end;
var st:str80;  {строка - запись выражения}
  root:pTop;  {корень дерева выражения}
  key:boolean;  {признак существования значения в заданной точке}
  x,xn,xe,dx,y:single;  {начальное, конечное значения и шаг
                        аргумента, значение аргумента и функции}
  n,i:word;  {количество точек и номер текущей точки}
{рекурсивная функция констрирования поддерева
выражения с корнем r из строки st}
procedure Constr_Tree(r:pTop; st:str80);
var next:pTop;
  SetOp:setChar;
  po,code:integer;
  stl,stri:str80;
  c:single;
{внутренняя функция поиска первого вхождения операции в строке st:
SetOp - множество знаков операций; функция возвращает позицию
разделительного знака или 0}
Function PosOpFirst(st:str80; SetOp:setChar):byte;
var i,j,k,p:byte;
  begin
    j:=0;
    k:=0;
    p:=0;
    i:=1;
    while (i<=length(st)) and (p=0) do
      begin
        if st[i]='(' then
          inc(j)  {считаем количество открывающихся скобок}
        else
          if st[i]=')' then
            inc(k)  {считаем количество закрывающихся скобок}
          else
            if (j=k) and (st[i] in SetOp) then
              p:=i;
        inc(i);
      end;
    PosOpFirst:=p;
  end;
{внутренняя функция поиска последнего вхождения операции в строке
st: SetOp - множество знаков операций; функция возвращает позицию
разделительного знака или 0}
Function PosOpLast(st:str80; SetOp:setChar):byte;
var i,j,k,p:byte;
  begin
    j:=0;
    k:=0;
    p:=0;
    for i:=1 to length(st) do
      begin
        if st[i]='(' then
          inc(j)  {считаем количество открывающихся скобок}
        else
          if st[i]=')' then
            inc(k)  {считаем количество закрывающихся скобок}
          else
            if (j=k) and (st[i] in SetOp) then
              p:=i;
        inc(i);
      end;
    PosOpLast:=p;
  end;
{раздел операторов функции констрирования дерева выражения}
begin
  po:=PosOpLast(st,['+','-']);  {ищем знак операции + или -}
  if po=0 then
    po:=PosOpLast(st,['*','/']);  {ищем знак операции * или /}
  if po=0 then
    po:=PosOpFirst(st,['^']);  {ищем знак операции ^}
  if po<>0 then  {разделяющий знак найден}
    begin
      r^.operator:=st[po];  {записываем знак операции в вершину}
      stl:=copy(st,1,po-1);  {копируем подстроку первого операнда}
      if (stl[1]='(') and (PosOpLast(stl,['*','/','+','-','^'])=0 then
        stl:=copy(stl,2,length(stl)-2;  {копируем подстроку второго операнда}
      if (stri[1]='(') and (PosOpLast(stri,['*','/','+','-','^'])=0 then
        stri:=copy(stri,2,length(stri)-2);  {убираем скобки}
      new(r^.left);  {создаем левое поддерево}
      Constr_Tree(r^.left,stl);  {конструируем левый операнд}
      new(r^.right);  {создаем правое поддерево}
      Constr_Tree(r^.right,stri);  {конструируем правый операнд}
    end
  else
    if st[1]='x' then {аргумент}
      begin
        r^.operator:='x';
        r^.left:=nil;
        r^.right:=nil;
      end
    else
      begin
        val(st,c,code);  {пытаемся получить число}
        if code=9 then  {константа}
          begin
            r^.operator:='o';
            r^.left:=nil;
            r^.right:=nil;
            r^.value:=c;
          end
        else  {функция}
          begin
            po:=Pos('(',st);
            r^.operator:=copy(st,1,po-1);  {выделяем имя функции}
            r^.right:=nil;
            stl:=copy(st,po+1,length(st)-po-1);  {выделяем подстроку параметра}
      new(r^.left);
      Constr_Tree(r^.left,stl);  {конструируем параметр}
          end;
      end;
end;
{рекурсивное вычисление значения функции:
если Key=false, то значение не существует}
Function Count(r:pTop; x:single; Var key:boolean):single;
var s,s1:single;
begin
  if not key then  {значение функции не существует}
    begin
      Count:=0;
      exit;
    end;
  if r^.operator='o' then
    Count:=r^.Value  {константа}
  else
    if r^.operator='x' then
      Count:=x  {переменная x}
    else
      case r^.operator[1] of
      '+':Count:=Count(r^.left,x,key)+Count(r^.right,x,key);
      '-':Count:=Count(r^.left,x,key)-Count(r^.right,x,key);
      '*':Count:=Count(r^.left,x,key)*Count(r^.right,x,key);
      '/':begin
            s:=Count(r^.right,x,key);
            if abs(s)<1e-10 then  {практический ноль}
              begin
                Count:=0;
                key:=false;
              end
            else
              Count:=Count(r^.left,x,key)/s;
          end;
      '^':begin
            s:=Count(r^.left,x,key);
            s1:=Count(r^.right,x,key);
            if s<>0 then
              Count:=exp(s1*ln(abs(s)))
            else
              if s1=0 then
                Count:=1
              else
                Count:=0;
          end;
      's':Count:=sin(Count(r^.left,x,key));
      'c':Count:=cos(Count(r^.left,x,key));
      else  {неопределенная операция}
        begin
          Count:=0;
          key:=false;
        end
      end
end;
{основная прогамма}

begin
  writeln('Vvedite virazhenie:');
  readln(st);
  write('Vvedite xn, xe, n: ');
  readln(xn,xe,n);
  new(Root);
  Constr_Tree(Root,st);
  dx:=(xe-xn)/(n-1);
  writeln(' x ','    y');
  x:=xn;
  for i:=1 to n do
    begin
      key:=true;
      y:=Count(Root,x,key);
      if key then
        writeln(x:6:3,y:20:3);
      else
        writeln(x:6:3,' ne sutshestvuet');
      x:=x+dx;
    end;
end.
