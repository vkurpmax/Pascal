// studi kasus if-else statement, constanta dan repeat-until di bahasa pascal
program SIP;
uses crt;
var
  gol,respon,nama: String;
  nip,kel,potongan_koperasi: Integer; //kel = jumlah anggota keluarga

const //pengelompokan besaran gaji yang diterima berdasarkan golongan
  gaji_gol1 = 1000000; //gaji pokok
  tun_kel1 = 50000; //tunjangan keluarga
  gaji_gol2 = 2000000;
  tun_kel2 = 75000;
  gaji_gol3 = 3000000;
  tun_kel3 = 100000;
  gaji_gol4 = 4000000;
  tun_kel4 = 125000;
  gaji_gol5 = 5000000;
  tun_kel5 = 150000;

begin
  repeat
    clrscr;
    writeln('========= Sistem Informasi Penggajian ========');
    write('NIP = ');
    readln(nip);
    write('Nama = ');
    readln(nama);
    write('Golongan = ');
    readln(gol);
    write('Jumlah Anggota Keluarga = ');
    readln(kel);
    write('Potongang Koperasi = ');
    readln(potongan_koperasi);

    if gol = '1' then
      writeln('Bapak/Ibu ',nama,' gaji anda sebesar = ',gaji_gol1+tun_kel1*kel-potongan_koperasi);
    if gol = '2' then
      writeln(nama,' gaji anda ',gaji_gol2+tun_kel2*kel);
    if gol = '3' then
      writeln('gaji anda ',gaji_gol3+tun_kel3*kel);
    if gol = '4' then
      writeln('gaji anda ',gaji_gol4+tun_kel4*kel);
    if gol = '5' then
      writeln('gaji anda ',gaji_gol5+tun_kel5*kel)
    else
      writeln('pilihan salah');
    writeln('Ingin mengulangi?, ya/tidak');
    readln(respon);
  until (respon = 'tidak') or (respon = 'Tidak')
end.  
