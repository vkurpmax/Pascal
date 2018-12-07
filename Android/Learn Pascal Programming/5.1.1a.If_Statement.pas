program Program1a_lesson5;
uses crt;

label return; {used respectively with the goto statement; not recommended}

var SEL:integer;
  YN: char;

begin
  return:clrscr;
  writeln('[1].PLAY GAME');
  writeln('[2].LOAD GAME');
  writeln('[3].MULTIPLAYER');
  writeln('[4].EXIT GAME');
  writeln('note: Do not press anything except');
  writeln('numbers; otherwise an error occurs!');
  readln(sel);

  if SEL=1 then
    begin
      writeln('You will soon be able to create');
      writeln('games using Pascal Programming :-)');
      delay(2000);
      goto return;
    end;

  if SEL=2 then
    begin
      writeln('Ahhh... no saved games');
      delay(2000);
      goto return;
    end;

  if SEL=3 then
    begin
      writeln('networking or 2 players?');
      delay(2000);
      goto return;
    end;

  if SEL=4 then
    begin
      writeln('Exit?');
      yn:=readkey;
      if yn='y' then
        begin
          writeln('Good Bye...');
          delay(2000);
          halt;
        end;
      if yn='n' then
        goto return;
    end;
end.
