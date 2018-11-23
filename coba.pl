:- dynamic player/2.
:- retractall(player(_,_)).

player(1,2).

start :- player(X,Y), A is X+1, B is Y+1, retract(player(_,_)), assertz(player(A,B)).