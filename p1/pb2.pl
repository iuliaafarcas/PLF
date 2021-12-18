% a. Write a predicate to remove all occurrencesof a certain atom from a list.
% removeAtom(l1l2...ln, e)=
%                         [], n=0
%                         l1  union removeAtom(l2l3..ln,e)  , l1 !=e
%			              removeAtom(l2l3..ln,e)   , l1=e
%						

removeAtom([],_,[]).
removeAtom([E|T],E,REZ):-
    removeAtom(T,E,REZ).
removeAtom([H|T],E,[H | REZ]):-
    H =\= E,
    removeAtom(T,E,REZ).


%Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom has n occurrences.
    
  % NoOcc(l1l2..ln, e)=
%                    0, n=0
%		             1 + NoOcc(l2..ln, e)   , l1=e
%                    NoOcc(l2..ln, e), otherwise
%  1 2 1 1

noOcc([],_,0).
noOcc([E|T], E, REZ):-
    noOcc(T, E, REZ1),
    REZ is REZ1 + 1.
noOcc([H|T], E, REZ):-
    H =\= E,
    noOcc(T, E, REZ).

% noOccPairs(l1l2..ln)= 
%                 [],n=0
%                 [l1, noOcc(l1l2..ln,l1)] reunit noOccPairs(removeAtom(l1l2..ln,l1)) otherwise

noOccPairs([],[]).
noOccPairs([H|T],  [[H , N1] | NewTail] ):-
    noOcc([H|T],H,N1),
    removeAtom([H|T], H,R1),
	noOccPairs(R1,NewTail).
