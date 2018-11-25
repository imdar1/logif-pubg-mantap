
mametdo:- object(A,B,mamet),player(X,Y,_,_,_,_),X=:=A,Y=:=B,!,random(1,3,X),enemyRdmDo(X).
mametdo:- moveRandomMamet.

danlapdo:- object(A,B,mamet),player(X,Y,_,_,_,_),X=:=A,Y=:=B,!,random(1,3,X),enemyRdmDo(X).
danlapdo:- moveRandomDanlap.

mametRdmDo(X):- X=:=1,!,mametAttack.
mametRdmDo(X):- X=:=2,!,moveRandomMamet.

danlapRdmDo(X):- X=:=1,!,danlapAttack.
danlapRdmDo(X):- X=:=2,!,moveRandomDanlap.


mametAttack:- enemy(mamet,X),weapon(X,Y),retract(player(A,B,C,D,E,F)),G is C-Y,assertz(player(A,B,G,D,E,F)).
danlapAttack:- enemy(danlap,X),weapon(X,Y),retract(player(A,B,C,D,E,F)),G is C-Y,assertz(player(A,B,G,D,E,F)).

moveRandomMamet :- retract(object(X,Y,mamet)), randomize, random(-1,2,M), ((M =:=0,random(1,3,N),MoveY is N*2-3,Xa is X, Ya is Y+MoveY,asserta(object(Xa,Ya,mamet)),!);(Xa is X+M, Ya is Y,asserta(object(Xa,Ya,mamet)))).
moveRandomDanlap :- retract(object(X,Y,danlap)),randomize, random(-1,2,M), ((M =:=0,random(1,3,N),MoveY is N*2-3,Xa is X, Ya is Y+MoveY,asserta(object(Xa,Ya,danlap)),!);(Xa is X+M, Ya is Y,asserta(object(Xa,Ya,danlap)))).
