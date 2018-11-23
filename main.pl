/*deklarasi dynamic udh di nwse.pl*/

/* kurang bikin move */
:- dynamic player/6, cfield/1, move/1, enemy/2.
:- retractall(player(_,_,_,_,_)), retractall(cfield(_)).

/*Definisi Player(X,Y,Health,Armor,Weapon, Ammo)*/
player(1,1,100,0,ak47, 5).
cfield(1).
move(0).
/*Definisi enemy(X,Y,Weapon,Health)*/
enemy(1,2,Pistol,100).

start :- S is 12,
        cfield(CField), 
        random(2,S,X),
        random(2,S,Y),
        player(_,_,Health,Armor,Weapon),
        retract(player(_,_,Health,Armor,Weapon)),
        assert(player(X,Y,Health,Armor,Weapon)),
        write('Selamat datang di medan peperangan!'),nl,
        write('Silakan jalankan perintah yang Anda inginkan'),nl,nl,
        help(),
        map(1,1,S,CField,X,Y).
         /*repeat,
           write('> '),
           read(Command),
           (
            (Command == map, map(1,1,S,CField,X,Y),fail);
			      (Command == look, fail);
		        (Command == help, help('Ini help'),fail);
		        (Command == quit, !)
		   ).*/ 

posisi(X,Y):- cfield(Z),((12-Z=:=X);(12-Z=:=Y);(Z=:=Y);(Z=:=X)),!,write("Dunia Lain").
posisi(X,Y):- X<6,X>2,Y<12,Y>5,!,write("Hutan").
posisi(X,Y):- X<6,X>2,Y<5,Y>2,!,write("Rawa").
posisi(X,Y):- X<10,X>6,Y<5,Y>2,!,write("Pedesaan").
posisi(X,Y):- X<10,X>6,Y<12,Y>5,!,write("Pantai").
posisi(X,Y):- write("Gurun").

cek(X,Y):- A is X+1, B is X-1, C is Y+1, D is Y-1, write("Utara kamu adalah "),posisi(X,D),nl,write("Selatan kamu adalah "),posisi(X,C),nl,write("Barat kamu adalah "),posisi(B,Y),nl,write("Timur kamu adalah "),posisi(A,Y),nl.

n():-player(X,Y,M,N,O), retract(player(X,Y,M,N,O)), Z is Y-1,assert(player(X,Z,M,N,O)),write("Kamu sekarang berada di "),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),assert(move(B)).
s():-player(X,Y,M,N,O), retract(player(X,Y,M,N,O)), Z is Y+1,assert(player(X,Z,M,N,O)),write("Kamu sekarang berada di "),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),assert(move(B)).
e():-player(X,Y,M,N,O), retract(player(X,Y,M,N,O)), Z is X+1,assert(player(Z,Y,M,N,O)),write("Kamu sekarang berada di "),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),assert(move(B)).
w():-player(X,Y,M,N,O), retract(player(X,Y,M,N,O)), Z is X-1,assert(player(Z,Y,M,N,O)),write("Kamu sekarang berada di "),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),assert(move(B)).      
		   
help:-write("Fungsi yang dapat dipakai: "), nl,
      write("start -- memulai permainan"), nl,
      write("help -- menunjukkan fungsi-fungsi yang ada"), nl,
      write("quit -- mengakhiri permainan"), nl,
      write("look -- melihat sekitar pemain"), nl,
      write("n, s, e, w, -- bergerak(n=utara, s=selatan, e=timur, w=barat)"), nl,
      write("map, -- melihat peta dan mendeteksi musuh"), nl,
      write("take(Objek), -- mengambil objek tersebut"), nl,
      write("drop(Objek), -- menjatuhkan objek tersebut"), nl,
      write("use(Objek), -- menggunakan objek tersebut"), nl,
      write("attack, -- menyerang musuh yang terlihat"), nl,
      write("status, -- menunjukkan status pemain"), nl,
      write("save(Filename), -- menyimpan game"), nl,
      write("load(Filename), -- memulai kembali game yang telah disimpan sebelumnya"), nl,
      nl,
      write("Legenda: "), nl,
      write("W = senjata"), nl,
      write("A = pelindung"), nl,
      write("M = obat"), nl,
      write("O = peluru"), nl,
      write("P = pemain"), nl,
      write("E = musuh"), nl,
      write("- = dapat diakses"), nl,
      write("X = tidak dapat diakses"), nl.

status :-  player(_,_,Health,Armor,Weapon),
           write("Nyawa: "), write(Health), nl,
           write("Pelindung: "), write(Armor), nl,
           write("Senjata: "), write(Weapon), nl.
           write("Peluru: "), write(Ammo), nl.


drawmap :- cfield(CField), player(X,Y,_,_,_), map(1,1,12,CField,X,Y).

map(Brs,_,X,_,_,_) :- Brs>X. /* Basis */
map(Brs,Kol,X,CField,Px,Py) :- (Kol =< CField ; Kol >= X-CField+1; Brs =< CField; Brs >= X-CField+1), write('X'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.
map(Brs,Kol,X,CField,Px,Py) :- Brs =:= Py, Kol =:= Px, write('P'),(K is Kol+1, map(Brs,K,X,CField,Px,Py)),!.
map(Brs,Kol,X,CField,Px,Py) :- write('-'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.

quit :- halt.