program Project1;
var
  mystring:string;

begin
  mystring:='Hey! How are you?';
  writeln('The length of the string is ', byte(mystring[0]));
  write(mystring[byte(mystring[0])]);
  write(' is the last character.');
  readln;
end.
