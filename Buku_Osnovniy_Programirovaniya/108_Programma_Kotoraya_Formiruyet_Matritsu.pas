program ex;
var a:array[1..3,1..4] of integer;
  k,i,j:integer;

begin
  k:=1;
  for i:=1 to 3 do
    if (i mod 2)=0 then  {если номер строки четный}
      for j:=4 downto 1 do     {обходим справа налево}
        begin
          a[i,j]:=k; k:=k+1;
        end
    else   {если номер строки нечетный}
      for j:=1 to 4 do {обходим слева направо}
        begin
          a[i,j]:=k; k:=k+1;
        end;
  writeln('Sformirovanniy massiv:');
  for i:=1 to 3 do
    begin
      for j:=1 to 4 do write(a[i,j]:3);
      writeln;
    end;
  readln;
end.
