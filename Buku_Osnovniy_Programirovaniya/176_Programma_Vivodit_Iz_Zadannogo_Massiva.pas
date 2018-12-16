program ex;
type mas=array[1..10] of real;
  var x:mas;
    i:integer;

procedure print(var x:mas;  i:integer);
begin
  if x[i]=0 then
    writeln('***')
  else
    begin
      if x[i]>0 then
        writeln(i,'',x[i]);
      print(x,i+1);  {рекурсивный вызов}
      if x[i]<0 then
        writeln(i,'',x[i]);
    end
end;

begin
  i:=0;
  repeat
    i:=i+1;
    read(x[i])
  until x[i]=0;
  readln;
  print(x,1);
  readln;
end.
