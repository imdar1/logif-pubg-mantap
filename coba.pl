:- dynamic(player/6). player(1,1,100,0,ak47,5).
:- dynamic(cfield/1). cfield(1).
:- dynamic(move/1). move(0).
:- dynamic(enemy/4). enemy(1,2,pistol,100).

start   :-  S is 12,
            randomize,
            random(2,S,X),
            random(2,S,Y),
            player(_,_,Health,Armor,Weapon,Ammo),
            retract(player(_,_,Health,Armor,Weapon,Ammo)),
            assertz(player(X,Y,Health,Armor,Weapon,Ammo)),
            write('Selamat datang di medan peperangan!'),nl,
            write('Silakan jalankan perintah yang Anda inginkan'),nl,nl,
            repeat,
            write('> '),
            read(Command),
            (
                (Command == map, drawmap,fail);
		        (Command == look, fail);
		        (Command == help, help, fail);
                (Command == n,n,fail);
                (Command == s,s,fail);
                (Command == e,e,fail);
                (Command == w,w,fail);
                (Command == status, status, fail);
	            (Command == quit, !, halt)
	        ).

n:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is Y-1,asserta(player(X,Z,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),asserta(move(B)).
s:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is Y+1,asserta(player(X,Z,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(X,Z),nl,cek(X,Z),move(A),B is A+1,retract(move(A)),asserta(move(B)).
e:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is X+1,asserta(player(Z,Y,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),asserta(move(B)).
w:-player(X,Y,M,N,P,Q), retract(player(X,Y,M,N,P,Q)), Z is X-1,asserta(player(Z,Y,M,N,P,Q)),write('Kamu sekarang berada di '),posisi(Z,Y),nl,cek(Z,Y),move(A),B is A+1,retract(move(A)),asserta(move(B)).

posisi(X,Y):- cfield(Z),((12-Z=:=X);(12-Z=:=Y);(Z=:=Y);(Z=:=X)),!,write('Dunia Lain').
posisi(X,Y):- X<6,X>2,Y<12,Y>5,!,write('Hutan').
posisi(X,Y):- X<6,X>2,Y<5,Y>2,!,write('Rawa').
posisi(X,Y):- X<10,X>6,Y<5,Y>2,!,write('Pedesaan').
posisi(X,Y):- X<10,X>6,Y<12,Y>5,!,write('Pantai').
posisi(_,_):- write('Gurun').

status :-  player(_,_,Health,Armor,Weapon,Ammo),
           write('Nyawa: '), write(Health), nl,
           write('Pelindung: '), write(Armor), nl,
           write('Senjata: '), write(Weapon), nl,
           write('Peluru: '), write(Ammo), nl.

cek(X,Y):- A is X+1, B is X-1, C is Y+1, D is Y-1, write('Utara kamu adalah '),posisi(X,D),nl,write('Selatan kamu adalah '),posisi(X,C),nl,write('Barat kamu adalah '),posisi(B,Y),nl,write('Timur kamu adalah '),posisi(A,Y),nl.

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
      write('load(Filename), -- memulai kembali game yang telah disimpan sebelumnya'), nl,
      nl,
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

attack  :- enemy(Xe,Ye,Weapone), player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop),
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
        write(' Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.').

attack  :- Xp =/= Xe, Yp =/= Ye, write('Tidak ada musuh di sekelilingmu.'), nl.

attack  :- Ammop =:= 0, write('Pelurumu habis! Silahkan cari peluru dulu.'), nl.

attack  :- Armorp =:= 0, Healthnp is Healthp - Damagee,
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
