
% SECTION 7: CUSTOM LIST & UTILITY PREDICATES
% (No use of msort, sort, nth0, max_list etc.)

% member check
% Natural language: "Is X in this list?"
my_member(X, [X|_]).
my_member(X, [_|T]) :- my_member(X, T).

% list length
my_length([], 0).
my_length([_|T], N) :-
    my_length(T, N1),
    N is N1 + 1.

% append two lists 
my_append([], L, L).
my_append([H|T], L, [H|R]) :- my_append(T, L, R).

% reverse a list 
my_reverse([], []).
my_reverse([H|T], R) :-
    my_reverse(T, RT),
    my_append(RT, [H], R).

% maximum of two numbers 
my_max2(X, Y, X) :- X >= Y, !.
my_max2(_, Y, Y).

% minimum of two numbers
my_min2(X, Y, X) :- X =< Y, !.
my_min2(_, Y, Y).

% maximum in a list
% Natural language: "What is the highest rank in this list?"
my_max_list([X], X) :- !.
my_max_list([H|T], Max) :-
    my_max_list(T, TMax),
    my_max2(H, TMax, Max).

% minimum in a list 
my_min_list([X], X) :- !.
my_min_list([H|T], Min) :-
    my_min_list(T, TMin),
    my_min2(H, TMin, Min).

% insertion sort (ascending)
% Natural language: "Sort colleges by rank, lowest first"
insert_sorted(X, [], [X]).
insert_sorted(X, [H|T], [X,H|T]) :- X =< H, !.
insert_sorted(X, [H|T], [H|Sorted]) :-
    insert_sorted(X, T, Sorted).

insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedT),
    insert_sorted(H, SortedT, Sorted).

% sort pairs by second element (used for scoring)
% Pair = college_id-Score
insert_pair(P-S, [], [P-S]).
insert_pair(P-S, [H-HS|T], [P-S, H-HS|T]) :- S >= HS, !.
insert_pair(P-S, [H-HS|T], [H-HS|Sorted]) :-
    insert_pair(P-S, T, Sorted).

sort_pairs_desc([], []).
sort_pairs_desc([H|T], Sorted) :-
    sort_pairs_desc(T, SortedT),
    insert_pair(H, SortedT, Sorted).

% linear search for a key in a fact
% Natural language: "Find the college with this name"
find_college_by_name(Name, CollegeID) :-
    college_name(CollegeID, Name).

% collect all colleges into a list 
all_colleges(List) :-
    findall(C, college_name(C, _), List).

% check if number is within a range 
in_range(X, Low, High) :- X >= Low, X =< High.
