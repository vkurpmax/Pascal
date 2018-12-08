program Project1;
var
  s:string;

begin
  s:='Hey there! How are you?';
  write('The word "How" is found at char index');
  writeln(pos('How',s));
  if pos('Why',s) then
    writeln('"Why" is not found.');
  readln;
end.
