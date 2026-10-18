program TheUltimateBrainrotDetector;
uses crt;
var pilihan, jawaban, kunci: char;
    i, skor, nyawa, streak, totalBenar: integer;

procedure Menu;
begin
  clrscr;
  writeln('========================================');
  writeln('       The Ultimate Brainrot Detector');
  writeln('========================================');
  writeln('1. Mulai Quiz');
  writeln('2. Lihat Gelar Brainrot');
  writeln('3. Cara Bermain');
  writeln('4. Keluar');
  write('Pilih menu [1-4]: ');
end;

procedure CaraBermain;
begin
  clrscr;
  writeln('Ada 10 pertanyaan. Jawab A, B, C, atau D.');
  writeln('Jawaban benar mendapat 1 poin.');
  writeln('Kamu mulai dengan 3 nyawa.');
  writeln('Jawaban salah mengurangi 1 nyawa.');
  writeln('Tiga jawaban benar berturut-turut memberi bonus 2 poin.');
  write('Tekan ENTER untuk kembali...');
  readln;
end;

procedure Gelar;
begin
  clrscr;
  writeln('0-2 poin  : NPC MAGANG');
  writeln('3-5 poin  : CASUAL SCROLLER');
  writeln('6-8 poin  : CERTIFIED BRAINROT');
  writeln('9-11 poin : SIGMA OVERLORD');
  writeln('12+ poin  : BRAINROT FINAL BOSS');
  write('Tekan ENTER untuk kembali...');
  readln;
end;

procedure Pertanyaan(n: integer);
begin
  writeln;
  writeln('PERTANYAAN ', n, ' DARI 10');
  case n of
    1: begin writeln('Apa yang berkaitan dengan meme Skibidi?');
         writeln('A. Toilet  B. Kulkas  C. Pohon  D. Sepatu'); end;
    2: begin writeln('Apa maksud "skill issue"?');
         writeln('A. Komputer rusak  B. Kurang kemampuan');
         writeln('C. Tidur  D. Meminta makanan'); end;
    3: begin writeln('Apa arti NPC dalam konteks game?');
         writeln('A. Pemain hebat  B. Makanan');
         writeln('C. Karakter non-pemain  D. Komputer'); end;
    4: begin writeln('Apa maksud "bro is cooked"?');
         writeln('A. Memasak  B. Sedang dalam masalah');
         writeln('C. Berenang  D. Menang lotre'); end;
    5: begin writeln('Apa maksud "touch grass"?');
         writeln('A. Berhenti online dan keluar sebentar');
         writeln('B. Membeli tanaman  C. Main bola  D. Menyiram PC'); end;
    6: begin writeln('Kamu cek jam di HP lalu scroll 2 jam. Apa yang terjadi?');
         writeln('A. HP mundur  B. Kamu terdistraksi');
         writeln('C. Jadi astronot  D. Internet hilang'); end;
    7: begin writeln('Apa arti "rizz"?');
         writeln('A. Kemampuan memikat  B. Kendaraan');
         writeln('C. Planet  D. Alarm'); end;
    8: begin writeln('Apa maksud "let him cook"?');
         writeln('A. Cuci piring  B. Biarkan dia melanjutkan');
         writeln('C. Matikan PC  D. Ajak tidur'); end;
    9: begin writeln('Apa arti "delulu"?');
         writeln('A. Lapar  B. Terlalu percaya pada khayalan');
         writeln('C. Mengantuk  D. Sinyal hilang'); end;
    10: begin writeln('Apa fungsi utama mahasiswa membuka laptop pukul 23.58 ketiga tugas dikumpulkan pukul 23.59?');
          writeln('A. Belajar pemrograman tingkat lanjut  B. Mengembangkan aplikasi masa depan');
          writeln('C. Menguji kecepatan internet kampus  D. Mengalami transformasi menjadi manusia paling produktif di dunia'); end;
  end;
end;

procedure MulaiQuiz;
begin
  skor := 0; nyawa := 3; streak := 0; totalBenar := 0;
  clrscr;
  writeln('CHAOS MODE DIMULAI! Kamu punya 3 nyawa.');
  write('Tekan ENTER untuk mulai...');
  readln;

  //FOR: mengulang pertanyaan 1 sampai 10.
  for i := 1 to 10 do
  begin
    if nyawa <= 0 then
      break; 
       //BREAK: berhenti jika nyawa habis. 

    clrscr;
    writeln('Skor: ', skor, ' | Nyawa: ', nyawa, ' | Streak: ', streak);
    Pertanyaan(i);
    case i of
      1: kunci := 'A'; 2: kunci := 'B'; 3: kunci := 'C';
      4: kunci := 'B'; 5: kunci := 'A'; 6: kunci := 'B';
      7: kunci := 'A'; 8: kunci := 'B'; 9: kunci := 'B';
      10: kunci := 'D';
    end;

    write('Jawabanmu: ');
    readln(jawaban);
    jawaban := UpCase(jawaban);

//WHILE: memastikan jawaban hanya A/B/C/D.
    while not (jawaban in ['A','B','C','D']) do
    begin
      write('Input tidak valid. Masukkan A, B, C, atau D: ');
      readln(jawaban);
      jawaban := UpCase(jawaban);
    end;

    if jawaban = kunci then
    begin
      writeln('BENAR! +1 POIN');
      skor := skor + 1;
      totalBenar := totalBenar + 1;
      streak := streak + 1;
      if streak = 3 then
      begin
        skor := skor + 2;
        writeln('STREAK 3! BONUS +2 POIN!');
        streak := 0;
      end;
    end
    else
    begin
      writeln('SALAH! Jawaban benar: ', kunci);
      nyawa := nyawa - 1;
      streak := 0;
    end;
    write('Tekan ENTER untuk lanjut...');
    readln;
  end;

  clrscr;
  writeln('============= HASIL KUIS =============');
  writeln('Jawaban benar : ', totalBenar, ' dari 10');
  writeln('Nyawa tersisa : ', nyawa);
  writeln('Skor akhir    : ', skor);
  if nyawa = 0 then writeln('GAME OVER! Nyawamu habis.')
  else writeln('KUIS SELESAI!');

//IF bertingkat: menentukan gelar dari skor.
  if skor <= 2 then writeln('Gelar: NPC MAGANG')
  else if skor <= 5 then writeln('Gelar: CASUAL SCROLLER')
  else if skor <= 8 then writeln('Gelar: CERTIFIED BRAINROT')
  else if skor <= 11 then writeln('Gelar: SIGMA OVERLORD')
  else writeln('Gelar: BRAINROT FINAL BOSS');

  if (totalBenar = 10) and (nyawa = 3) then
  begin
    writeln('SECRET ENDING: BRO IS BUILT DIFFERENT!');
    writeln('100% BRAINROT!');
  end;
  write('Tekan ENTER untuk kembali ke menu...');
  readln;
end;

begin
//REPEAT-UNTIL: menu berulang sampai pilihan 4.
  repeat
    Menu;
    readln(pilihan);
//WHILE: validasi pilihan menu.
    while not (pilihan in ['1','2','3','4']) do
    begin
      write('Pilihan salah. Masukkan 1-4: ');
      readln(pilihan);
    end;
    case pilihan of
      '1': MulaiQuiz;
      '2': Gelar;
      '3': CaraBermain;
      '4': writeln('Terima kasih sudah bermain. Stay brainrot, bro!');
    end;
  until pilihan = '4';
  writeln('Program selesai.');
end.
