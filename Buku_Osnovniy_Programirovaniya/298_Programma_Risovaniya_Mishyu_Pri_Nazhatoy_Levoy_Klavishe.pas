program ex;
uses Mouse,Crt,Graph;
var
  x,y:integer;
  l,m,r:boolean;
  exit_m:boolean;
  driver,mode:integer;
  ch:char;
  {процедура рисования кнопки}
  procedure Button(x1,y1,x2,y2:integer; s:string);
  begin
    SetColor(0);
    SetFillStyle(1,8);
    Bar(x1,y1,x2,y2);  {рисуем контур кнопки}
    SetFillStyle(1,7);
    Bar(x1+2,y1+2,x2-3,y2-3);  {рисуем тени кнопки}
    SetFillStyle(1,15);
    Bar(x1,y1,x1+1,y2);
    Bar(x1+2,y1+1,x1+2,y2-1);
    Bar(x1,y1,x2,y1+1);
    Bar(x1+1,y1+1,x2-1,y1+2);
    SetColor(4);
    SetTextStyle(1,0,3);
    OutTextXY(x1+20,y1+3,s);
  end;
{основная программа}

begin
  clrscr;
  if not ReSetMouse then {проверим наличие мыши}
    begin
      writeln('Mouse not found.');
      halt(1);
    end;
  driver:=detect;
  InitGraph(driver,mode,'');
  SetColor(4);
  OuttextXY(10,10,'Drawing with mouse:');
  ShowMouseCursor;  {покажаем курсор мыши}
  SetBkColor(3);
  Button(500,10,600,50,'Exit');
  repeat  {цикл опроса состояния клавиатуры и мыши}
    if keypressed then
      ch:=readkey  {если нажата клавиша на клавиатуре, то введем код}
    else  {если клавиша не нажата, то}
      begin
        ReadMouseState(x,y,l,m,r);  {опросим состояние мыши}
        Exit_m:=(x>=500) and (x<=600) and (y>=10) and (y<=50);
        if not Exit_m and l then  {если не "нажата" кнопка "Exit" на экране}
          begin  {изобразим точку на экране}
            HideMouseCursor;
            PutPixel(x,y,4);
            ShowMouseCursor;
          end;
      end
  until (exit_m and l) or (ch=#27);
  repeat
    ReadMouseState(x,y,l,m,r)
  until not l;  {ожидаем отпускания клавиши}
  closegraph;
end.
