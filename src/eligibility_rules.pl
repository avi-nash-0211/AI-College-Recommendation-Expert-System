
% SECTION 8: TIER CLASSIFICATION
% Rule ordering matters: Tier 1 is checked first.
% Cut (!) prevents backtracking into lower tiers once matched.
% Natural language:
% "A college is Tier 1 if its rank is between 1 and 25"
% "A college is Tier 2 if it's not Tier 1 but rank ≤ 60"

tier(CollegeID, tier1) :-
    college_rank(CollegeID, Rank),
    in_range(Rank, 1, 25), !.

tier(CollegeID, tier2) :-
    college_rank(CollegeID, Rank),
    in_range(Rank, 26, 60), !.

tier(CollegeID, tier3) :-
    college_rank(CollegeID, Rank),
    in_range(Rank, 61, 100), !.

tier(CollegeID, tier4) :-
    college_rank(CollegeID, Rank),
    Rank > 100.

% SECTION 9: ACCREDITATION STRENGTH ORDERING
% Rule: accreditation_value maps grade to numeric strength
% Used for comparisons in scoring

accreditation_value('A++', 5).
accreditation_value('A+',  4).
accreditation_value('A',   3).
accreditation_value('B++', 2).
accreditation_value('B+',  1).
accreditation_value('B',   0).

% Is college "well accredited" (A or above)?
well_accredited(CollegeID) :-
    college_accreditation(CollegeID, Grade),
    accreditation_value(Grade, V),
    V >= 3.

% SECTION 10: ELIGIBILITY CHECKING RULES
% Natural language query:
% "Is a student with JEE Main 96 percentile eligible for NIT Trichy?"
% → eligible_for_exam(nit_trichy, jee_main, 96)
% Unification: CollegeID unifies with nit_trichy,
%              Exam unifies with jee_main,
%              Score unifies with 96.
% Then Prolog checks: is 96 in [97, 100]? No → backtrack.

eligible_for_exam(CollegeID, Exam, Score) :-
    admission_cutoff(CollegeID, Exam, MinScore, MaxScore),
    in_range(Score, MinScore, MaxScore).

% For JEE Advanced — rank-based (lower is better)
eligible_jee_advanced(CollegeID, Rank) :-
    admission_cutoff(CollegeID, jee_advanced, MinRank, MaxRank),
    in_range(Rank, MinRank, MaxRank).

% General eligibility — tries all exam types
% Backtracking: tries jee_main, then bitsat, then others
eligible(CollegeID, StudentExamType, Score) :-
    eligible_for_exam(CollegeID, StudentExamType, Score).

% Branch availability check
branch_available(CollegeID, Course, Branch) :-
    course_offered(CollegeID, Course, Branch).

% Fee affordability check
fee_affordable(CollegeID, Budget) :-
    college_fee(CollegeID, Fee),
    Fee =< Budget.

% Fee with scholarship — checks if net fee fits budget
% Natural language: "After scholarship, can student afford this college?"
affordable_with_scholarship(CollegeID, Budget) :-
    college_fee(CollegeID, Fee),
    scholarship(CollegeID, _, MaxScholarship),
    NetFee is Fee - MaxScholarship,
    NetFee =< Budget.

% Preferred location match
preferred_location(CollegeID, PreferredState) :-
    college_location(CollegeID, _, State),
    State = PreferredState.

% Hostel requirement check
hostel_ok(_CollegeID, no)  :- !.   %Student does not need hostel → always ok
hostel_ok(CollegeID, yes) :-
    hostel_available(CollegeID, yes).
