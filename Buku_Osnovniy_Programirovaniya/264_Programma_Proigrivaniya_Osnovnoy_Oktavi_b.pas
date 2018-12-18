program ex;
uses crt, Dos;
procedure NewDelay(dTime:word);
var key:boolean;
  Hour,Min,Sec,Sec100,MyHour,MyMin,MySec,MySec100:word;

begin
  GetTime(Hour,Min,Sec,Sec100);  {узнаем текущее время}
  {определяем время завершения задержки}
  MySec100:=Sec100+dTime;
  MySec:=Sec+MySec100 div 100;
  MySec100:=MySec100 mod 100;
  MyMin:=Min+MySec div 60;
  MySec:=MySec mod 60;
  MyHour:=Hour+MyMin div 60;
  MyMin:=MyMin mod 60;
  key:=false;
  while not key do  {цикл задержки}
    begin
      GetTime(Hour,Min,Sec100);  {узнаем текущее время}
      {проверяем, наступил ли заданный момент}
      if (Hour>MyHour) or ((Hour=MyHour) and ((Min>MyMin) or
          ((Min=MyMin) and ((Sec>MySec) or
          ((Sec=MySec) and ((Sec100>=MySec100))))))) then
        key:=true;
    end
end;
Const f:array[1..13] of word = (330,349,370,392,415,440,
                               466, 494,523,554,588,622,660);
var i:byte;  j:integer;
begin
  for i:=1 to 13 do
    begin
      sound(f[i]);
      newdelay(50);
      NoSound;
    end;
end.
