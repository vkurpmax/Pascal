program SIP;
var
nama,respon: String;
gol: Char;

const //pengelompokan besaran gaji yang diterima berdasarkan golongan
gaji_gol1 = 5000000; //gaji pokok
tun_gol1 = 750000; //tunjangan keluarga
isentif1 = 350000;
gaji_gol2 = 4000000;
tun_gol2 = 500000;
isentif2 = 250000;
gaji_gol3 = 3000000;
tun_gol3 = 300000;
isentif3 = 150000;


begin
repeat
writeln('========= Aplikasi Penggajian ========');
write('Nama = ');readln(nama);
write('Golongan = ');readln(gol);
if gol = '1' then
begin
writeln('Pegawai dengan nama ',nama,' Memiliki Pendapatan = Rp.',gaji_gol1+tun_gol1+isentif1);
writeln('Gaji Pokok = Rp.',gaji_gol1);
writeln('Tunjangan = Rp.',tun_gol1);
writeln('Isentif = Rp.',isentif1);
end
else if gol = '2' then
begin
writeln('Pegawai dengan nama ',nama,' Memiliki Pendapatan = Rp.',gaji_gol2+tun_gol2+isentif2);
writeln('Gaji Pokok = Rp.',gaji_gol2);
writeln('Tunjangan = Rp.',tun_gol2);
writeln('Isentif = Rp.',isentif2);
end
else if gol = '3' then
begin
writeln('Pegawai dengan nama ',nama,' Memiliki Pendapatan = Rp.',gaji_gol3+tun_gol3+isentif3);
writeln('Gaji Pokok = Rp.',gaji_gol3);
writeln('Tunjangan = Rp.',tun_gol3);
writeln('Isentif = Rp.',isentif3);
end
else
begin
writeln('pilihan salah')
end;
readln;
writeln('Ingin mengulangi?, ya/tidak');readln(respon);
until (respon = 'tidak') or (respon = 'Tidak')
end. 
