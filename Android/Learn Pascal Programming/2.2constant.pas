program Lesson2_program2;
var
  surname: string;
const      {the reserved word 'const' is used to initialize constants}
  name='Victor';

begin
  write('Enter your surname:');
  readln(surname);
  writeln;
  writeln;
  writeln('Your full name is: ',name,' ',surname);
  readln;
end.
