program FBbatasnilai;
uses crt;
var a,b,c,d,n:integer;

begin
  write('Masukkan batas nilai: ');
  readln(n);
  b:=0;
  c:=1;
  for a:=1 to n do
    begin
      write(c);
      if a<>1 then
        begin
          d:=1;
          repeat
            d:=d+1;
            write(d);
          until (d=a);
        end;
      writeln;
    end;
  readln;
end.
