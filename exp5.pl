% Facts: connected(Node1, Node2, Cost)
connected(a, b, 2).
connected(a, c, 4).
connected(b, d, 3).
connected(b, e, 1).
connected(c, f, 2).
connected(c, g, 5).
connected(d, h, 6).
connected(e, h, 2).
connected(g, h, 1).
connected(a, h, 9).  
bfs(Start, Goal, Path) :-
    search([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

search([[Goal|Path]|_], Goal, [Goal|Path]).
search([Path|Paths], Goal, Solution) :-
    extend(Path, NewPaths),
    append(Paths, NewPaths, Paths1),
    search(Paths1, Goal, Solution).

extend([Node|Path], NewPaths) :-
    findall([NewNode,Node|Path],
            (connected(Node, NewNode, _), \+ member(NewNode, [Node|Path])),
            NewPaths).

% Query
% ?- bfs(a, d, Path).