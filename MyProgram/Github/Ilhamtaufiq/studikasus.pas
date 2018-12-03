program hitung_luas;
uses crt;

var
  r,p,l,LPersegi,LPersegiPanjang,s,a,t: Integer;
  pil: Char; //Pilihan
  respon: String; //Respon untuk mengulangi ketika terjadi kesalahan input
  LLingkaran, LSegitiga: Real;
const
  pi = 3.14; //Nilai pi (lingkaran)
begin
  repeat
    clrscr;
    writeln('=====[Menghitung Luas Sebuah Bangun Datar]=====');
    writeln('a. Menghitung Luas Persegi');
    writeln('b. Menghitung Luas Persegi Panjang');
    writeln('c. Menghitung Luas Lingkaran');
    writeln('d. Menghitung Luas Segitiga');
    writeln('===============================================');
    write('Silahkan pilih salah satu = ');
    readln(pil);

    if pil='a' then
    begin
      writeln('Menghitung Luas Persegi');
      write('sisi = ');
      readln(s);
      LPersegi:=sqr(s);
      writeln('Hasil: ',LPersegi);
    end
    else if pil='b' then
    begin
      writeln('Menghitung Luas Persegi Panjang');
      write('Panjang = ');
      readln(p);
      write('Lebar = ');
      readln(l);
      LPersegiPanjang:=p*l;
      writeln('Hasil ',LPersegiPanjang)
    end
    else if pil='c'then
    begin
      writeln('Menghitung Luas Lingkaran');
      write('radius = ');
      readln(r);
      LLingkaran:=pi*sqr(r);
      writeln('Hasil ',LLingkaran:0:2)
    end
    else if pil='d' then
    begin
      writeln('Menghitung Luas Segitiga');
      write('Alas = ');
      readln(a);
      write('Tinggi = ');
      readln(t);
      LSegitiga:=0.5*a*t;
      writeln('Hasil ',LSegitiga:0:2)
    end
    else
    begin
      writeln('Pilihan yang anda masukkan salah, ulangi?');
      write('ya/tidak = ');
      readln(respon);
    end;
  until (respon = 'tidak') or (respon = 'Tidak')
end. 
