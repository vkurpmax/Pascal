program ex;
uses graph,crt,dos;
type
  ScreenType=array[0..199,0..319] of byte;  {массив для хранения
                                  образа экрана - формат видеобуфера}
  ImageType=array[0..999] of byte;  {развертка изображения}
  ScrTypePtr=^ScreenType;  {указатель на массив образа экрана}
  ImageTypePtr=^ImageType;  {указатель на развертку изображения}
{процедура установки режима с номером mode}
procedure SetBIOSMode(mode:byte);
  var r:registers;
  begin
    r.AL:=mode;  {запись номера режима в регистр AL}
    r.AH:=0;  {запись номера функции в регистр AH}
    intr($10,r);  {вызов 0-й функции 10-го прерывания}
  end;
{основная программа}
var
  s:string;
  i,j,n,m,l,y,dy:integer;
  Active_Ptr:ScrTypePtr;  {указатель на тип "образ экрана"}
  Image:ImageTypePtr;  {указатель на развертку изображения}
  driver,mode:smallint;

begin
  {формирование изображения и сохранение его в памятки}
  Driver:=Detect;  InitGraph(Driver,Mode,'');
  s:='ABCDEF';
  SetColor(4);  SetTextStyle(GothicFont,HorizDir,3);
  OutTextXY(2,2,s);
  n:=TextHeight(s)+3;
  m:=TextWidth(s)+3;
  GetMem(Image,(n+1)*(m+1));  {получение памяти для записи изображения}
  l:=0;
  for i:=0 to n do
    for j:=0 to m do
      begin
        image^[l]:=Lo(GetPixel(j,i));  {запись изображения в буфер}
        l:=l+1;
      end;
  CloseGraph;
  {запись изображения "напрямую" в видеобуфер}
  SetBIOSMode($13);  {установка 19-го графического режима}
  Active_Ptr:=Ptr($A000,0);  {стандартный адрес видеобуфера}
  y:=0;
  dy:=1;
  {покадровый вывод изображения}
  repeat
    {побайтная запись изображения в видеобуфер}
    l:=0;
    for i:=0 to n do
      for j:=0 to m do
        begin
          Active_Ptr^[y+i+10,j+20]:=image^[l];
          l:=l+1;
        end;
    for i:=1 to 1000 do
      Delay(3000);  {задержка}
    Inc(y,dy);  {смещение изображения}
    if (y>120) or (y<0) then
      dy:=-dy;  {организация колебательного движения}
  until KeyPressed;
  SetBIOSMode(3);  {возврат к стандартному текстовому режиму}
end.
