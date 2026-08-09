% Parent facts
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Who is male, who is female
male(tom).
male(bob).
male(pat).
male(jim).
female(pam).
female(liz).
female(ann).

% Rules
sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y).
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y).
grandma(X, Y) :- female(X), parent(X, Z), parent(Z, Y).
grandpa(X, Y) :- male(X), parent(X, Z), parent(Z, Y).