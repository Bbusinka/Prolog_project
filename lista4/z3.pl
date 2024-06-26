%Author: Valeriia Loichyk - 269399

small([1,4,5,8]).
small([2,5,6,9]).
small([3,6,7,10]).
small([8,11,12,15]).
small([9,12,13,16]).
small([10,13,14,17]).
small([15,18,19,22]).
small([16,19,20,23]).
small([17,20,21,24]).
medium([1,2,4,6,11,13,15,16]).
medium([2,3,5,7,12,14,16,17]).
medium([8,9,11,13,18,20,22,23]).
medium([9,10,12,14,19,21,23,24]).
big([1,2,3,4,7,11,14,18,21,22,23,24]).

addM(L,0,X):- X = L.
addM(L,B,X):- B>0, small(T),intersection(L,T,I),\+(T=I),union(L,T,Y), B1 is B - 1, addM(Y,B1,X).

addS(L,0,X):- X = L.
addS(L,B,X):- B>0, medium(T),intersection(L,T,I),\+(T=I), union(L,T,Y), B1 is B - 1, addS(Y,B1,X).

addB(L,0,X):- X = L.
addB(L,B,X):- B>0, big(T),intersection(L,T,I),\+(T=I), union(L,T,Y), B1 is B - 1, addB(Y,B1,X).


zapalki(N,B,M,S):-
	setof(F,zapalki(N,B,M,S,F),Set),
	member(F1,Set),
	draw(F1).

zapalki(N,B,M,S,FSORT):-  
	L=[], 
	addB(L,B,L1), 
	addS(L1,M,L2), 
	addM(L2,S,F), 
	length(F, X), 
	N is 24 - X,			
	checkB(F,V), 
	V=:=B,
	checkM1(F,Q1), Z1 is M-Q1, checkM2(F,Q2), Z2 is Z1-Q2, checkM3(F,Q3), Z3 is Z2-Q3,
	checkM4(F,Q4), Z4 is Z3-Q4, Z4=:=0,
	checkS1(F,X1), Y1 is S-X1, checkS2(F,X2), Y2 is Y1-X2, checkS3(F,X3), Y3 is Y2-X3,
	checkS4(F,X4), Y4 is Y3-X4, checkS5(F,X5), Y5 is Y4-X5, checkS6(F,X6), Y6 is Y5-X6,
	checkS7(F,X7), Y7 is Y6-X7, checkS8(F,X8), Y8 is Y7-X8, checkS9(F,X9), Y9 is Y8-X9,
	Y9 =:= 0,sort(F,FSORT).


checkB(L,X):-
			(member(1,L) -> (member(2,L) -> (member(3,L) -> (member(4,L) ->
			(member(7,L) -> (member(11,L) -> (member(14,L) -> (member(18,L) ->
			(member(21,L) -> (member(22,L) -> (member(23,L) -> (member(24,L) ->
			X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ;
			X is 0) ; X is 0); X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS1(L,X):-
			(member(1,L) -> (member(4,L) -> (member(5,L) -> (member(8,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS2(L,X):-
			(member(2,L) -> (member(5,L) -> (member(6,L) -> (member(9,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS3(L,X):-
			(member(3,L) -> (member(6,L) -> (member(7,L) -> (member(10,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS4(L,X):-
			(member(8,L) -> (member(11,L) -> (member(12,L) -> (member(15,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS5(L,X):-
			(member(9,L) -> (member(12,L) -> (member(13,L) -> (member(16,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS6(L,X):-
			(member(10,L) -> (member(13,L) -> (member(14,L) -> (member(17,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS7(L,X):-
			(member(15,L) -> (member(18,L) -> (member(19,L) -> (member(22,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS8(L,X):-
			(member(16,L) -> (member(19,L) -> (member(20,L) -> (member(23,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkS9(L,X):-
			(member(17,L) -> (member(20,L) -> (member(21,L) -> (member(24,L) -> X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkM1(L,X):-
			(member(1,L) -> (member(2,L) -> (member(4,L) -> (member(6,L) ->
			(member(11,L) -> (member(13,L) -> (member(15,L) -> (member(16,L) ->
			X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkM2(L,X):-
			(member(2,L) -> (member(3,L) -> (member(5,L) -> (member(7,L) ->
			(member(12,L) -> (member(14,L) -> (member(16,L) -> (member(17,L) ->
			X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkM3(L,X):-
			(member(8,L) -> (member(9,L) -> (member(11,L) -> (member(13,L) ->
			(member(18,L) -> (member(20,L) -> (member(22,L) -> (member(23,L) ->
			X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0).
checkM4(L,X):-
			(member(9,L) -> (member(10,L) -> (member(12,L) -> (member(14,L) ->
			(member(19,L) -> (member(21,L) -> (member(23,L) -> (member(24,L) ->
			X is 1 ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0) ; X is 0).


draw(K):-
	(member(1,K) -> write("+---+"); write("+   +")),
	(member(2,K) -> write("---+"); write("   +")),
	(member(3,K) -> write("---+\n"); write("   +\n")),
	(member(4,K) -> write("|   "); write("    ")),
	(member(5,K) -> write("|   "); write("    ")),
	(member(6,K) -> write("|   "); write("    ")),
	(member(7,K) -> write("|\n"); write(" \n")),
	(member(8,K) -> write("+---+"); write("+   +")),
	(member(9,K) -> write("---+"); write("   +")),
	(member(10,K) -> write("---+\n"); write("   +\n")),
	(member(11,K) -> write("|   "); write("    ")),
	(member(12,K) -> write("|   "); write("    ")),
	(member(13,K) -> write("|   "); write("    ")),
	(member(14,K) -> write("|\n"); write(" \n")),
	(member(15,K) -> write("+---+"); write("+   +")),
	(member(16,K) -> write("---+"); write("   +")),
	(member(17,K) -> write("---+\n"); write("   +\n")),
	(member(18,K) -> write("|   "); write("    ")),
	(member(19,K) -> write("|   "); write("    ")),
	(member(20,K) -> write("|   "); write("    ")),
	(member(21,K) -> write("|\n"); write(" \n")),
	(member(22,K) -> write("+---+"); write("+   +")),
	(member(23,K) -> write("---+"); write("   +")),
	(member(24,K) -> write("---+\n"); write("   +\n")).
