/*deklarasi dynamic udh di nwse.pl*/

start :- S is 12,
		 CField is 1,
         random(2,S,X),
         random(2,S,Y),
	 retract(player(_,_)),
	 assert(player(X,Y)),
         write('Selamat datang di medan peperangan!'),nl,
         write('Silakan jalankan perintah yang Anda inginkan'),nl,
         repeat,
           write('> '),
           read(Command),
           (
             (Command == map, map(1,1,S,CField,X,Y),fail);
			 (Command == look, fail);
		     (Command == help, help('Ini Help'),fail);
		     (Command == quit, !)
		   ).       
		   
help(X) :- write(X),nl.

map(Brs,_,X,_,_,_) :- Brs>X. /* Basis */
map(Brs,Kol,X,CField,Px,Py) :- (Kol =< CField ; Kol >= X-CField+1; Brs =< CField; Brs >= X-CField+1), write('X'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.
map(Brs,Kol,X,CField,Px,Py) :- Brs =:= Px, Kol =:= Py, write('P'),(K is Kol+1, map(Brs,K,X,CField,Px,Py)),!.
map(Brs,Kol,X,CField,Px,Py) :- write('-'),((Kol=:=X, nl, K is 1, B is Brs+1, map(B,K,X,CField,Px,Py),!) ; (K is Kol+1,map(Brs,K,X,CField,Px,Py))),!.
