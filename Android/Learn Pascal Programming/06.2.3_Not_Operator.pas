program Lesson6_Program3;
uses crt;
var n1:string;

begin
  writeln('Enter two numbers: (any number except 0 to exit)');
  repeat
    write('No.1: ');
    readln(n1);
    if not(n1='0') then halt;
  until not(n1='0');
end.
