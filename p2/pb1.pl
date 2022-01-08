%1.   a. Sort a list with removing the double values.
% E.g.: [4 2 6 2 3 4] --> [2 3 4 6]

% merge_sort(p1p2..pn, left, right)= { [], 
% 	   								 { l1l2...ln = merge_sort(p1p2..pn, left, (left+right)/2)
% 	   								 { r1r2.. rn = merge_sort(p1p2..pn, (left+right)/2+1, right)
% 	   								 { interclasare(l1l2..lm, r1r2..rk), m=n/2+1, 
%% 	   								 	   								 


%  my_length(l1l2...ln)= { 0, n=0
%  					     { 1+my_length(l2..ln) , otherwise

my_length([],0).
my_length([_|T],R):-
    my_length(T,R1),
    R is 1+R1.
% my_append(l1l2..ln, e)={ e, n=0
% 						 { l1 reunit cu  my_append(l2..ln, e), otherwise

my_append([],E,[E]).
my_append([H|T], E, [H|R]):-
    my_append(T, E, R).
% 	   [1,2,3,4,5]=> l: [1] r: [2,3,4,5]; l: [1,2], r: [3,4]								 
% my_merge(l1l2.. ln, p1p2..pm)= { l1l2..ln, m=0
% 							  { p1p2...pm, n=0
% 							  { l1 U my_merge(l2l3..ln, p1p2..pm), l1<=p1
% 							  { p1 U my_merge(l1l2..ln, p2p3..pm), l1>p1
my_merge([],P, P).
my_merge(L,[],L).
my_merge([H1|L], [H2|P],[H1|REZ]):-
    H1 =< H2,
    !,
    my_merge(L,[H2|P],REZ).
my_merge([H1|L], [H2|P],[H2|REZ]):-
    H1 > H2,
    my_merge([H1|L],P,REZ).

% split(a1a2..an, l1l2..lm, r1r2...rk)= { my_length(l1l2l3..lm) - my_length(a2..an) =1  or my_length(l1l2l3..lm) - my_length(a2..an) = 0
% 										{ split(a2..an,  l1l2..lm U a1 , a2..an), my_length(l1l2l3..lm)<my_length(a2..an)+1
% 										
% 	

split([H|T],L,L, [H|T]):-
    my_length([H|T], RL),
    my_length(L, LL),
    Diff is LL - RL,
    Diff >= 0,
    Diff =< 1, !.

split([H|T],L, LR, RR):-
    my_append(L, H, NewL),
    split(T, NewL, LR, RR ).
          
splitMain([H|T],LR, RR):-
    split([H|T],[], LR, RR).
          


%merge_sort(l1...ln) =
% 						[], n = o
% 						[l1], n = 1
% 						merge( merge_sort(l1....l(n/2)), merge_sort(l(n/2+1)...ln)), otherwise
merge_sort([],[]).
merge_sort([H], [H]).
merge_sort([H|T], REZ):-
    splitMain([H|T],L,R),
    merge_sort(L,LR),
    merge_sort(R, RR),
    my_merge(LR, RR,REZ).

%removeDuplicates(l1l2...ln)={ [], n=0
%						     { l1, n=1
%							 { removeDuplicates(l2...ln)    , l1=l2
%							 { l1 U removeDuplicates(l2...ln), l1 !=l2
removeDuplicates([],[]).
removeDuplicates([H],[H]).
removeDuplicates([H1, H2|T], REZ):-
    H1 =:=H2,
    !,
    removeDuplicates([H2|T],REZ).
removeDuplicates([H1, H2|T], [H1|REZ]):-
    H1 =\=H2,
    removeDuplicates([H2|T],REZ).

% main(l1l2..ln)={  removeDuplicates(mergesort(l1l2..ln))
% 					
main(L,REZ):-
    merge_sort(L,R),
    removeDuplicates(R, REZ).
    
