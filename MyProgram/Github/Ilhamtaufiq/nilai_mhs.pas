program Nilai_mahasiswa;
var
  nilaiAngka,nilaiMhs,absen,uas,tgs,uts: integer;
  ket,namaMhs: String;
  gradeMhs:char;
  {ratarata: real;}
begin
  writeln('====================================');
  writeln('PROGRAM MENGHITUNG NILAI ANGKA MAHASISWA');
  writeln('====================================');
  writeln;
  write('Masukan Nama Mahasiswa : ');
  readln(namaMhs);
  write('Masukan Nilai Mahasiswa : ');
  readln(nilaiMhs);
  write('Nilai Angka Absensi : ');
  readln(absen);
  write('Nilai Angka Tugas Harian : ');
  readln(tgs);
  write('Nilai Angka UTS : ');
  readln(uts);
  write('Nilai Angka UAS : ');
  readln(uas);

  nilaiAngka:= (10*absen+15*tgs+25*uts+50*uas) div 100;
  if nilaiAngka > 85 then
  begin
    gradeMhs:='A';
  end
  else if (nilaiAngka > 75) and (nilaiAngka <= 85) then
  begin
    gradeMhs:='B';
  end
  else if (nilaiAngka > 65) and (nilaiAngka <= 75) then
  begin
    gradeMhs:= 'C';
  end
  else if (nilaiAngka > 50) and (nilaiAngka <= 65) then
  begin
    gradeMhs:= 'D';
  end
  else if (nilaiAngka > 0) and (nilaiAngka <= 50) then
  begin
    gradeMhs:= 'E';
  end
  else
    gradeMhs:= 'F';

  case nilaiAngka of
    85..100 : ket:=('Sangat Baik');
    75..84 : ket:=('Baik');
    65..74 : ket:=('Cukup');
    else
    ket:=('Tidak Lulus');
  end;
  writeln;
  writeln('MAKA HASILNYA ADALAH :');
  writeln('======================');
  writeln('Hasil nilai akhir ' ,namaMhs, ' adalah ' ,nilaiAngka);
  writeln('Grade Mahasiswa yang didapat adalah ' ,gradeMhs, ' maka anda dinyatakan ' ,ket);
  readln;
end. 
