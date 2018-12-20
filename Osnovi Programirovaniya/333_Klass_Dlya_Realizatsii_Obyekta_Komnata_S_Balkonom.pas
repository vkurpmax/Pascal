program project1;
uses Room;
Type
  TBRoom=object(TRoom)
    PB:^Troom;
    function BSquare:real;
    procedure InitAll(l,w:real; lb,wb:real);
  end;
procedure TBRoom.InitAll;
begin
  Init(l,w);
  if (lb=0) or (wb=0) then
    PB:=nil
  else
    begin
      New(pB);
      pB^.Init(lb,wb);
    end;
end;
Function TBRoom.BSquare;
begin
  if pB=nil then
    BSquare:=Square;
  else
    BSquare:=Square+pB^.Square;
end;
var B:TBRoom;  {объявляем объект-переменную}

begin
  B.InitAll(3.4,5.1,1.8,0.8);  {инициализируем объект}
  writeln('Plotshad komnati s balkonom= ',B.BSquare);
end. 
