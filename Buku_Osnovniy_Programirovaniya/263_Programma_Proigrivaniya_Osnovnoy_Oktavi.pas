program ex;
uses crt;
const f:array[1..13] of word = (330, 349, 370, 392, 415, 440,
                               446, 494, 523, 554, 588, 622, 660);
var i:byte;
  j:integer;

begin
  for i:=1 to 13 do
    begin
      sound(f[i]);
      for j:=1 to 5000 do
        delay(1000);  {задержка ?!}
      NoSound;
    end;
end.
