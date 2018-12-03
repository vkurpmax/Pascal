program Nilai_mahasiswa;
var nilaiAngka,gradeMhs,absen,uas,tgs,uts: integer;
ket: String;
//nilaiAngka: Real;
namaMhs: Char;
ratarata: real;
begin
writeln('====================================');
writeln('PROGRAM MENGHITUNG NILAI ANGKA MAHASISWA');
writeln('====================================');
writeln();
write('Masukan Nama Mahasiswa : ');readln(namaMhs);
write('Masukan Nilai Mahasiswa'); readln(gradeMhs);
write('Nilai Angka Absensi : ');readln(tgs);
write('Nilai Angka Tugas Harian : ');readln(absen);
write('Nilai Angka UTS : ');readln(uts);
write('Nilai Angka UAS : ');readln(uas);
nilaiAngka:= (10*absen+15*tgs+25*uts+50*uas) div 100;
if nilaiAngka > 85 then
begin
namaMhs:='A';
end
else if (nilaiAngka > 75) and (nilaiAngka < 85) then
begin
namaMhs:= 'B';
end
else if (nilaiAngka > 65) and (nilaiAngka < 75) then
begin
namaMhs:= 'C';
end
else if (nilaiAngka > 50) and (nilaiAngka < 65) then
begin
namaMhs:= 'D';
end
else if (nilaiAngka > 0) and (nilaiAngka < 50) then
begin
namaMhs:= 'E';
end
else
namaMhs:= 'F';

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
