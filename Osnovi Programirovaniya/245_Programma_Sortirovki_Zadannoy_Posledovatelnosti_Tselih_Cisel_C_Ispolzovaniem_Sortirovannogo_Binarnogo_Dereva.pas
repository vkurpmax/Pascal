program Sort4;
type top_ptr=^top;  {тип "указатель на вершину дерева"}
  top=record  {тип вершины дерева}
    value:integer;  {целое число}
    left, right:top_ptr;  {указатели на левое и правое поддеревья}
  end;
var next_number:integer;
  r,pass:top_ptr;  {корень бинарного дерева}
{процедура добавления вершины к дереву}
Procedure Add(var r:top_ptr; pass:top_ptr);
  begin
    if r=nil then
      r:=pass  {если место свободно, то добавляем}
    else  {иначе идем налево или направо}
      if (pass^.value<r^.value) then
        Add(r^.left,pass)
      else
        Add(r^.right,pass);
  end;
{процедура сортировки - обход дерева}
procedure Tree(r:top_ptr);
  begin
    if r<>nil then
      begin {если есть поддерево}
        Tree(r^.left);  {обход левого поддерева}
        write(r^.value:4);  {вывод значения из корня}
        tree(r^.right);  {обход правого поддерева}
      end;
  end;
{основная программа}

begin
  {формирование исходного дерева}
  writeln('Vvodite cisla');
  r:=nil;
  read(next_number);
  while not EOF do
    begin
      new(pass);  {выделяем память для нового элемента}
      with pass^ do  {заносим значения}
        begin
          value:=next_number;
          left:=nil;
          right:=nil;
        end;
      Add(r,pass);  {добавляем элемент к дереву}
      read(next_number)
    end;
  readln;
  writeln('Sortirovannaya posledovatelnost:');
  tree(r);
end.
