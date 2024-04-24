%Author: Valeriia Loichyk - 269399

usun_tail(L,L1) :-
    append(L1, [_], L).
usun_head([_|L],L).

srodkowy([X],X).
srodkowy(L, X) :-
    usun_tail(L,L1),
    usun_head(L1,L2),
    srodkowy(L2,X).

