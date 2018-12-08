program Project1;
var
  s:string;
  error:integer;
  r:real;

begin
  s:='-0.563';
  val(s,r,error);
  if error>0 then
    write('Error in conversion.')
  Else
    write(r);
  readln;
end.

{Procedure Val(S:string; var val; code:integer);
Description
converts a string to its corresponding numeric value. The string parameter S is
converted into a numberic value and passed back through the variable paramter
Val. If the string to be converted is not a correct numberic value, an error occurs
and is returned via Code. If the conversion is correct then Code is 0.}
