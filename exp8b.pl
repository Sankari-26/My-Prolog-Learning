% ---------------------------------
% Medical Diagnosis System
% ---------------------------------

% High fever indicates infection
infection(X) :-
    high_fever(X).

% High fever also indicates fever
fever(X) :-
    high_fever(X).

% Cough and fever indicate chest infection
chest_infection(X) :-
    cough(X),
    fever(X).

% A nurse checks a patient
nurse(n1).
patient(p1).
checked(n1, p1).

% Fever indicates viral infection
viral_infection(X) :-
    fever(X).

% Rash indicates viral infection
viral_infection(X) :-
    rash(X).

% Positive test and clear test confirm disease
confirms(X, disease) :-
    positive_test(X),
    clear_test(X).

% Infection without fever is a violation
violation(X) :-
    infection(X),
    \+ fever(X).

% ---------------------------------
% Facts
% ---------------------------------

% Alice has high fever
high_fever(alice).

% Alice has cough
cough(alice).

% Bob has rash
rash(bob).

% Carl has a positive test
positive_test(carl).

% Carl has a clear test
clear_test(carl).