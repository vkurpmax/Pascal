program login_sistem;
uses crt;
var id,passid,user: string;
x,I: integer;


begin
  id:= 'rysasahrial';
  passid:= 'hexa';
  x:=0;
  for i:=1 to 3 do;
  begin
    clrscr;
    writeln('Silahkan login dengan akun anda');
    writeln('==============================');
    writeln;
    write('UserName : ');readln(user);
    write('Password : ');readln(passid);
    if id=user then
    begin
      if passid=passid then
      begin
        x:= 1;
      end;
    end
    else
    begin
      writeln('Id atau password tidak cocok');
    end;
  writeln;
  end;
if x=0 then
begin
writeln('Maaf !! anda sudah melebihi kesalahan input data 3x');
end
else if x=1 then
begin
writeln('Selamat Datang, ',id,'!');
end;
readln;
end. 
