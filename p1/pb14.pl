% a. Write a predicate to test equality of two sets without using the set difference.
% [1 2 3 4] [3 4 5 6] =>[1 2 3 4 3 4 5 6 ]
% [1 2 3 4] [1 2 3 4]
% [1,2]
% [2,2]
% inserare(l1l2...ln, p1p2..pm)={ p1p2..pm,n=0
% 								{ l1 reunit inserare(l2...ln, p1p2..pm)
inserare([],P,P):-
    !.
inserare([H|T],P,[H|R]):-
    inserare(T,P,R).
% noOcc(l1l2..ln, e)=0, n=0
% 					1+noOcc(l2..ln, e), l1=e
% 					noOcc(l2..ln, e), otherwise
noOcc([],_,0):-
    !.
noOcc([E|T],E,R):-
    !,
    noOcc(T,E,R1),
    R is R1+1.
noOcc([H|T],E,R):-
    H =\= E,
    noOcc(T,E,R).

% removeAtom(l1l2...ln, e)=
%                         [], n=0
%                         l1  union removeAtom(l2l3..ln,e)  , l1 !=e
%			              removeAtom(l2l3..ln,e)   , l1=e
%						

removeAtom([],_,[]).
removeAtom([E|T],E,REZ):-
    !,
    removeAtom(T,E,REZ).
removeAtom([H|T],E,[H | REZ]):-
    H =\= E,
    removeAtom(T,E,REZ).

% noOccPairs(l1l2..ln)= 
%                 [],n=0
%                 [l1, noOcc(l1l2..ln,l1)] reunit noOccPairs(removeAtom(l1l2..ln,l1)) otherwise

noOccPairs([],[]):-
    !.
noOccPairs([H|T],  [[H , N1] | NewTail] ):-
    noOcc([H|T],H,N1),
    removeAtom([H|T], H,R1),
	noOccPairs(R1,NewTail).


% checkPairs(l1l2..ln)= true, n=0
%                     false, l12 !=2
%                      checkPairs(l2l3..ln), otherwise

checkPairs([]):-
    !.
checkPairs([[_,T1]|T]):-
    T1=:=2,
    !,
    checkPairs(T).
checkPairs([[_,T1]|_]):-
    T1=\= 2,
    fail.
 

mainFunc(L,P):-
    inserare(L,P,List),
    noOccPairs(List,Perechi),
    checkPairs(Perechi).

% b. Write a predicate to select the n-th element of a given list.

%selectEl(l1l2..ln,pos,k)={  [], n=0
%                         { l1, k=pos
%                         { selectEl(l2..ln,pos+1,k), k!=pos

selectEl([],_,_,[]):-
    !.
selectEl([H|_], POS,K,H):-
    POS=:=K,
    !.
selectEl([_|T], POS,K,R):-
    K=\=POS, 
    NewPos is POS+1,
    selectEl(T, NewPos,K,R).
main(L,K,R):-
    selectEl(L,1,K,R). 
