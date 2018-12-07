program Lesson6_Program4;
var quit:boolean;
  a:string;

begin
  quit:=false;
  repeat
    writeln('Type ''exit'' to quit:');
    readln(a);
    if a='exit' then
      quit:=true;
  until quit=true;
end. 
