% a.Write a predicate to substitute in a list a value with all the elements of another list.
%  [1,2,3,2,2,1,6], 2, [111,11111] => [1,111,11111,3,111,11111,111,11111,1,6]
%  substituteList( .. R1)
%  inserare([111,11111]= list, [1,6]=R1, R)
 
% inserare(l1l2...ln,p1p2..pm)= { p1p2..pm, n=0;
%                               { l1 reunit cu inserare(l2...ln,p1p2..pm)
inserare([],L,L).
inserare([H|T], L, [H|R]):-
    inserare(T,L,R).

% substituteList(l1l2...ln, e, p1p2...pm) = [], n=0
%                                           inserare(p1..pm, substituteList(l2..ln,e,p1p2...pm)))  l1=e
%                                           l1 reunit substituteList(l2...ln, e, p1p2...pm)   , l1 !=e

substituteList([],_,_,[]):- !.
substituteList([E|T],E,P,R):-
    substituteList(T,E,P,R1),
    inserare(P,R1,R).
substituteList([H|T],E,P,[H|R]):-
     substituteList(T,E,P,R).
% b. Remove the n-th element of a list.
% removeEl(l1l2...ln, pos,k)= { [],n=1 and k=1
%                             {  l2...ln, pos=k
%							  { l1 reunit removeEl(l2...ln, pos+1,k), pos !=k
% unde pos= pozitia pe care ne aflam 
% unde k= pozitia de pe care vrem sa stergem
% 1 2 3 4 , 1
removeEl([_],1,1,[]):-
    !.
removeEl([_|T],POS,POS,T):-
    !.
removeEl([H|T],POS,K,[H|R]):-
    POS =\= K,
    NewPos is POS+1,
    removeEl(T,NewPos,K,R).

removeElMain(L,POS,R):-
    removeEl(L,1,POS,R).
