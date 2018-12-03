program penjumlahan;
var nilai1, nilai2, nilai3, hasil : real; //Tipe data real
begin
write('Masukan Nilai Tugas : ');readln(nilai1); //Masukan Nilai Tugas
write('Masukan Nilai UTS : ');readln(nilai2);	//Masukan Nilai UTS
write('Masukan Nilai UAS : ');readln(nilai3);	//Masukan Nilai UAS
hasil := (nilai1*15/100)+(nilai2*35/100)+(nilai3*50/100);	//Semua Nilai Diproeses
writeln('Jumlah Nilai : ', hasil:0:2); //Print Hasil Nilai
readln;
end.
