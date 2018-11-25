
mametdo:- object(A,B,mamet),player(X,Y,_,_,_,_),X=:=A,Y=:=B,!,random(1,3,X),enemyRdmDo(X).
mametdo:- mametMove.

danlapdo:- object(A,B,mamet),player(X,Y,_,_,_,_),X=:=A,Y=:=B,!,random(1,3,X),enemyRdmDo(X).
danlapdo:- danlapMove.

mametRdmDo(X):- X=:=1,!,mametAttack.
mametRdmDo(X):- X=:=2,!,mametMove.

danlapRdmDo(X):- X=:=1,!,danlapAttack.
danlapRdmDo(X):- X=:=2,!,danlapMove.


mametAttack:- enemy(mamet,X),weapon(X,Y),retract(player(A,B,C,D,E,F)),G is C-Y,assertz(player(A,B,G,D,E,F)).
danlapAttack:- enemy(danlap,X),weapon(X,Y),retract(player(A,B,C,D,E,F)),G is C-Y,assertz(player(A,B,G,D,E,F)).

mametMove:- random(1,5,X),enemyRdmMoveMamet(X).
danlapMove:- random(1,5,X),enemyRdmMoveDanlap(X).

enemyRdmMoveMamet(X):- cfield(Z),X=:=1,object(A,B,mamet),C is A+1,(12-Z+1=<C),!,retract(object(A,B,mamet)),assertz(object(C,B,mamet)).
enemyRdmMoveMamet(X):- cfield(Z),X=:=1,object(A,B,mamet),!,C is A-1,retract(object(A,B,mamet)),assertz(object(C,B,mamet)).
enemyRdmMoveMamet(X):- cfield(Z),X=:=2,object(A,B,mamet),C is A-1,(C=<Z),!,retract(object(A,B,mamet)),assertz(object(C,B,mamet)).
enemyRdmMoveMamet(X):- cfield(Z),X=:=2,object(A,B,mamet),!,C is A+1,retract(object(A,B,mamet)),assertz(object(C,B,mamet)).
enemyRdmMoveMamet(X):- cfield(Z),X=:=3,object(A,B,mamet),C is B+1,(12-Z+1=<C),!,retract(object(A,B,mamet)),assertz(object(A,C,mamet)).
enemyRdmMoveMamet(X):- cfield(Z),X=:=3,object(A,B,mamet),!,C is B-1,retract(object(A,B,mamet)),assertz(object(A,C,mamet)).
enemyRdmMoveMamet(X):- cfield(Z),X=:=4,object(A,B,mamet),C is B-1,(C=<Z),!,retract(object(A,B,mamet)),assertz(object(A,C,mamet)).
enemyRdmMoveMamet(X):- cfield(Z),X=:=4,object(A,B,mamet),!,C is B+1,retract(object(A,B,mamet)),assertz(object(A,C,mamet)).

enemyRdmMoveDanlap(X):- cfield(Z),X=:=1,object(A,B,danlap),C is A+1,(12-Z+1=<C),!,retract(object(A,B,danlap)),assertz(object(C,B,danlap)).
enemyRdmMoveDanlap(X):- cfield(Z),X=:=1,object(A,B,danlap),!,C is A-1,retract(object(A,B,danlap)),assertz(object(C,B,danlap)).
enemyRdmMoveDanlap(X):- cfield(Z),X=:=2,object(A,B,danlap),C is A-1,(C=<Z),!,retract(object(A,B,danlap)),assertz(object(C,B,danlap)).
enemyRdmMoveDanlap(X):- cfield(Z),X=:=2,object(A,B,danlap),!,C is A+1,retract(object(A,B,danlap)),assertz(object(C,B,danlap)).
enemyRdmMoveDanlap(X):- cfield(Z),X=:=3,object(A,B,danlap),C is B+1,(12-Z+1=<C),!,retract(object(A,B,danlap)),assertz(object(A,C,danlap)).
enemyRdmMoveDanlap(X):- cfield(Z),X=:=3,object(A,B,danlap),!,C is B-1,retract(object(A,B,danlap)),assertz(object(A,C,danlap)).
enemyRdmMoveDanlap(X):- cfield(Z),X=:=4,object(A,B,danlap),C is B-1,(C=<Z),!,retract(object(A,B,danlap)),assertz(object(A,C,danlap)).
enemyRdmMoveDanlap(X):- cfield(Z),X=:=4,object(A,B,danlap),!,C is B+1,retract(object(A,B,danlap)),assertz(object(A,C,danlap)).
