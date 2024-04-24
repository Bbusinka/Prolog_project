on(block1, block2).
on(block2, block3).
on(block3, block4).
on(block4, block5).

above(X, Y):-
	on(X, Y).
above(X, Z):-
	on(X, Y),
	above(Y, Z).
