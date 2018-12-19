program ex;
var n:longint;
  st:string;
  mnoj:set of '0'..'9';
  i:integer;  j:char;

begin
  writeln('Vvedite cislo:');
  readln(n);
  str(abs(n),st);
  mnoj:=[];      {в исходном состоянии множество пусто}
  for i:=1 to length(st) do
    mnoj:=mnoj+[st[i]];  {формируем множество}
  writeln('Zapis cisla ',n,' soderzhit sleduyutshie tsifri:');
  for j:='0' to '9' do {выводим цифры, вошедшие во множество}
    if j in mnoj then
      write(j+'');
  readln;
end.
{Разработать программу для определения количества различных цифр в десятичной
записи натурального числа.}
