program ex;
uses crt,Mouse;
var x,y,xt,yt:integer;
    l,m,r:boolean;
    exit_m:boolean;

begin
  clrscr;
  if not ReSetMouse then  {проверка наличия мыши}
    begin
      writeln('Mish ne zagruzhena');
      halt(1);
    end
  else
    writeln('Mish podklyucena.');
  ShowMouseCursor;  {покажаем курсор: курсор устанавливается в центр экрана}
  MoveMouseCursor(0,0);  {поместим курсор в левый верхний угол экрана}
  window(70,1,80,3);  {нарисуем окно-кнопку "Конец"}
  TextAttr:=16*1+14;
  clrscr;
  GotoXY(2,2);
  write('Konets');
  window(1,1,80,25);
  GotoXY(1,3);
  Textattr:=5*16+9;
  repeat  {цикл обработки нажатий клавиши}
    readMouseState(x,y,l,m,r);
    if l then  {если нажата левая кнопка}
      begin
        {пересчет координат курсора для текстового режима}
        xt:=x div 8+1;
        yt:=y div 8+1;
        exit_m:=(xt>70) and (xt<=80) and (yt>=1) and (yt<=3);
        if not exit_m then
          begin
            GotoXY(xt,yt);
            HideMouseCursor;  {если не убирать курсор,
                              то курсор мыши будет затерт строкой}
            write('x= ',xt:4,' y= ',yt:4);
            ShowMouseCursor;  {теперь символ под курсором
                              "просвечивает" другим цветом}
          end;
        repeat
          ReadMouseState(x,y,l,m,r)
        until not l;  {ждем отпускания левой кнопки}
      end;
  until exit_m;  {до "нажатия кнопки" Конец}
  textattr:=7;
  clrscr;
end.
