program Lesson6_Program2;
uses crt;
var n1,n2:string;

begin
  writeln('Enter two numbers: (''1'' & ''2'' to exit)');
  repeat
    write('No.1: ');
    readln(n1);
    write('No.2: ');
    readln(n2);
    if (n1='1') or (n2='2') then halt;
  until (n1='1') or (n2='2');
end.
