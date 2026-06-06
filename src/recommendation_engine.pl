
% SECTION 12: MAIN RECOMMENDATION RULES
% Natural language query:
% "Recommend colleges for a student who scored 96 in JEE Main,
%  wants CSE, has budget 300k, prefers Delhi, needs hostel"
% recommend(ExamType, Score, Course, Branch, Budget,
%           PreferredState, NeedHostel, CollegeID, FinalScore)

recommend(ExamType, Score, Course, Branch, Budget,
          PrefState, NeedHostel, CollegeID, FinalScore) :-
    college_name(CollegeID, _),                        % iterate all colleges
    eligible(CollegeID, ExamType, Score),              % hard filter: score cutoff
    branch_available(CollegeID, Course, Branch),       % hard filter: branch offered
    fee_affordable(CollegeID, Budget),                 % hard filter: within budget
    hostel_ok(CollegeID, NeedHostel),                  % hard filter: hostel needed?
    total_score(CollegeID, Budget, PrefState, FinalScore). % soft score

% Get ALL recommendations as a scored, sorted list
% This is the top-level query predicate.
top_recommendations(ExamType, Score, Course, Branch,
                    Budget, PrefState, NeedHostel, SortedList) :-
    findall(
        CollegeID-FinalScore,
        recommend(ExamType, Score, Course, Branch,
                  Budget, PrefState, NeedHostel, CollegeID, FinalScore),
        Pairs
    ),
    sort_pairs_desc(Pairs, SortedList).

% Show top N recommendations
top_n(_, 0, _)   :- !.
top_n([], _, _)  :- !.
top_n([C-S|Rest], N, Count) :-
    N > 0,
    Count1 is Count + 1,
    college_name(C, Name),
    tier(C, Tier),
    college_rank(C, Rank),
    placement_stat(C, Avg, _High, Pct),
    format("~w. ~w (Score: ~w | Tier: ~w | NIRF: ~w | Avg Pkg: ~w LPA | ~w% placed)~n",
           [Count1, Name, S, Tier, Rank, Avg, Pct]),
    N1 is N - 1,
    top_n(Rest, N1, Count1).

% Wrapper to call cleanly
recommend_top5(ExamType, Score, Course, Branch,
               Budget, PrefState, NeedHostel) :-
    top_recommendations(ExamType, Score, Course, Branch,
                        Budget, PrefState, NeedHostel, List),
    (   List = []
    ->  write('No colleges found matching your criteria.')
    ;   write(' Top Recommendations '), nl,
        top_n(List, 5, 0)
    ).
