%Author: Valeriia Loichyk - 269399

lista(N,L) :-
    numlist(1,N,A),
    odd_elts(L,A),
    permutation(A,B),
    even_elts(L,B).

odd_elts([],[]).
odd_elts([X,_|L], [X|R]) :-
    odd_elts(L,R).

even_elts([],[]).
even_elts([_,X|L], [X|R]) :-
    even_elts(L,R).

