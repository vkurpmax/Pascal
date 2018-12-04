var
   p,l,t,v:integer;                  // Deklarasi variabel dengan semua variabel bertipe integer
begin
   writeln('Masukkan nilai panjang');
   readln(p);                        // Input nilai p
   writeln('Masukkan nilai lebar');
   readln(l);                        // Input nilai l
   writeln('Masukkan nilai tinggi');
   readln(t);                        // Input nilai t
   v := p * l * t;                   // Operasi matematika : v = p kali l kali t
   writeln(v);                       // Tampilkan nilai v
   readln;                           // Supaya pembaca dapat membaca nilai v sebelum program otomatis keluar
end.
