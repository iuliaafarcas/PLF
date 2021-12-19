%a. Write a predicate to test if a list is a set.
% noOcc(l1l2..ln, e)=
% { 0,n=0
% {  1+ noOcc(l2..ln, e),l1=e
% { noOcc(l2..ln, e), l1 != e
%  noOcc(L: list, E: number, R: number)
%  flow (i,i,o) ;

noOcc([],_,0).
noOcc([E|T],E,R):-
    !,
    noOcc(T,E,R1),
    R is R1 + 1.
noOcc([H|T],E,R):-
    H =\= E,
    noOcc(T,E,R).
%setTest(l1l2...ln)=
%              true,n=0
%              false, noOcc(l2l3..ln,l1)>0
%              setTest(l2...ln), otherwise
%setTest(L: list )  
%setTest(i)
setTest([]).
setTest([H|T]):-
    noOcc(T,H,R1),
    R1 =:= 0,
    !,
    setTest(T).
setTest([H|T]):-
	noOcc(T,H,R1),
    R1 > 0,
    fail.


% varianta 2: 
% 
%setTest([]).
%setTest([H|T]):-
%    noOcc(T,H,R1),
%    R1 =:= 0,
%    setTest(T).
%    

%b. Write a predicate to remove the first three occurrences of an element in a list.
% If the element occurs less than three times, all occurrences will be removed.


%removeFirstThree(l1l2..ln, e, counter)=
%                             [], n=0
%                             removeFirstThree(l2..ln, e, counter-1), l1=e and counter>0
%                             l1  reunit removeFirstThree(l2..ln, e, counter)  , l1=e and counter =0
%                             l1  reunit removeFirstThree(l2..ln, e, counter)  , l1!=e

%removeFirstThree(L: list, E: number, Counter: number, R: list)
%removeFirstThree(i,i,i,o),
%removeFirstThree(i,i,i,i)

removeFirstThree([], _, _,[]).
removeFirstThree([E|T], E, Counter,R):-
    Counter>0,
    !,
    NewCounter is Counter - 1,
    removeFirstThree(T, E, NewCounter,R).
removeFirstThree([E|T], E, Counter,[E|R]):-
    Counter =:= 0,
    !,
    removeFirstThree(T, E, Counter,R).
removeFirstThree([H|T], E, Counter,[H|R]):-
    H =\= E,
    removeFirstThree(T, E, Counter,R).
