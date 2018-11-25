/*--DEKLARASI FAKTA--*/

/*Definisi:player(X,Y,Health,Armor,Weapon,Ammo)*/
:- dynamic(player/6). 
/*Definisi:cfield(AreaDaerahDanger)*/
:- dynamic(cfield/1). 
/*Definisi:move(JumlahMoveDilakukan)*/
:- dynamic(move/1).
/*Definisi:inventory(ListInventory)*/
:- dynamic(inventory/1).
/*Definisi:invLimit*/
:- dynamic(invLimit/1).
/*Definisi:object(X,Y,nama)*/
/*Mengeset sebuah object yang akan diisi dengan nama dan letak: ammo, enemy, medicine, weapon, dan armor*/
:- dynamic(object/3).

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
            /*Menginisialisasi Lokasi Player*/
            randomize,
            random(2,S,X),
            random(2,S,Y),
            asserta(player(X,Y,100,0,ak47,5)),
            asserta(cfield(1)),
            asserta(move(0)),
            asserta(inventory([])),
            asserta(invLimit(10)),
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
            asserta(object(Xm1a, Ym1a, antangin)),
            random(2,S,Xm1b),
            random(2,S,Ym1b),
            asserta(object(Xm1b, Ym1b, antangin)),
            random(2,S,Xm1c),
            random(2,S,Ym1c),
            asserta(object(Xm1c, Ym1c, antangin)),
            random(2,S,Xm1d),
            random(2,S,Ym1d),
            asserta(object(Xm1d, Ym1d, antangin)),
            /*Mengeset Lokasi 2 buah medicine madurasa*/
            random(2,S,Xm2a),
            random(2,S,Ym2a),
            asserta(object(Xm2a, Ym2a, madurasa)),
            random(2,S,Xm2b),
            random(2,S,Ym2b),
            asserta(object(Xm2b, Ym2b, madurasa)),

            /*Menginisialisasi lokasi weapon*/
            /*Mengeset lokasi 4 buah pistol*/
            random(2,S,Xw1a),
            random(2,S,Yw1a),
            asserta(object(Xw1a, Yw1a, pistol)),
            random(2,S,Xw1b),
            random(2,S,Yw1b),
            asserta(object(Xw1b, Yw1b, pistol)),
            random(2,S,Xw1c),
            random(2,S,Yw1c),
            asserta(object(Xw1c, Yw1c, pistol)),
            /*Mengeset Lokasi 2 buah medicine ak47*/
            random(2,S,Xw2a),
            random(2,S,Yw2a),
            asserta(object(Xw2a, Yw2a, ak47)),

            /*Menginisialisasi lokasi armor*/
            /*Mengeset lokasi 3 armor jakang*/
            random(2,S,Xa1a),
            random(2,S,Ya1a),
            asserta(object(Xa1a, Ya1a, jakang)),
            random(2,S,Xa1b),
            random(2,S,Ya1b),
            asserta(object(Xa1b, Ya1b, jakang)),
            random(2,S,Xa1c),
            random(2,S,Ya1c),
            asserta(object(Xa1c, Ya1c, jakang)),
            /*mengeset lokasi 1 armor slayer*/
            random(2,S,Xa2d),
            random(2,S,Ya2d),
            asserta(object(Xa2d, Ya2d, slayer)),

            /*Menginisialisasi lokasi ammo*/
            /*Mengeset lokasi 6 buah ammo1(untuk pistol)*/
            random(2,S,Xo1a),
            random(2,S,Yo1a),
            asserta(object(Xo1a, Yo1a, ammo1)),
            random(2,S,Xo1b),
            random(2,S,Yo1b),
            asserta(object(Xo1b, Yo1b, ammo1)),
            random(2,S,Xo1c),
            random(2,S,Yo1c),
            asserta(object(Xo1c, Yo1c, ammo1)),
            random(2,S,Xo1d),
            random(2,S,Yo1d),
            asserta(object(Xo1d, Yo1d, ammo1)),
            random(2,S,Xo1e),
            random(2,S,Yo1e),
            asserta(object(Xo1e, Yo1e, ammo1)),
            random(2,S,Xo1f),
            random(2,S,Yo1f),
            asserta(object(Xo1f, Yo1f, ammo1)),
            /*Mengeset Lokasi 4 buah ammo2(untuk ak47)*/
            random(2,S,Xo2a),
            random(2,S,Yo2a),
            asserta(object(Xo2a, Yo2a, ammo2)),
            random(2,S,Xo2b),
            random(2,S,Yo2b),
            asserta(object(Xo2b, Yo2b, ammo2)),
            random(2,S,Xo2c),
            random(2,S,Yo2c),
            asserta(object(Xo2c, Yo2c, ammo2)),
            random(2,S,Xo2d),
            random(2,S,Yo2d),
            asserta(object(Xo2d, Yo2d, ammo2)),
            
            write('Selamat datang di medan peperangan!'),nl,
            write('Silakan jalankan perintah yang Anda inginkan'),nl,nl,
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
                (Command == take(pistol), take(pistol), fail);
                (Command == take(ak47), take(ak47), fail);
                (Command == take(antangin), take(antangin), fail);
                (Command == take(madurasa), take(madurasa), fail);
                (Command == take(jakang), take(jakang), fail);
                (Command == take(slayer), take(slayer), fail);
                (Command == take(ammo1), take(ammo1), fail);
                (Command == take(ammo2), take(ammo2), fail);
                (Command == use(pistol), use(pistol), fail);
                (Command == use(ak47), use(ak47), fail);
                (Command == use(antangin), use(antangin), fail);
                (Command == use(madurasa), use(madurasa), fail);
                (Command == use(jakang), use(jakang), fail);
                (Command == use(slayer), use(slayer), fail);
                (Command == use(ammo1), use(ammo1), fail);
                (Command == use(ammo2), use(ammo2), fail);
                (Command == quit, !,halt)
	        ).


cek(X,Y):- A is X+1, B is X-1, C is Y+1, D is Y-1, write('Utara kamu adalah '),posisi(X,D),nl,write('Selatan kamu adalah '),posisi(X,C),nl,write('Barat kamu adalah '),posisi(B,Y),nl,write('Timur kamu adalah '),posisi(A,Y),nl.

failed :- write('Anda kalah di game ini, tapi menang di hati para penonton'), nl, halt.

n:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is Y-1,asserta(player(X,Z,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),asserta(move(B)), moveRandomDanlap, moveRandomMamet, ((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<X);(12-D+1=<Z);(Z=<D);(X=<D)), !, failed.
s:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is Y+1,asserta(player(X,Z,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),asserta(move(B)), moveRandomDanlap, moveRandomMamet,((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<X);(12-D+1=<Z);(Z=<D);(X=<D)), !, failed.
e:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is X+1,asserta(player(Z,Y,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),asserta(move(B)), moveRandomDanlap, moveRandomMamet,((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<Z);(12-D+1=<Y);(Y=<D);(Z=<D)), !, failed.
w:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is X-1,asserta(player(Z,Y,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),asserta(move(B)), moveRandomDanlap, moveRandomMamet,((0 is B mod 4,retract(cfield(OC)),D is OC+1, asserta(cfield(D)),!); (cfield(D))), ((12-D+1=<Z);(12-D+1=<Y);(Y=<D);(Z=<D)), !, failed.

moveRandomMamet :- retract(object(X,Y,mamet)), randomize, random(-1,2,M), ((M =:=0,random(1,3,N),MoveY is N*2-3,Xa is X, Ya is Y+MoveY,asserta(object(Xa,Ya,mamet)),!);(Xa is X+M, Ya is Y,asserta(object(Xa,Ya,mamet)))).
moveRandomDanlap :- retract(object(X,Y,danlap)),randomize, random(-1,2,M), ((M =:=0,random(1,3,N),MoveY is N*2-3,Xa is X, Ya is Y+MoveY,asserta(object(Xa,Ya,danlap)),!);(Xa is X+M, Ya is Y,asserta(object(Xa,Ya,danlap)))).

posisi(X,Y):- cfield(Z),((12-Z+1=:=X);(12-Z+1=:=Y);(Z=:=Y);(Z=:=X)),!,write('Zona Pencoretan').
posisi(X,Y):- X<6,X>2,Y<12,Y>5,!,write('Ding Dong').
posisi(X,Y):- X<6,X>2,Y<5,Y>2,!,write('Kandang Domba').
posisi(X,Y):- X<10,X>6,Y<5,Y>2,!,write('Sabuga').
posisi(X,Y):- X<10,X>6,Y<12,Y>5,!,write('7602').
posisi(_,_):- write('Labtek VIII').

status :-  player(_,_,Health,Armor,Weapon,Ammo),
           write('Nyawa: '), write(Health), nl,
           write('Pelindung: '), write(Armor), nl,
           write('Senjata: '), write(Weapon), nl,
           write('Peluru: '), write(Ammo), nl.

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

search([X|A], X) :- true.
search([], X) :- false.
search([A|B], X) :- search(B, X).

use(X) :- medicine(X,_), inventory(I), search(I, X), !, player(X,Y,H,A,W,Am), Nh is H+10, retract(player(_,_,_,_,_,_)), asserta(player(X,Y,Nh,A,W,Am)).
use(X) :- weapon(X,_), inventory(I), search(I, X), !.
use(X) :- armor(X,_), inventory(I), search(I, X), !.
use(X) :- ammo(X,_), inventory(I), search(I, X), !.
use(X) :- ammo(X,_), inventory(I), search(I, X), !.
use(_) :- write('Barang tidak ada di inventory.').

look:- player(X,Y,_,_,_,_), A is X-1, B is X+1, C is Y-1, D is Y+1,
      write('Kamu berada di '),nl,posisi(X,Y),lihat(A,C),lihat(X,C),lihat(B,C),lihat(A,Y),lihat(B,Y),lihat(A,D),lihat(X,D),lihat(B,D),nl
      ,tulis(A,C),tulis(X,C),tulis(B,C),nl
      ,tulis(A,Y),tulis(X,Y),tulis(B,Y),nl
      ,tulis(A,D),tulis(X,D),tulis(B,D),nl.


/* attack  :- enemy(Xe,Ye,Weapone), player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop),
        Xp =:= Xe, Yp tr =:= Ye, !, weapon(X,Y,Weapone,Damagee), 
        Ammop > 0, !, Ammonp is Ammop - 1,
        Armorp > 0, !, Armornp is Armorp - Damagee, Armornp < 0, !, 
        Healthnp is Healthp + Armornp, Armornp is 0,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)), Healthnp > 0, !,
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone)), Xne is 1, Yne is 1, 
        assertz(enemy(Xne,Yne,Weapone)), 
        write('Kamu menyerang musuh dan dia menyerang balik menggunakan '),
        write(Weapone), write('. Kamu terkena '), write(Damagee),
        write(' serangan. Untungnya serangan itu dapat dikurangi dengan pelindung.'),
        write(' Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.'). */
/* 
attack  :- Xp =/= Xe, Yp =/= Ye, write('Tidak ada musuh di sekelilingmu.'), nl.

attack  :- Ammop =:= 0, write('Pelurumu habis! Silahkan cari peluru dulu.'), nl. */

/* attack  :- Armorp =:= 0, Healthnp is Healthp - Damagee,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)), Healthnp > 0, !, 
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone)), Xne is 1, Yne is 1, 
        assertz(enemy(Xne,Yne,Weapone)), 
        write('Kamu menyerang musuh dan dia menyerang balik menggunakan '),
        write(Weapone), write('. Kamu terkena '), write(Damagee),
        write(' serangan.'),
        write(' Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.').

attack  :- Armornp > 0,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone)), Xne is 1, Yne is 1, 
        assertz(enemy(Xne,Yne,Weapone)), 
        write('Kamu menyerang musuh dan dia menyerang balik menggunakan '),
        write(Weapone), write('. Kamu terkena '), write(Damagee),
        write(' serangan. Untungnya serangan itu dapat dikurangi dengan pelindung.'),
        write(' Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.').

attack  :- Healthnp <= 0, Healthnp is 0, Ammonp is Ammop - 1,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        write('Kamu telah mati.').
 */
