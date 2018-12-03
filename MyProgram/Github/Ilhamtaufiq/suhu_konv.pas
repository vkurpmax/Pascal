program Konversi_suhu;
var
  pil: Integer;
begin
  writeln('=====================================');
  writeln(' Menu Konversi Suhu ');
  writeln('=====================================');
  writeln('1. Celcius to Reamur');
  writeln('2. Celcius to Farhenheit');
  writeln('3. Celcius to Celvin');
  writeln;
  write('Silahkan Pilih Menu = ');
  readln(pil);

  case pil of
    1: writeln('Anda telah memilih menu Celcius to Reamur');
    2: writeln('Anda telah memilih menu Celcius to Farhenheit');
    3: writeln('Anda telah memilih menu Celcius to Celvin');
  else
  writeln('pilihan salah');
  end;
  writeln('=====================================');
  readln;
end.     
