Help():- write("Fungsi yang dapat dipakai: "), nl.
Help():- write("start. -- memulai permainan"), nl.
Help():- write("help. -- menunjukkan fungsi-fungsi yang ada"), nl.
Help():- write("quit. -- mengakhiri permainan"), nl.
Help():- write("look. -- melihat sekitar pemain"), nl.
Help():- write("n. s. e. w. -- bergerak(n=utara, s=selatan, e=timur, w=barat)"), nl.
Help():- write("map. -- melihat peta dan mendeteksi musuh"), nl.
Help():- write("take(Objek). -- mengambil objek tersebut"), nl.
Help():- write("drop(Objek). -- menjatuhkan objek tersebut"), nl.
Help():- write("use(Objek). -- menggunakan objek tersebut"), nl.
Help():- write("attack. -- menyerang musuh yang terlihat"), nl.
Help():- write("status. -- menunjukkan status pemain"), nl.
Help():- write("save(Filename). -- menyimpan game"), nl.
Help():- write("load(Filename). -- memulai kembali game yang telah disimpan sebelumnya"), nl.
Help():- nl.
Help():- write("Legenda: "), nl.
Help():- write("W = senjata"), nl.
Help():- write("A = pelindung"), nl.
Help():- write("M = obat"), nl.
Help():- write("O = peluru"), nl.
Help():- write("P = pemain"), nl.
Help():- write("E = musuh"), nl.
Help():- write("- = dapat diakses"), nl.
Help():- write("X = tidak dapat diakses"), nl.

Status():- write("Nyawa: "), write(Health), nl.
Status():- write("Pelindung: "), write(Armor), nl.
Status():- write("Senjata: "), write(Weapon), nl.
