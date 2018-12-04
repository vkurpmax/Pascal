program uppercase;
function UpCaseStr(s:string):string;
var
  i:integer;
begin
  for i:=1 to length(s) do
  if (s[i]>='a') and (s[i]<='z') then
  dec(s[i],32);
  upcasestr:=s;
end;
begin
  writeln(upcasestr('this is text'));
  readln;
end.
