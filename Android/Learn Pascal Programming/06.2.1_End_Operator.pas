program Lesson6_Program1;
uses crt;
var n1,n2:string;

begin
  writeln('Enter two numbers: (''0'' & ''0'' to exit)');
  repeat
    write('No.1: ');
    readln(n1);
    write('No.2: ');
    readln(n2);
    if (n1='0') and (n2='0') then halt(0);
  until (n1='0') and (n2='0');
end.
