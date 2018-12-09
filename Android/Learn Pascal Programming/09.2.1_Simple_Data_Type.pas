program Project1;
type
  nameType=string[50];
  ageType=0..150; {age range: from 0 to 150}

var
  name:nameType;
  age:ageType;

begin
  write('Enter your name: ');
  readln(name);
  write('Enter your age: ');
  readln(age);
  writeln;
  writeln('Your name: ',name);
  writeln('Your age: ',age);
  readln;
end.
