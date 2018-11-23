/* kurang bikin move */
:- dynamic player/2.
:- retractall(player(_,_)).

posisi(X,Y):- cfield(Z),(12-Z=:=X);(12-Z=:=Y);(Z=:=Y);(Z=:=X),!,write("Dunia Lain").
posisi(X,Y):- X<6,X>2,Y<12,Y>5,!,write("Hutan").
posisi(X,Y):- X<6,X>2,Y<5,Y>2,!,write("Rawa").
posisi(X,Y):- X<10,X>6,Y<5,Y>2,!,write("Pedesaan").
posisi(X,Y):- X<10,X>6,Y<12,Y>5,!,write("Pantai").
posisi(X,Y):- write("Gurun")

cek(X,Y):- write("Utara kamu adalah "),posisi(X,Y-1),write(", Selatan kamu adalah "),posisi(X,Y+1),write(", Barat kamu adalah "),posisi(X-1,Y),write(", Timur kamu adalah "),posisi(X+1,Y).

n():-retract(player(X,Y)), Z is Y-1,assertz(player(X,Z)),write("Kamu sekarang berada di "),posisi(X,Z),cek(X,Z),move(A),B is A+1,move(B).
s():-retract(player(X,Y)), Z is Y+1,assertz(player(X,Z)),write("Kamu sekarang berada di "),posisi(X,Z),cek(X,Z),move(A),B is A+1,move(B).
e():-retract(player(X,Y)), Z is X+1,assertz(player(Z,Y)),write("Kamu sekarang berada di "),posisi(Z,Y),cek(Z,Y),move(A),B is A+1,move(B).
w():-retract(player(X,Y)), Z is X-1,assertz(player(Z,Y)),write("Kamu sekarang berada di "),posisi(Z,Y),cek(Z,Y),move(A),B is A+1,move(B).
  
