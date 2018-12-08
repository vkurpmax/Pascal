program Project1;
var
  s:string;

begin
  s:='Hey Max! How are you?';
  delete(s,4,4); {'Hey! How are you?'}
  write(s);
  readln;
end.
