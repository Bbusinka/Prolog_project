ojciec(dawid, ola).
ojciec(tomek, kamila).
ojciec(jan, tomek).
ojciec(tomek, marek).
matka(anna, ola).
matka(julia, bartek).
matka(maria, kamila).
mezczyzna(dawid).
mezczyzna(tomek).
mezczyzna(jan).
mezczyzna(marek).
mezczyzna(bartek).
kobieta(ola).
kobieta(kamila).
kobieta(anna).
kobieta(julia).
kobieta(maria).
rodzic(dawid, ola).
rodzic(tomek, kamila).
rodzic(jan, tomek).
rodzic(tomek, marek).
rodzic(anna, ola).
rodzic(julia, bartek).
rodzic(maria, kamila).

jest_matka(X):-
	kobieta(X),
	matka(X, Dziecko).
	
jest_ojcem(X):-
	mezczyzna(X),
	ojciec(X, Dziecko).

jest_synem(X):-
	mezczyzna(X),
	rodzic(Rodzic, X).

siostra(X, Y):-
	kobieta(X),
	matka(Rodzic, X),
	ojciec(Rodzic2, X),
	matka(Rodzic, Y),
	ojciec(Rodzic2, Y),
	X\=Y;
	kobieta(X),
	matka(Rodzic3, X),
	matka(Rodzic3, Y),
	X\=Y;
	kobieta(X),
	ojciec(Rodzic4, X),
	ojciec(Rodzic4, Y),
	X\=Y.
	
dziadek(X, Y):-
	mezczyzna(X),
	ojciec(X, Rodzic),
	rodzic(Rodzic, Y).
	
rodzenstwo(X, Y):-
	matka(Rodzic, X),
	ojciec(Rodzic2, X),
	matka(Rodzic, Y),
	ojciec(Rodzic2, Y),
	X\=Y;
	matka(Rodzic3, X),
	matka(Rodzic3, Y),
	X\=Y;
	ojciec(Rodzic4, X),
	ojciec(Rodzic4, Y),
	X\=Y.













