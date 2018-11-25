/*SPARTA REMASTERED*/
/*From MVP Productions*/

/*--DEKLARASI FAKTA--*/

/*Definisi:player(X,Y,Health,Armor,Weapon,Ammo)*/
:- dynamic(player/6).
/*Definisi:cfield(AreaDaerahDanger)*/
:- dynamic(cfield/1). 
cfield(1).
/*Definisi:move(JumlahMoveDilakukan)*/
:- dynamic(move/1).
 move(0).
/*Definisi:inventory(ListInventory)*/
:- dynamic(inventory/1).
inventory([]).
/*Definisi:invLimit*/
:- dynamic(invLimit/1).
invLimit(10).
/*Definisi:object(X,Y,nama)*/
/*Mengeset sebuah object yang akan diisi dengan nama dan letak: ammo, enemy, medicine, weapon, dan armor*/
:- dynamic(object/3).
:- dynamic(kills/1).

/*Definisi:enemy(Nama,Weapon)*/
enemy(mamet,pistol).
enemy(danlap,ak47).
/*Definisi:medicine(Nama,HealthIncrease)*/
medicine(antangin,10).
medicine(madurasa,50).
/*Definisi:weapon(Nama,Damage)*/
weapon(pistol,15).
weapon(ak47,25).
/*Definisi:armor(Nama,AngkaPerlindungan)*/
armor(jakang,15).
armor(slayer,40).
/*Definisi:ammo(nama,WeaponYangCocok)*/
ammo(ammo1,pistol).
ammo(ammo2,ak47).

/*--DEKLARASI RULE--*/

start   :-  Si is 12,
            S is Si-1,

            write('  _________                    __           __________                               __                   .___'),nl,
	    write(' /   ________________ ________/  |______    \\______   \\ ____   _____ _____    ______/  |_  ___________  __| _/'),nl,
	    write(' \\_____  \\ ____ \\__  \\ _  __ \\   __\\__  \\    |       __/ __ \\ /     \\ __  \\  /  ___\\   ___/ __ \\_  __ \\/ __ | '),nl,
	    write(' /        |  |_> / __ \\|  | \\/|  |  / __ \\_  |    |   \\  ___/|  Y Y  \\/ __ \\_\\___ \\ |  | \\  ___/|  | \\/ /_/ | '),nl,
	    write('/_______  |   __(____  |__|   |__| (____  /  |____|_  /\\___  |__|_|  (____  /____  >|__|  \\___  |__|  \\____ | '),nl,
	    write('        \\/|__|       \\/                 \\/          \\/     \\/      \\/     \\/     \\/           \\/           \\/ '),nl,
      
            /*Insialiasi jumlah kills*/
            asserta(kills(0)),

            /*Menginisialisasi Lokasi Player*/
            random(2,S,X),
            random(2,S,Y),
            asserta(player(X,Y,25,0,ak47,15)),

            /*Menginisialisasi Lokasi Enemy*/
            random(2,S,Xe1),
            random(2,S,Ye1),
            random(2,S,Xe2),
            random(2,S,Ye2),
            asserta(object(Xe1, Ye1, mamet)),
            asserta(object(Xe2, Ye2, danlap)),

            /*Menginisialisasi Lokasi Medicine*/
            /*Mengeset lokasi 6 buah medicine antangin*/
            random(2,S,Xm1a),
            random(2,S,Ym1a),
            assertz(object(Xm1a, Ym1a, antangin)),
            random(2,S,Xm1b),
            random(2,S,Ym1b),
            assertz(object(Xm1b, Ym1b, antangin)),
            random(2,S,Xm1c),
            random(2,S,Ym1c),
            assertz(object(Xm1c, Ym1c, antangin)),
            random(2,S,Xm1d),
            random(2,S,Ym1d),
            assertz(object(Xm1d, Ym1d, antangin)),
            /*Mengeset Lokasi 2 buah medicine madurasa*/
            random(2,S,Xm2a),
            random(2,S,Ym2a),
            assertz(object(Xm2a, Ym2a, madurasa)),
            random(2,S,Xm2b),
            random(2,S,Ym2b),
            assertz(object(Xm2b, Ym2b, madurasa)),

            /*Menginisialisasi lokasi weapon*/
            /*Mengeset lokasi 4 buah pistol*/
            random(2,S,Xw1a),
            random(2,S,Yw1a),
            assertz(object(Xw1a, Yw1a, pistol)),
            random(2,S,Xw1b),
            random(2,S,Yw1b),
            assertz(object(Xw1b, Yw1b, pistol)),
            random(2,S,Xw1c),
            random(2,S,Yw1c),
            assertz(object(Xw1c, Yw1c, pistol)),
            /*Mengeset Lokasi 2 buah medicine ak47*/
            random(2,S,Xw2a),
            random(2,S,Yw2a),
            assertz(object(Xw2a, Yw2a, ak47)),

            /*Menginisialisasi lokasi armor*/
            /*Mengeset lokasi 3 armor jakang*/
            random(2,S,Xa1a),
            random(2,S,Ya1a),
            assertz(object(Xa1a, Ya1a, jakang)),
            random(2,S,Xa1b),
            random(2,S,Ya1b),
            assertz(object(Xa1b, Ya1b, jakang)),
            random(2,S,Xa1c),
            random(2,S,Ya1c),
            assertz(object(Xa1c, Ya1c, jakang)),
            /*mengeset lokasi 1 armor slayer*/
            random(2,S,Xa2d),
            random(2,S,Ya2d),
            assertz(object(Xa2d, Ya2d, slayer)),

            /*Menginisialisasi lokasi ammo*/
            /*Mengeset lokasi 6 buah ammo1(untuk pistol)*/
            random(2,S,Xo1a),
            random(2,S,Yo1a),
            assertz(object(Xo1a, Yo1a, ammo1)),
            random(2,S,Xo1b),
            random(2,S,Yo1b),
            assertz(object(Xo1b, Yo1b, ammo1)),
            random(2,S,Xo1c),
            random(2,S,Yo1c),
            assertz(object(Xo1c, Yo1c, ammo1)),
            random(2,S,Xo1d),
            random(2,S,Yo1d),
            assertz(object(Xo1d, Yo1d, ammo1)),
            random(2,S,Xo1e),
            random(2,S,Yo1e),
            assertz(object(Xo1e, Yo1e, ammo1)),
            random(2,S,Xo1f),
            random(2,S,Yo1f),
            assertz(object(Xo1f, Yo1f, ammo1)),
            /*Mengeset Lokasi 4 buah ammo2(untuk ak47)*/
            random(2,S,Xo2a),
            random(2,S,Yo2a),
            assertz(object(Xo2a, Yo2a, ammo2)),
            random(2,S,Xo2b),
            random(2,S,Yo2b),
            assertz(object(Xo2b, Yo2b, ammo2)),
            random(2,S,Xo2c),
            random(2,S,Yo2c),
            assertz(object(Xo2c, Yo2c, ammo2)),
            random(2,S,Xo2d),
            random(2,S,Yo2d),
            assertz(object(Xo2d, Yo2d, ammo2)), 

            write('Selamat datang di medan peperangan!'),nl,
            write('Silakan jalankan perintah yang Anda inginkan'),nl,nl,
            help,
            repeat,
            write('> '),
            read(Command),
            (
                (Command == map, drawmap,fail);
		    (Command == look, look, fail);
		    (Command == help, help, fail);
                (Command == n,n,fail);
                (Command == s,s,fail);
                (Command == e,e,fail);
                (Command == w,w,fail);
                (Command == status, status, fail);
                ((Command == take(pistol)), take(pistol), fail);
                ((Command == take(ak47)), take(ak47), fail);
                ((Command == take(antangin)), take(antangin), fail);
                ((Command == take(madurasa)), take(madurasa), fail);
                ((Command == take(jakang)), take(jakang), fail);
                ((Command == take(slayer)), take(slayer), fail);
                ((Command == take(ammo1)), take(ammo1), fail);
                ((Command == take(ammo2)), take(ammo2), fail);
                ((Command == use(pistol)), use(pistol), fail);
                ((Command == use(ak47)), use(ak47), fail);
                ((Command == use(antangin)), use(antangin), fail);
                ((Command == use(madurasa)), use(madurasa), fail);
                ((Command == use(jakang)), use(jakang), fail);
                ((Command == use(slayer)), use(slayer), fail);
                ((Command == use(ammo1)), use(ammo1), fail),                
                ((Command == use(ammo2)), use(ammo2), fail);
                ((Command == drop(pistol)), drop(pistol), fail);
                ((Command == drop(ak47)), drop(ak47), fail);
                ((Command == drop(antangin)), drop(antangin), fail);
                ((Command == drop(madurasa)), drop(madurasa), fail);
                ((Command == drop(jakang)), drop(jakang), fail);
                ((Command == drop(slayer)), drop(slayer), fail);
                ((Command == drop(ammo1)), drop(ammo1), fail),                
                ((Command == drop(ammo2)), drop(ammo2), fail);
                ((Command == attack), attack, fail);
                (Command == quit, !, halt)
	        ).


cek(X,Y):- A is X+1, 
            B is X-1, 
            C is Y+1, 
            D is Y-1, 
            write('Utara kamu adalah '),
            posisi(X,D),nl,
            write('Selatan kamu adalah '),
            posisi(X,C),nl,
            write('Barat kamu adalah '),
            posisi(B,Y),nl,
            write('Timur kamu adalah '),
            posisi(A,Y),nl.

failed :- write('Anda kalah di game ini, tapi menang di hati para penonton'), nl, halt.

n:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is Y-1,asserta(player(X,Z,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),asserta(move(B)),moveRandomDanlap, moveRandomMamet, ((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<X);(12-D+1=<Z);(Z=<D);(X=<D)), !, failed.
s:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is Y+1,asserta(player(X,Z,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),asserta(move(B)), moveRandomDanlap, moveRandomMamet,((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<X);(12-D+1=<Z);(Z=<D);(X=<D)), !, failed.
e:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is X+1,asserta(player(Z,Y,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),asserta(move(B)), moveRandomDanlap, moveRandomMamet,((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<Z);(12-D+1=<Y);(Y=<D);(Z=<D)), !, failed.
w:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is X-1,asserta(player(Z,Y,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),asserta(move(B)), moveRandomDanlap, moveRandomMamet,((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<Z);(12-D+1=<Y);(Y=<D);(Z=<D)), !, failed.

moveRandomMamet :- retract(object(X,Y,mamet)), randomize, random(-1,2,M), ((M =:=0,random(1,3,N),MoveY is N*2-3,Xa is X, Ya is Y+MoveY,assertz(object(Xa,Ya,mamet)),!);(Xa is X+M, Ya is Y,assertz(object(Xa,Ya,mamet)))).
moveRandomDanlap :- retract(object(X,Y,danlap)),randomize, random(-1,2,M), ((M =:=0,random(1,3,N),MoveY is N*2-3,Xa is X, Ya is Y+MoveY,assertz(object(Xa,Ya,danlap)),!);(Xa is X+M, Ya is Y,assertz(object(Xa,Ya,danlap)))).

posisi(X,Y):- cfield(Z),((12-Z+1=:=X);(12-Z+1=:=Y);(Z=:=Y);(Z=:=X)),!,write('Zona Pencoretan').
posisi(X,Y):- X<6,X>2,Y<12,Y>5,!,write('Ding Dong').
posisi(X,Y):- X<6,X>2,Y<5,Y>2,!,write('Kandang Domba').
posisi(X,Y):- X<10,X>6,Y<5,Y>2,!,write('Sabuga').
posisi(X,Y):- X<10,X>6,Y<12,Y>5,!,write('7602').
posisi(_,_):- write('Labtek VIII').

help:-write('Fungsi yang dapat dipakai: '), nl,
      write('start -- memulai permainan'), nl,
      write('help -- menunjukkan fungsi-fungsi yang ada'), nl,
      write('quit -- mengakhiri permainan'), nl,
      write('look -- melihat sekitar pemain'), nl,
      write('n, s, e, w, -- bergerak(n=utara, s=selatan, e=timur, w=barat)'), nl,
      write('map, -- melihat peta dan mendeteksi musuh'), nl,
      write('take(Objek), -- mengambil objek tersebut'), nl,
      write('drop(Objek), -- menjatuhkan objek tersebut'), nl,
      write('use(Objek), -- menggunakan objek tersebut'), nl,
      write('attack, -- menyerang musuh yang terlihat'), nl,
      write('status, -- menunjukkan status pemain'), nl,
      write('save(Filename), -- menyimpan game'), nl,
      write('load(Filename), -- memulai kembali game yang telah disimpan sebelumnya'), nl, nl,
      write('Legenda: '), nl,
      write('W = senjata'), nl,
      write('A = pelindung'), nl,
      write('M = obat'), nl,
      write('O = peluru'), nl,
      write('P = pemain'), nl,
      write('E = musuh'), nl,
      write('- = dapat diakses'), nl,
      write('X = tidak dapat diakses'), nl.

drawmap :- cfield(CField), player(X,Y,_,_,_,_), map(1,1,12,CField,X,Y).

map(Brs,_,X,_,_,_) :- Brs>X. /* Basis */
map(Brs,Kol,X,CField,Px,Py) :- (Kol =< CField ; Kol >= X-CField+1; Brs =< CField; Brs >= X-CField+1), write('X'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.
map(Brs,Kol,X,CField,Px,Py) :- Brs =:= Py, Kol =:= Px, write('P'),(K is Kol+1, map(Brs,K,X,CField,Px,Py)),!.
map(Brs,Kol,X,CField,Px,Py) :- write('-'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.

/*Kurang fakta dari,enemy,medicine,weapon,armor,ammo*/
lihat(X,Y):- object(X,Y,Nama), enemy(Nama,_),!,write('Kamu melihat seorang '), write(Nama), write('.'), nl.
lihat(X,Y):- object(X,Y,Nama), medicine(Nama,_),!,write('Kamu melihat obat '),write(Nama),write('.'), nl.
lihat(X,Y):- object(X,Y,Nama), weapon(Nama,_),!,write('Kamu melihat senjata '),write(Nama),write('.'), nl.
lihat(X,Y):- object(X,Y,Nama), armor(Nama,_),!,write('Kamu melihat pelindung '),write(Nama),write('.'), nl.
lihat(X,Y):- object(X,Y,Nama), ammo(Nama,_),!,write('Kamu melihat amunisi '), write(Nama),write('.'),nl.
lihat(_,_):- true.

tulis(X,Y):- cfield(Z),((12-Z+1=<X);(12-Z+1=<Y);(Y=<Z);(X=<Z)),!,write('#').
tulis(X,Y):- object(X,Y,Nama), enemy(Nama,_),!,write('E').
tulis(X,Y):- object(X,Y,Nama), medicine(Nama,_),!,write('M').
tulis(X,Y):- object(X,Y,Nama), weapon(Nama,_),!,write('W').
tulis(X,Y):- object(X,Y,Nama), armor(Nama,_),!,write('A').
tulis(X,Y):- object(X,Y,Nama), ammo(Nama,_),!,write('O').
tulis(X,Y):- player(X,Y,_,_,_,_), !,write('P').
tulis(_,_):- write('-').

take(X) :- invLimit(N), N > 0, !, (player(A,B,_,_,_,_), object(A,B,X)), !, inventory(I),
            retract(inventory(_)), asserta(inventory([X|I])).
take(X) :- (\+player(A,B,_,_,_,_);\+object(A,B,X)), write('Objek yang ingin diambil tidak ada ').
take(_) :- write('Inventory anda sudah penuh').

search([X|_], X).
search([], _) :- false.
search([_|B], X) :- search(B, X).

use(X) :- medicine(X,_), inventory(I), search(I, X), !, player(X,Y,H,A,W,Am), Nh is H+10, retract(player(_,_,_,_,_,_)), asserta(player(X,Y,Nh,A,W,Am)).
use(X) :- weapon(X,_), inventory(I), search(I, X), !.
use(X) :- armor(X,_), inventory(I), search(I, X), !.
use(X) :- ammo(X,_), inventory(I), search(I, X), !.
use(X) :- ammo(X,_), inventory(I), search(I, X), !.
use(_) :- write('Barang tidak ada di inventory.').

look:- player(X,Y,_,_,_,_), A is X-1, B is X+1, C is Y-1, D is Y+1,
      write('Kamu berada di '),posisi(X,Y),nl,lihat(X,Y),lihat(A,C),lihat(X,C),lihat(B,C),lihat(A,Y),lihat(B,Y),lihat(A,D),lihat(X,D),lihat(B,D),nl
      ,tulis(A,C),tulis(X,C),tulis(B,C),nl
      ,tulis(A,Y),tulis(X,Y),tulis(B,Y),nl
      ,tulis(A,D),tulis(X,D),tulis(B,D),nl.

attack:- player(_,_,_,_,_,Ammop), Ammop == 0, write('Pelurumu habis! Silahkan cari peluru dulu.'), nl,!. 

attack :-   object(X,Y,Enemy), enemy(Enemy,We), player(X,Y,Health,Armor,Wp,Ammop), weapon(Wp,_),
            weapon(We,Dmge),Armor =:= 0, CAmmop is Ammop-1, CHealth is Health-Dmge, 
            retract(player(X,Y,Health,Armor,Wp,Ammop)),asserta(player(X,Y,CHealth,Armor,Wp,CAmmop)),
            retract(object(X,Y,Enemy)),assertz(object(X,Y,We)),
            write('Kamu menyerang musuh dan dia menyerang balik menggunakan '),
            write(We), write('. Kamu terkena '), write(Dmge),
            write(' serangan. Sayangnya kamu tidak punya pelindung!'),
            ((CHealth > 0,
            write(' Untungnya, kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.'),nl,!);
            (failed)),!.

attack :-   object(X,Y,Enemy), enemy(Enemy,We), player(X,Y,Health,Armor,Wp,Ammop), weapon(Wp,_),
            weapon(We,Dmge), CAmmop is Ammop-1, Temp is Armor-Dmge, ((Temp >= 0, CArmor is Temp,
            CHealth is Health,!);(CArmor is 0, CHealth is CHealth+Temp)),
            retract(player(X,Y,Health,Armor,Wp,Ammop)),asserta(player(X,Y,CHealth,CArmor,Wp,CAmmop)),
            retract(object(X,Y,Enemy)),assertz(object(X,Y,We)),
            write('Kamu menyerang musuh dan dia menyerang balik menggunakan '),
            write(We), write('. Kamu terkena '), write(Dmge),
            write(' serangan. Untungnya serangan itu dapat dikurangi dengan pelindung.'),
            ((CHealth > 0,
            write(' Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.'),nl,!);
            (failed)).


posisi(X,Y):- cfield(Z),((12-Z+1=:=X);(12-Z+1=:=Y);(Z=:=Y);(Z=:=X)),!,write('Zona Pencoretan').
posisi(X,Y):- X<6,X>2,Y<12,Y>5,!,write('Ding Dong').
posisi(X,Y):- X<6,X>2,Y<5,Y>2,!,write('Kandang Domba').
posisi(X,Y):- X<10,X>6,Y<5,Y>2,!,write('Sabuga').
posisi(X,Y):- X<10,X>6,Y<12,Y>5,!,write('7602').
posisi(_,_):- write('Labtek VIII').

printinvent([]).
printinvent([X|L]) :- write('* '), write(X), nl, printinvent(L).

status :-   player(_,_,Health,Armor,Weapon,Ammo),
            write('Nyawa: '), write(Health), nl,
            write('Pelindung: '), write(Armor), nl,
            write('Senjata: '), write(Weapon), nl,
            write('Peluru: '), write(Ammo), nl,
            write('Inventory: '), nl , 
            inventory(I), printinvent(I).

help:-write('Fungsi yang dapat dipakai: '), nl,
      write('start -- memulai permainan'), nl,
      write('help -- menunjukkan fungsi-fungsi yang ada'), nl,
      write('quit -- mengakhiri permainan'), nl,
      write('look -- melihat sekitar pemain'), nl,
      write('n, s, e, w, -- bergerak(n=utara, s=selatan, e=timur, w=barat)'), nl,
      write('map, -- melihat peta dan mendeteksi musuh'), nl,
      write('take(Objek), -- mengambil objek tersebut'), nl,
      write('drop(Objek), -- menjatuhkan objek tersebut'), nl,
      write('use(Objek), -- menggunakan objek tersebut'), nl,
      write('attack, -- menyerang musuh yang terlihat'), nl,
      write('status, -- menunjukkan status pemain'), nl,
      write('save(Filename), -- menyimpan game'), nl,
      write('load(Filename), -- memulai kembali game yang telah disimpan sebelumnya'), nl, nl,
      write('Legenda: '), nl,
      write('W = senjata'), nl,
      write('A = pelindung'), nl,
      write('M = obat'), nl,
      write('O = peluru'), nl,
      write('P = pemain'), nl,
      write('E = musuh'), nl,
      write('- = dapat diakses'), nl,
      write('X = tidak dapat diakses'), nl.

drawmap :- cfield(CField), player(X,Y,_,_,_,_), map(1,1,12,CField,X,Y).

map(Brs,_,X,_,_,_) :- Brs>X. /* Basis */
map(Brs,Kol,X,CField,Px,Py) :- (Kol =< CField ; Kol >= X-CField+1; Brs =< CField; Brs >= X-CField+1), write('X'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.
map(Brs,Kol,X,CField,Px,Py) :- Brs =:= Py, Kol =:= Px, write('P'),(K is Kol+1, map(Brs,K,X,CField,Px,Py)),!.
map(Brs,Kol,X,CField,Px,Py) :- write('-'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.

/*Kurang fakta dari,enemy,medicine,weapon,armor,ammo*/
lihat(X,Y):- object(X,Y,Nama), 
                  enemy(Nama,_),!,
                  write('Kamu melihat seorang '), 
                  write(Nama), write('.'), nl.
lihat(X,Y):- object(X,Y,Nama),
                   medicine(Nama,_),!,
                   write('Kamu melihat obat '),
                   write(Nama),write('.'), nl.
lihat(X,Y):- object(X,Y,Nama),
                   weapon(Nama,_),!,
                   write('Kamu melihat senjata '),
                   write(Nama),write('.'), nl.
lihat(X,Y):- object(X,Y,Nama), 
                  armor(Nama,_),!,
                  write('Kamu melihat pelindung '),
                  write(Nama),write('.'), nl.
lihat(X,Y):- object(X,Y,Nama), 
                  ammo(Nama,_),!,
                  write('Kamu melihat amunisi '),
                  write(Nama),write('.'),nl.
lihat(_,_):- true.

tulis(X,Y):- cfield(Z),((12-Z+1=<X);(12-Z+1=<Y);(Y=<Z);(X=<Z)),!,write('#').
tulis(X,Y):- object(X,Y,Nama), enemy(Nama,_),!,write('E').
tulis(X,Y):- object(X,Y,Nama), medicine(Nama,_),!,write('M').
tulis(X,Y):- object(X,Y,Nama), weapon(Nama,_),!,write('W').
tulis(X,Y):- object(X,Y,Nama), armor(Nama,_),!,write('A').
tulis(X,Y):- object(X,Y,Nama), ammo(Nama,_),!,write('O').
tulis(X,Y):- player(X,Y,_,_,_,_), !,write('P').
tulis(_,_):- write('-').

take(X) :- invLimit(N), N > 0, !, (player(A,B,_,_,_,_), object(A,B,X)), !, inventory(I),
            retract(inventory(_)), asserta(inventory([X|I])), Nf is N-1, retract(invLimit(_)),
            asserta(invLimit(Nf)), retract(object(A,B,X)).
take(X) :- player(A,B,_,_,_,_), \+(object(A,B,X)), write('Objek yang ingin diambil tidak ada ').
take(_) :- invLimit(N), N == 0, write('Inventory anda sudah penuh').

search([X|A], X) :- true.
search([], X) :- false.
search([A|B], X) :- search(B, X).

hapus([X|T], X, T).
hapus([H|T], X, [H|L]) :- hapus(T, X, L).

drop(X) :- inventory(L), search(L, X), !, 
            hapus(L, X, Lf), player(Xp,Yp,_,_,_,_),
            assertz(object(Xp,Yp,X)), 
            retract(inventory(_)),
            asserta(inventory(Lf)).
drop(X) :- write('Barang tidak ada di inventory').

use(X) :- medicine(X,HealthIncrease), 
            inventory(I), 
            search(I, X), !, 
            hapus(I,X,INew), 
            retract(inventory(_)), 
            asserta(inventory(INew)), 
            player(Xp,Yp,H,A,W,Am), 
            Nh is H+HealthIncrease, 
            retract(player(_,_,_,_,_,_)), 
            asserta(player(Xp,Yp,Nh,A,W,Am)).
use(X) :- weapon(X,_), 
            inventory(I), 
            search(I, X), 
            !, hapus(I,X,INew),
            player(Xp,Yp,H,A,Xi,Am), 
            retract(inventory(_)), 
            asserta(inventory([Xi|INew])), 
            retract(player(_,_,_,_,_,_)), 
            asserta(player(Xp,Yp,H,A,X,Am)).
use(X) :- armor(X,AngkaPerlindungan), 
            inventory(I), 
            search(I, X), !, 
            hapus(I,X,INew), 
            retract(inventory(_)), 
            asserta(inventory(INew)), 
            player(Xp,Yp,H,A,W,Am), 
            NewA is A+AngkaPerlindungan, 
            retract(player(_,_,_,_,_,_)), 
            asserta(player(Xp,Yp,H,NewA,W,Am)).
use(X) :- ammo(X,Weap), 
            player(_,_,_,_,Weap,_), 
            inventory(I), 
            search(I, X), !, 
            hapus(I,X,INew), 
            retract(inventory(_)),
            asserta(inventory(INew)), 
            weapon(Weap,Val),
            player(Xp,Yp,H,A,W,Am),
            retract(player(_,_,_,_,_,_)), 
            asserta(player(Xp,Yp,H,A,X,Val)).
use(_) :- write('Barang tidak ada di inventory atau Anda memakai Ammo yang tidak sesuai dengan senjata yang dipakai.').

look:- player(X,Y,_,_,_,_), A is X-1, B is X+1, C is Y-1, D is Y+1,
      write('Kamu berada di '),nl,
      posisi(X,Y),nl,
      lihat(A,C),lihat(X,C),lihat(B,C),
      lihat(A,Y),lihat(B,Y),lihat(A,D),
      lihat(X,D),lihat(B,D),nl,
      tulis(A,C),tulis(X,C),tulis(B,C),nl,
      tulis(A,Y),tulis(X,Y),tulis(B,Y),nl,
      tulis(A,D),tulis(X,D),tulis(B,D),nl.

attack:- player(_,_,_,_,_,Ammop), Ammop == 0, write('Pelurumu habis! Silahkan cari peluru dulu.'), nl,!. 

attack :-   object(X,Y,Enemy), enemy(Enemy,We), player(X,Y,Health,Armor,Wp,Ammop), weapon(Wp,_),
            weapon(We,Dmge),Armor =:= 0, CAmmop is Ammop-1, CHealth is Health-Dmge, 
            retract(player(X,Y,Health,Armor,Wp,Ammop)),asserta(player(X,Y,CHealth,Armor,Wp,CAmmop)),
            retract(object(X,Y,Enemy)),assertz(object(X,Y,We)),
            write('Kamu menyerang musuh dan dia menyerang balik menggunakan '),
            write(We), write('. Kamu terkena '), write(Dmge),
            write(' serangan. Sayangnya kamu tidak punya pelindung!'),
            ((CHealth > 0, kills(Kills), Killz is Kills + 1, retract(kills(_)), asserta(kills(Killz)), 
            write(' Untungnya, kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.'),nl, Killz == 2, !, write('SELAMAT ANDA MENJADI KADER TERAKHIR DAN TERBAIK'),!);
            (failed)),!.

attack :-   object(X,Y,Enemy), enemy(Enemy,We), player(X,Y,Health,Armor,Wp,Ammop), weapon(Wp,_),
            weapon(We,Dmge), CAmmop is Ammop-1, Temp is Armor-Dmge, ((Temp >= 0, CArmor is Temp,
            CHealth is Health,!);(CArmor is 0, CHealth is CHealth+Temp)),
            retract(player(X,Y,Health,Armor,Wp,Ammop)),asserta(player(X,Y,CHealth,CArmor,Wp,CAmmop)),
            retract(object(X,Y,Enemy)),assertz(object(X,Y,We)),
            write('Kamu menyerang musuh dan dia menyerang balik menggunakan '),
            write(We), write('. Kamu terkena '), write(Dmge),
            write(' serangan. Untungnya serangan itu dapat dikurangi dengan pelindung.'),
            ((CHealth > 0, kills(Kills), Killz is Kills + 1, retract(_), asserta(Killz),
            write(' Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.'),nl, Killz == 2, !, write('SELAMAT ANDA MENJADI KADER TERAKHIR DAN TERBAIK'),!);
            (failed)).

savef(Namafile):-
    
            open(Namafile, write, Stream),
        
            player(Xp,Yp,Health,Armor,Weaponp,Ammo),
            cfield(AreaDaerahDanger),
            move(JumlahMoveDilakukan),
            inventory(ListInventory),
            object(Xe,Ye,Namao),
        
            write(Stream, Xp), write(Stream, '.'), nl(Stream),
            write(Stream, Yp), write(Stream, '.'), nl(Stream),
            write(Stream, Health), write(Stream, '.'), nl(Stream),
            write(Stream, Armor), write(Stream, '.'), nl(Stream),
            write(Stream, Weaponp), write(Stream, '.'), nl(Stream),
            write(Stream, AreaDaerahDanger), write(Stream, '.'), nl(Stream),
            write(Stream, JumlahMoveDilakukan), write(Stream, '.'), nl(Stream),
            write(Stream, ListInventory), write(Stream, '.'), nl(Stream),
            write(Stream, Xe), write(Stream, '.'), nl(Stream),
            write(Stream, Ye), write(Stream, '.'), nl(Stream),
            write(Stream, Namao), write(Stream, '.'), nl(Stream),
        
            write("suds bro"), nl,
            close(Stream).
        
loadf(Namafile):-
            open(Namafile, read, Stream),
        
            player(Xp,Yp,Health,Armor,Weaponp,Ammo),
            cfield(AreaDaerahDanger),
            move(JumlahMoveDilakukan),
            inventory(ListInventory),
            object(Xe,Ye,Namao),
        
            retract(player(Xp,Yp,Health,Armor,Weaponp,Ammo)),
            retract(cfield(AreaDaerahDanger)),
            retract(move(JumlahMoveDilakukan)),
            retract(inventory(ListInventory)),
            retract(object(Xe,Ye,Namao)),
        
            read(Stream, Xp), 
            read(Stream, Yp), 
            read(Stream, Health), 
            read(Stream, Armor), 
            read(Stream, Weaponp), 
            read(Stream, AreaDaerahDanger), 
            read(Stream, JumlahMoveDilakukan), 
            read(Stream, ListInventory), 
            read(Stream, Xe), 
            read(Stream, Ye), 
            read(Stream, Namao), 
        
            asserta(player(Xp,Yp,Health,Armor,Weaponp,Ammo)),
            asserta(cfield(AreaDaerahDanger)),
            asserta(move(JumlahMoveDilakukan)),
            asserta(inventory(ListInventory)),
            asserta(object(Xe,Ye,Namao)).
        
