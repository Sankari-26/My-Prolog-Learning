% N-Queens Problem

numlist(N, N, [N]) :- !.
numlist(I, N, [I|Rest]) :-
    I < N,
    I1 is I + 1,
    numlist(I1, N, Rest).

queens(N, Qs) :-
    numlist(1, N, Ns),
    permutation(Ns, Qs),
    safe(Qs).

safe([]).
safe([Q|Qs]) :-
    no_attack(Q, Qs, 1),
    safe(Qs).

no_attack(_, [], _).
no_attack(Q, [Q1|Qs], D) :-
    Q =\= Q1,
    abs(Q - Q1) =\= D,
    D1 is D + 1,
    no_attack(Q, Qs, D1).