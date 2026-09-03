% Facts
in_room(monkey).
in_room(chair).
in_room(bananas).
clever(monkey).
tall(chair).
can_climb(monkey, chair).
can_push(monkey, chair).

at(monkey, door).
at(chair, window).
at(bananas, center).

moved_under(Chair, Bananas) :-
    can_push(monkey, Chair),
    at(Bananas, center).

get_on(X, Y) :-
    can_climb(X, Y).

near(X, Bananas) :-
    moved_under(chair, Bananas),
    get_on(X, chair).

can_reach(X, Y) :-
    clever(X),
    near(X, Y).

% Query
% ?- can_reach(monkey, bananas).
% Possible questions:
%?- can_reach(A, B).
%?- can_reach(monkey, bananas).
%?- can_reach(chair, bananas).
%?- clever(monkey).
%?- tall(chair).
%?- can_climb(monkey, chair).
%?- can_push(monkey, chair).
%?- at(bananas, X).
%?- at(monkey, X).
%?- at(chair, X).
%?- near(monkey, bananas).
%?- moved_under(chair, bananas).
%?- get_on(monkey, chair).