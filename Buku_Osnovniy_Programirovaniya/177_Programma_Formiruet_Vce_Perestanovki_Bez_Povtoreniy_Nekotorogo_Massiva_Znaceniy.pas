program ex;
type
  mas=array[1..5] of char;
const a:mas='ABCDE';
var pole:mas;

procedure Perest(n,m:integer; Const r:mas;  var pole:mas);
  var r1:mas;
    k,j,i:integer;
  begin
    if n>m then
      begin
        for i:=1 to m do
          write(pole[i]);
        write(' ');
      end
    else
      for i:=1 to m-n+1 do
        begin
          pole[n]:=r[i];
          k:=1;
          for j:=1 to m-n+1 do
            if j<>i then
              begin
                r1[k]:=r[j];
                k:=k+1;
              end;
          Perest(n+1,m,r1,pole);
        end;
  end;

begin
  Perest(1,5,a,pole);
  readln
end.

{Программа, которая формирует все перестановки без повторений некоторого массива значений.
Например, если задан массив, содержащий символы ABC, то необходимо сформировать следующие
комбинации: ABC, ACB, BAC, BCA, CAB, CBA.}
