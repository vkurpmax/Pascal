program Project1;
var
  s:string;
  i:integer;

begin
  s:='Hey! How are you?';
  for i:=1 to length(s) do
    s[i]:=upcase(s[i]);
  write(s); {'HEY! HOW ARE YOU'}
  readln;
end.

{Function UpCase(C:Char):Char;

Description
Converts the character C to uppercase and returned. If the character is already
in uppercase form or the character is not within the range of the lower case
alphabet, then it is left as is.}
