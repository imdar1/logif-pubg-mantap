/*Kurang fakta dari,enemy,medicine,weapon,armor,ammo*/
lihat(X,Y):- enemy(A,B,C),A=:=X,B=:=Y,!,write(" Kamu melihat Musuh.").
lihat(X,Y):- medicine(A,B,C,D),A=:=X,B=:=Y,!,write(" Kamu melihat obat "),write(C),write(".").
lihat(X,Y):- weapon(A,B,C,D),A=:=X,B=:=Y,!,write(" Kamu melihat senjata "),write(C),write(".").
lihat(X,Y):- armor(A,B,C,D),A=:=X,B=:=Y,!,write(" Kamu melihat peelindung "),write(C),write(".").
lihat(X,Y):- ammo(A,B,C,D),A=:=X,B=:=Y,!,write(" Kamu melihat amunisi dari "),write(C),write(".").

tulis(X,Y):- cfield(Z),(12-Z>=X);(12-Z>=Y);(Z=<Y);(Z=<X),!,write("#").
tulis(X,Y):- enemy(A,B,C),A=:=X,B=:=Y,!,write("E").
tulis(X,Y):- medicine(A,B,C,D),A=:=X,B=:=Y,!,write("M").
tulis(X,Y):- weapon(A,B,C,D),A=:=X,B=:=Y,!,write("W").
tulis(X,Y):- armor(A,B,C,D),A=:=X,B=:=Y,!,write("A").
tulis(X,Y):- ammo(A,B,C,D),A=:=X,B=:=Y,!,write("O").
tulis(X,Y):- write("-").

look:-player(X,Y),write("Kamu berada di "),posisi(X,Y),lihat(X-1,Y-1),lihat(X,Y-1),lihat(X+1,Y-1),lihat(X-1,Y),lihat(X+1,Y),lihat(X-1,Y+1),lihat(X,Y+1),lihat(X+1,Y+1),nl
      ,tulis(X-1,Y-1),tulis(X,Y-1),tulis(X+1,Y-1),nl
      ,tulis(X-1,Y),write("P"),tulis(X+1,Y),nl
      ,tulis(X-1,Y+1),tulis(X,Y+1),tulis(X+1,Y+1),nl.
