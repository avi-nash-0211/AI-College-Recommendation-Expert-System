
% SECTION 11: SCORING ENGINE
% Each college is scored on multiple dimensions.
% Score is a weighted sum — no built-in aggregate used.
% Natural language: 
% "Give 30 points for rank, 25 for placement, 20 for fee,
%  15 for accreditation, 10 for location match"

% Rank score: better rank = higher score (max 30)
rank_score(CollegeID, Score) :-
    college_rank(CollegeID, Rank),
    (   Rank =< 10  -> Score = 30
    ;   Rank =< 25  -> Score = 25
    ;   Rank =< 50  -> Score = 18
    ;   Rank =< 75  -> Score = 12
    ;                  Score = 6
    ).

% Placement score (max 25)
placement_score(CollegeID, Score) :-
    placement_stat(CollegeID, AvgPkg, _, PlacePct),
    (   PlacePct >= 90, AvgPkg >= 20 -> Score = 25
    ;   PlacePct >= 85, AvgPkg >= 12 -> Score = 20
    ;   PlacePct >= 80, AvgPkg >= 8  -> Score = 15
    ;   PlacePct >= 70                -> Score = 10
    ;                                   Score = 5
    ).

% Fee score: lower fee = higher score (max 20)
fee_score(CollegeID, Budget, Score) :-
    college_fee(CollegeID, Fee),
    Margin is Budget - Fee,
    (   Margin >= 200 -> Score = 20
    ;   Margin >= 100 -> Score = 15
    ;   Margin >= 50  -> Score = 10
    ;   Margin >= 0   -> Score = 5
    ;                    Score = 0     %% over budget
    ).

% Accreditation score (max 15)
accreditation_score(CollegeID, Score) :-
    college_accreditation(CollegeID, Grade),
    accreditation_value(Grade, V),
    Score is V * 3.

% Location preference score (max 10) 
location_score(CollegeID, PreferredState, Score) :-
    college_location(CollegeID, _, State),
    (   State = PreferredState -> Score = 10
    ;                             Score = 0
    ).

% Total score aggregation
% This is the main scoring rule that combines everything.
total_score(CollegeID, Budget, PreferredState, Total) :-
    rank_score(CollegeID, RS),
    placement_score(CollegeID, PS),
    fee_score(CollegeID, Budget, FS),
    accreditation_score(CollegeID, AS),
    location_score(CollegeID, PreferredState, LS),
    Total is RS + PS + FS + AS + LS.
