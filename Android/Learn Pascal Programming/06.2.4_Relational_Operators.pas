program Project1;
var age:integer;

begin
  repeat
    write('Enter age (1 - 100): ');
    readln(age);
    if (age < 1) then
      writeln('Age cannot be less than 1...')
    else if (age>100) then
      writeln('Age cannot be greater than 100...');
  until (age>0) and (age<101);
end.
