%a. Write a predicate to determine the difference of two sets.


%noOcc(l1l2..ln,e)= 0, n=0
%                1+noOcc(l2..ln), l1=e
%                 noOcc(l2..ln), l1!=e

noOcc([],_,0).

noOcc([E|T], E, REZ):-
    noOcc(T, E, REZ1),
    REZ is REZ1 + 1.

noOcc([H|T], E, REZ):-
    H =\= E,
    noOcc(T, E, REZ).

%diffSets(l1l2l3..ln, p1p2...pm)=
%                              l1l2..ln, m=0
%                              [], n=0
%                              diffSets(l2..ln, p1p2..pn), noOcc(p1p2..pn,l1)>0
%                              l1 reunit diffSets(l2..ln, p1p2..pn), noOcc(p1p2..pn,l1)=0

diffSets([],_,[]).
diffSets(L,[],L).
diffSets([H|T],P,REZ):-
    noOcc(P,H,NoOcc),
    NoOcc>0,
    diffSets(T,P,REZ).
diffSets([H|T],P,[H| REZ]):-
    noOcc(P,H,NoOcc),
    NoOcc =:= 0,
    diffSets(T,P,REZ).


%b. Write a predicate to add value 1 after every even element from a list.
% [1,2,3,4,5] =>[1,2,1,3,4,1,5]
%addElem(l1l2..ln)= { [], n=0
%                     { l1 reunit 1 reunit addElem(l2..ln),l1 % 2 ==0 
%                      { l1  reunit addElem(l2..ln),l1 % 2 ==1

addElem([],[]).
addElem([H|T], [H, 1| REZ]):-
    H mod 2 =:= 0,
    addElem(T, REZ).
addElem([H|T], [H| REZ]):-
    H mod 2 =:= 1,
	addElem(T, REZ).
   
