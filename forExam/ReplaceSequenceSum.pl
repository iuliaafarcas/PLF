%B. Given a linear list of numbers, write a SWI-Prolog program that replaces every sequence of
%consecutive equal numbers with the sum of the sequence. This process must be repeated until there
%are no consecutive equal elements in the list. For example, for the list
%[1, 2 , 1, 1, 4, 5, 6, 7, 7, 7, 3, 3, 3, 3, 3, 3, 3, 10], the result will be [1, 8, 5, 6, 42, 10].
%[1,2,2,4,5,6,21,21,10]

%noOfOccurencesWithStop(l1l2..ln) = { 1, n=1
%									{ 1, l1!=l2
%									{ 1+ noOfOccurencesWithStop(l2..ln), otherwise

noOfOccurencesWithStop([_],1).
noOfOccurencesWithStop([H1,H2|_],1):-
    H1=\=H2,
    !.
noOfOccurencesWithStop([H1,H1|T],R):-
    noOfOccurencesWithStop([H1|T],REZ),
    R is REZ + 1.
%areWeDone(l1l2..ln) ={ false, noOfOccurencesWithStop(l1l2..ln) > 1
%                     { areWeDone(l2..ln)

areWeDone([H|T]):-
    noOfOccurencesWithStop([H|T],R),
    R>1,
    !.
areWeDone([H|T]):-
    noOfOccurencesWithStop([H|T],R),
    R =:=1,
    areWeDone(T).
%changeList(l1l2..ln, counter)= { [], n=0
%								{ changeList(l2..ln, counter-1),counter!=1
%								{ l1*noOfOccurencesWithStop(l1l2..ln) U  changeList(l2..ln, noOfOccurencesWithStop(l1l2..ln)) , counter=1 and  noOfOccurencesWithStop(l1l2..ln) > 1
%                               { l1 U changeList(l2..ln, 1),counter=1 and  noOfOccurencesWithStop(l1l2..ln) = 1

changeList([], _, []).
changeList([_|T],Counter,R):-
    Counter =\= 1,
    Counter1 is Counter - 1,
    changeList(T,Counter1,R).

changeList([H|T],Counter,[NewValue |R]):-
    Counter =:= 1,
    noOfOccurencesWithStop([H|T],Occ),
    Occ > 1,
    !,
    NewValue is H * Occ,
    changeList(T,Occ,R).

changeList([H|T],Counter,[H |R]):-
    Counter =:= 1,
    noOfOccurencesWithStop([H|T],Occ),
    Occ = 1,
    changeList(T,1,R).

% mainFunction(l1l2..ln)= { changeList(l2..ln) ,areWeDone(l1l2..ln) is true // ins ca nu am terminat


mainFunction([H|T],R):-
    areWeDone([H|T]),
    changeList([H|T],1,ChangedList),
    mainFunction(ChangedList,R).



