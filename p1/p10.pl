% a. Define a predicate to test if a list of an integer elements has a "valley" aspect (a set has a "valley" aspect if elements decreases 
% up to a certain point, and then increases. eg: 10 8 6 9 11 13 –has a “valley” aspect     1 2 1 2 1   2 1 2
% 𝑚𝑜𝑢𝑛𝑡𝑎𝑖𝑛(𝑙1𝑙2...𝑙𝑛,𝑓)={𝑡𝑟𝑢𝑒,𝑛≤1,𝑓=1
%                      {𝑚𝑜𝑢𝑛𝑡𝑎𝑖𝑛(𝑙2...𝑙𝑛,0),𝑙1<𝑙2,𝑓=0
%                      {𝑚𝑜𝑢𝑛𝑡𝑎𝑖𝑛(𝑙2...𝑙𝑛,1),𝑙1≥𝑙2,𝑓=0
%                      {𝑚𝑜𝑢𝑛𝑡𝑎𝑖𝑛(𝑙2...𝑙𝑛,1),𝑙1>𝑙2,𝑓=1
%                      {𝑓𝑎𝑙𝑠𝑒,𝑜𝑡ℎ𝑒𝑟𝑤𝑖𝑠𝑒

% 1 2 3 4 5 4 3 2 1


% 10 9 8 7 8 9 10 , initiaal, f=1 pt descrescator
%                             f =0 pt crescator
%valley(l1l2...ln, f) = { true, n=1 si f=0
%						{ valley(l2...ln, 1) , l1>l2 si f=1
%                       { valley(l2...ln, 0), l1<l2 si f=1
%						{ valley(l2...ln, 0) l1<l2 si f=0
%						{ false, otherwise 


valley([_],0):-
    !.
valley([H1, H2|T], 1):-
    H1>H2,!,
    valley([H2|T], 1).
valley([H1, H2|T], 1):-
    H1<H2,!,
    valley([H2|T], 0).
valley([H1,H2|T], 0):-
    H1<H2,!,
    valley([H2|T], 0).

valleyMain(L):-
    valley(L,1).

% b. Calculate the alternate sum of list’s elements(l1 -l2 + l3 ...).
% [1 5 2 7]=> 1-5+2-7  1 + (-5) + 2 + (-7)
% alternateSum(l1l2..ln, pos)={l1, n=1 and pos=1
% 							  { -l1 , n=1 and pos=0
%                             {   l1+alternateSum(l2..ln,0), pos=1
%                             {     alternateSum(l2..ln,1)-l1, pos=0


alternateSum([H],0,NewH):-
    !,
    NewH is -H.
alternateSum([H],1,H):-
    !.
alternateSum([H|T], 1, R):-
    !,
    alternateSum(T, 0, R1),
    R is R1+H.
alternateSum([H|T], 0, R):-
    alternateSum(T, 1, R1),
    R is R1-H.

alternateSumMain(L,R):-
    alternateSum(L,1,R).

