% a. Write a predicate to determine if a list has even numbers of elements without counting the elements from the list.



% example: [1,2,3,4,5]=>false ([1,2],[3,4] 5) [1,2,3,4]=> true [1,2], [3,4]

% evenLength(l1l2...ln)=
%                        true,n=0
%                        false, n=1
%                        evenLength(l3l4..ln), otherwise

%evenLength(L: list). evenLength(i)
evenLength([]).
evenLength([_]):-
    fail.
evenLength([_,_|T]):-
    evenLength(T).

% b. Write a predicate to delete first occurrence of the minimum number from a list.

%mini(a, b)=
%        a, a<=b
%        b otherwise
mini(A,A,A).
mini(A,B,A):-
    A < B.
mini(A,B,B):-
    A>B.

%minimumElement(l1l2..ln)=
%                    { l1, n=1
%                    { mini(l1,minimumElement(l2..ln)), otherwise

minimumElement([H],H).
minimumElement([H|T],R):-
    minimumElement(T,R1),
    mini(H,R1,R).
%minimumElement(l1l2..ln)
%deleteFirstMin(l1l2..ln,min)=
%                      [], n=1
%                      l2..ln, l1= min
%                      l1 reunit deleteFirstMin(l2..ln), otherwise

% [2,1,3,5,1,8]
deleteFirstMin([_],_,[]).
deleteFirstMin([E|T],E,T).
deleteFirstMin([H|T],E,[H|R]):-
    deleteFirstMin(T,E,R).
    
%deleteMain(l1l2..ln)=
% deleteFirstMin(l1l2..ln,minimumElement(l1l2..ln))

deleteMain(L,R):-
    minimumElement(L,Min),
    deleteFirstMin(L,Min,R).
   
