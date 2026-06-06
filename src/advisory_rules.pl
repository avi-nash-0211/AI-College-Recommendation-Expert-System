
% SECTION 13: ADVANCED RULES — SCHOLARSHIP, STRETCH GOALS,
%             SAFE CHOICES, NEGATION USAGE

% Scholarship advisory 
% Natural language: "Can this student potentially get scholarship here?"
merit_scholarship_possible(CollegeID, ExamScore, ExamType) :-
    scholarship(CollegeID, Type, _),
    (Type = merit_based ; Type = both),
    admission_cutoff(CollegeID, ExamType, Min, _),
    Threshold is Min + 2,           %% top 2 percentile above cutoff
    ExamScore >= Threshold.

% Identify "Stretch" colleges (just above current score)
% Natural language: 
% "Which colleges are slightly out of reach but worth aiming for?"
stretch_college(CollegeID, ExamType, Score) :-
    college_name(CollegeID, _),
    admission_cutoff(CollegeID, ExamType, MinScore, _),
    Gap is MinScore - Score,
    in_range(Gap, 1, 3).      %% only 1-3 percentile above current score

% Safe/sure-shot colleges
safe_college(CollegeID, ExamType, Score) :-
    college_name(CollegeID, _),
    admission_cutoff(CollegeID, ExamType, MinScore, _),
    Margin is Score - MinScore,
    Margin >= 5.               %% student is comfortably above cutoff

% Dream college (top tier, high placement, just eligible)
dream_college(CollegeID, ExamType, Score) :-
    tier(CollegeID, tier1),
    eligible(CollegeID, ExamType, Score),
    placement_stat(CollegeID, _, _, Pct),
    Pct >= 90.

% SECTION 14: NEGATION-AS-FAILURE RULES
% \+ means "not provable" — use with care.
% Only use when the closed-world assumption is safe.
% "This college does NOT offer the requested branch"
branch_not_offered(CollegeID, Course, Branch) :-
    \+ course_offered(CollegeID, Course, Branch).

% "Student is NOT eligible for this college"
not_eligible(CollegeID, ExamType, Score) :-
    \+ eligible(CollegeID, ExamType, Score).

% "College does NOT have hostel — risky for outstation students"
hostel_risk(CollegeID, StudentCity) :-
    hostel_available(CollegeID, no),
    college_location(CollegeID, CollegeCity, _),
    CollegeCity \= StudentCity.

% "College is NOT in preferred state AND is private — double concern"
location_and_type_mismatch(CollegeID, PrefState) :-
    \+ preferred_location(CollegeID, PrefState),
    college_type(CollegeID, private).

% SECTION 15: RECURSIVE RULES

% Count how many eligible colleges exist for a student
count_eligible([], _, _, 0).
count_eligible([C|Rest], ExamType, Score, Count) :-
    (   eligible(C, ExamType, Score)
    ->  count_eligible(Rest, ExamType, Score, C1),
        Count is C1 + 1
    ;   count_eligible(Rest, ExamType, Score, Count)
    ).

% Filter a list of colleges by tier
filter_by_tier([], _, []).
filter_by_tier([C|Rest], TargetTier, [C|Filtered]) :-
    tier(C, TargetTier), !,
    filter_by_tier(Rest, TargetTier, Filtered).
filter_by_tier([_|Rest], TargetTier, Filtered) :-
    filter_by_tier(Rest, TargetTier, Filtered).

% Find best placement in a list of colleges
best_placement_in_list([C], C).
best_placement_in_list([C1|Rest], Best) :-
    best_placement_in_list(Rest, BestRest),
    placement_stat(C1, _, _, P1),
    placement_stat(BestRest, _, _, P2),
    (P1 >= P2 -> Best = C1 ; Best = BestRest).

% SECTION 16: COMPARISON & ADVICE RULES

% Compare two colleges on all dimensions
% Natural language: "Which is better — VIT or SRM for CSE?"
compare_colleges(C1, C2) :-
    college_name(C1, N1),
    college_name(C2, N2),
    college_rank(C1, R1),
    college_rank(C2, R2),
    placement_stat(C1, A1, _, P1),
    placement_stat(C2, A2, _, P2),
    college_fee(C1, F1),
    college_fee(C2, F2),
    format("Comparing ~w vs ~w:~n", [N1, N2]),
    format("  NIRF Rank    : ~w vs ~w~n", [R1, R2]),
    format("  Avg Package  : ~w vs ~w LPA~n", [A1, A2]),
    format("  Placement %%  : ~w vs ~w~n", [P1, P2]),
    format("  Annual Fee   : ~w vs ~w (in thousands)~n", [F1, F2]),
    (   R1 < R2
    ->  format("  Rank Winner  : ~w~n", [N1])
    ;   format("  Rank Winner  : ~w~n", [N2])
    ),
    (   A1 > A2
    ->  format("  Placement Win: ~w~n", [N1])
    ;   format("  Placement Win: ~w~n", [N2])
    ).

% Give a budget advisory
% Natural language: "Is the student's budget realistic for Tier 1?"
budget_advisory(Budget) :-
    (   Budget >= 200
    ->  format("Budget is sufficient for Government IITs/NITs.~n")
    ;   Budget >= 150
    ->  format("Budget suits NITs and good private colleges.~n")
    ;   Budget >= 100
    ->  format("Budget is tight — look for scholarship-heavy colleges.~n")
    ;   format("Very limited budget — only government colleges recommended.~n")
    ).

% Profile summary rule — brings all facts about a college together
college_profile(CollegeID) :-
    college_name(CollegeID, Name),
    college_location(CollegeID, City, State),
    college_type(CollegeID, Type),
    college_rank(CollegeID, Rank),
    college_fee(CollegeID, Fee),
    college_accreditation(CollegeID, Grade),
    placement_stat(CollegeID, Avg, High, Pct),
    hostel_available(CollegeID, Hostel),
    tier(CollegeID, Tier),
    format("~n=== ~w ===~n", [Name]),
    format("Location    : ~w, ~w~n", [City, State]),
    format("Type        : ~w | Tier: ~w~n", [Type, Tier]),
    format("NIRF Rank   : ~w~n", [Rank]),
    format("Annual Fee  : ~w,000 INR~n", [Fee]),
    format("Accreditation: ~w~n", [Grade]),
    format("Placements  : Avg ~w LPA | Highest ~w LPA | ~w%% placed~n",
           [Avg, High, Pct]),
    format("Hostel      : ~w~n", [Hostel]). 