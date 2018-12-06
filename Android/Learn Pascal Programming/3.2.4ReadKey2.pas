program ProgramReadKey2;
uses crt;
var keypress:string;

begin
  writeln('Press ANY key');
  keypress:=readkey; {keypress is a pre-defined string variable(can be an integer variable)}
  writeln(keypress);
  readln;
end.  
