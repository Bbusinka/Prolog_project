%Author: Valeriia Loichyk - 269399

arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

search(A,B,V) :-
    arc(A,X),
    \+ member(X, V),
    (
        B = X;
        search(X,B,[X|V])
    ).


osiagalny(X,Y) :- X=Y.
osiagalny(X,Y) :- search(X,Y,[X]).

