/* Intinya cari X itu kategori objek apa, cari di inventory, hapus dari inventory, inventory berubah (retract->asserta)? Ubah variabel player setelah kena efek dari item X karena diuse */
hapus([X|T], X, T).
hapus([H|T], X, [H|L]) :- hapus(T, X, L).

use(X) :- medicine(X,HealthIncrease), inventory(I), search(I, X), !, hapus(I,X,INew), retract(inventory(_)), asserta(inventory(INew)), player(Xp,Yp,H,A,W,Am), Nh is H+HealthIncrease, retract(player(_,_,_,_,_,_)), asserta(player(Xp,Yp,Nh,A,W,Am)).
use(X) :- weapon(X,_), inventory(I), search(I, X), !, hapus(I,X,INew), retract(inventory(_)), asserta(inventory(INew)), player(Xp,Yp,H,A,W,Am), retract(player(_,_,_,_,_,_)), asserta(player(Xp,Yp,H,A,X,Am)).
use(X) :- armor(X,AngkaPerlindungan), inventory(I), search(I, X), !, hapus(I,X,INew), retract(inventory(_)), asserta(inventory(INew)), player(Xp,Yp,H,A,W,Am), NewA is A+AngkaPerlindungan, retract(player(_,_,_,_,_,_)), asserta(player(Xp,Yp,H,NewA,W,Am)).
use(X) :- ammo(X,Weap), player(_,_,_,_,Weap,_), inventory(I), search(I, X), !, hapus(I,X,INew), retract(inventory(_)), asserta(inventory(INew)), weapon(Weap,Val), player(Xp,Yp,H,A,W,Am), retract(player(_,_,_,_,_,_)), asserta(player(Xp,Yp,H,A,X,Val)).
use(_) :- write('Barang tidak ada di inventory.').
/* BATAS BAWAH PENGERJAAN ZALDI, 'USE' */
