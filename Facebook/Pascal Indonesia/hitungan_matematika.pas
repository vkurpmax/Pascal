program hitungan_matematika;
uses crt;
var
  menu : integer;
  ulang : char;
  a,t,h : real;
  p,l,v:real;
  s,j:real;
  al,tg,lu:real;
procedure luas_segitiga;
begin
  repeat
    clrscr;
    writeln ('Menghitung Luas Segitiga');
    write ('Masukan Nilai Alas : ');readln(a);
    write ('Masukan Nilai Tinggi :');readln(t);
    writeln ('Rumus : a*t/2');
    h:=a*t/2;
    writeln ('Luas Segitiga Adalah :',h:0:0);
    write (' ulang lagi[y/n]?'); readln (ulang);
  until upcase (ulang) <>'Y';
end;

procedure volume_balok;
begin
  repeat
    clrscr;
    writeln ('Menghitung Volume Balok ');
    write ('Masukan Nilai Panjang :');readln (p);
    write ('Masukan Nilai Tinggi :');readln(l);
    write ('Masukan Nilai Lebar :');readln(t);
    writeln ('Rumus : p*l*t');
    v :=p*l*t;
    writeln ('Volume Balok adalah :',v:0:0);
    write (' ulang lagi[y/n]?'); readln (ulang);
  until upcase (ulang) <>'Y';
end;

procedure volume_kubus;
begin
  repeat
    clrscr;
    writeln ('Menghitung Volume kubus ');
    write ('Masukan Nilai sisi :');readln (s);
    writeln ('Rumus : s*s*s');
    j:=s*s*s;
    writeln ('Volume kubus adalah :',j:0:0);
    write (' ulang lagi[y/n]?'); readln (ulang);
  until upcase (ulang) <>'Y';
end;

procedure luas_jajar_genjang;
begin
  repeat
    clrscr;
    writeln ('Menghitung luas jajar genjang ');
    write ('Masukan Nilai alas :');readln (al);
    write ('Masukan Nilai Tinggi :');readln(tg);
    writeln ('Rumus : a*t');
    lu:=al*tg;
    writeln ('jadi luas jajar genjang adalah :',lu:0:0);
    write (' ulang lagi[y/n]?'); readln (ulang);
  until upcase (ulang) <>'Y';
end;

procedure menu_utama;
begin
  clrscr;
  writeln ('Menu Utama');
  writeln ('1. Luas Segitiga ');
  writeln ('2. Volume Balok');
  writeln ('3. volume kubus');
  writeln ('4. luas jajar genjang ');
  writeln ('5. keluar');
  writeln;
  write ('Pilih Menu :');readln(menu);
  case menu of
    1: begin
    luas_segitiga;
    menu_utama;
    end;
    2:begin
    volume_balok;
    menu_utama;
    end;
    3:begin
    volume_kubus;
    menu_utama;
    end;
    4: begin
    luas_jajar_genjang;
    menu_utama;
    end;
    5: exit;
    end;
end;



begin
  clrscr;
  menu_utama;
end. 
