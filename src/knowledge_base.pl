%  COLLEGE RECOMMENDATION SYSTEM

% SECTION 1: COLLEGE "OBJECTS" — OOP-style attribute facts
% Each college is represented as a set of attribute facts,
% exactly like fields in a Java object.

% college_name(id, full_name)
college_name(iit_bombay,    'IIT Bombay').
college_name(iit_delhi,     'IIT Delhi').
college_name(nit_trichy,    'NIT Trichy').
college_name(nit_warangal,  'NIT Warangal').
college_name(bits_pilani,   'BITS Pilani').
college_name(vit_vellore,   'VIT Vellore').
college_name(srm_chennai,   'SRM Institute Chennai').
college_name(manipal,       'Manipal Institute of Technology').
college_name(pec_chandigarh,'Punjab Engineering College').
college_name(dtu_delhi,     'Delhi Technological University').
college_name(nsit_delhi,    'NSIT Delhi').
college_name(thapar,        'Thapar Institute').
college_name(upes_dehradun, 'UPES Dehradun').
college_name(lpu_jalandhar, 'Lovely Professional University').
college_name(amity_noida,   'Amity University Noida').

% college_location(id, city, state)
college_location(iit_bombay,    mumbai,     maharashtra).
college_location(iit_delhi,     delhi,      delhi).
college_location(nit_trichy,    trichy,     tamilnadu).
college_location(nit_warangal,  warangal,   telangana).
college_location(bits_pilani,   pilani,     rajasthan).
college_location(vit_vellore,   vellore,    tamilnadu).
college_location(srm_chennai,   chennai,    tamilnadu).
college_location(manipal,       manipal,    karnataka).
college_location(pec_chandigarh,chandigarh, punjab).
college_location(dtu_delhi,     delhi,      delhi).
college_location(nsit_delhi,    delhi,      delhi).
college_location(thapar,        patiala,    punjab).
college_location(upes_dehradun, dehradun,   uttarakhand).
college_location(lpu_jalandhar, jalandhar,  punjab).
college_location(amity_noida,   noida,      uttarpradesh).


% college_type(id, government|private|deemed)
college_type(iit_bombay,    government).
college_type(iit_delhi,     government).
college_type(nit_trichy,    government).
college_type(nit_warangal,  government).
college_type(bits_pilani,   private).
college_type(vit_vellore,   private).
college_type(srm_chennai,   private).
college_type(manipal,       private).
college_type(pec_chandigarh,government).
college_type(dtu_delhi,     government).
college_type(nsit_delhi,    government).
college_type(thapar,        private).
college_type(upes_dehradun, private).
college_type(lpu_jalandhar, private).
college_type(amity_noida,   private).

% NIRF Rankings (2025)
college_rank(iit_bombay,    3).
college_rank(iit_delhi,     2).
college_rank(nit_trichy,    10).
college_rank(nit_warangal,  26).
college_rank(bits_pilani,   27).
college_rank(vit_vellore,   11).
college_rank(srm_chennai,   40).
college_rank(manipal,       50).
college_rank(pec_chandigarh,70).
college_rank(dtu_delhi,     36).
college_rank(nsit_delhi,    80).
college_rank(thapar,        55).
college_rank(upes_dehradun, 90).
college_rank(lpu_jalandhar, 100).
college_rank(amity_noida,   110).

% college_fee(id, annual_fee_in_thousands)
college_fee(iit_bombay,    200).
college_fee(iit_delhi,     200).
college_fee(nit_trichy,    150).
college_fee(nit_warangal,  150).
college_fee(bits_pilani,   500).
college_fee(vit_vellore,   350).
college_fee(srm_chennai,   300).
college_fee(manipal,       420).
college_fee(pec_chandigarh,120).
college_fee(dtu_delhi,     130).
college_fee(nsit_delhi,    130).
college_fee(thapar,        280).
college_fee(upes_dehradun, 250).
college_fee(lpu_jalandhar, 200).
college_fee(amity_noida,   280).

% college_accreditation(id, grade)   % NAAC A++, A+, A, B++, etc.
college_accreditation(iit_bombay,    'A++').
college_accreditation(iit_delhi,     'A++').
college_accreditation(nit_trichy,    'A++').
college_accreditation(nit_warangal,  'A+').
college_accreditation(bits_pilani,   'A+').
college_accreditation(vit_vellore,   'A+').
college_accreditation(srm_chennai,   'A').
college_accreditation(manipal,       'A').
college_accreditation(pec_chandigarh,'A').
college_accreditation(dtu_delhi,     'A+').
college_accreditation(nsit_delhi,    'A').
college_accreditation(thapar,        'A+').
college_accreditation(upes_dehradun, 'B++').
college_accreditation(lpu_jalandhar, 'A').
college_accreditation(amity_noida,   'A').

%college_seats(id, seats)
college_seats(iit_bombay,    900).
college_seats(iit_delhi,     800).
college_seats(nit_trichy,    960).
college_seats(nit_warangal,  1100).
college_seats(bits_pilani,   2000).
college_seats(vit_vellore,   5000).
college_seats(srm_chennai,   6000).
college_seats(manipal,       4000).
college_seats(pec_chandigarh,900).
college_seats(dtu_delhi,     1400).
college_seats(nsit_delhi,    1200).
college_seats(thapar,        2500).
college_seats(upes_dehradun, 3000).
college_seats(lpu_jalandhar, 8000).
college_seats(amity_noida,   4000).


% SECTION 2: COURSES OFFERED PER COLLEGE
% course_offered(CollegeID, CourseName, Branch)


course_offered(iit_bombay,    btech, computer_science).
course_offered(iit_bombay,    btech, electrical).
course_offered(iit_bombay,    btech, mechanical).
course_offered(iit_bombay,    btech, chemical).
course_offered(iit_delhi,     btech, computer_science).
course_offered(iit_delhi,     btech, civil).
course_offered(iit_delhi,     btech, electrical).
course_offered(nit_trichy,    btech, computer_science).
course_offered(nit_trichy,    btech, mechanical).
course_offered(nit_trichy,    btech, electronics).
course_offered(nit_warangal,  btech, computer_science).
course_offered(nit_warangal,  btech, electrical).
course_offered(bits_pilani,   btech, computer_science).
course_offered(bits_pilani,   btech, mechanical).
course_offered(bits_pilani,   btech,   civil).
course_offered(vit_vellore,   btech, computer_science).
course_offered(vit_vellore,   btech, electronics).
course_offered(vit_vellore,   btech, chemical).
course_offered(srm_chennai,   btech, computer_science).
course_offered(srm_chennai,   btech, civil).
course_offered(manipal,       btech, computer_science).
course_offered(manipal,       btech, electrical).
course_offered(dtu_delhi,     btech, computer_science).
course_offered(dtu_delhi,     btech, electronics).
course_offered(nsit_delhi,    btech, computer_science).
course_offered(nsit_delhi,    btech, electronics).
course_offered(thapar,        btech, computer_science).
course_offered(thapar,        btech, mechanical).
course_offered(pec_chandigarh,btech, computer_science).
course_offered(upes_dehradun, btech, computer_science).
course_offered(lpu_jalandhar, btech, computer_science).
course_offered(amity_noida,   btech, computer_science).

% SECTION 3: ADMISSION CUTOFFS
% admission_cutoff(CollegeID, ExamType, MinScore, MaxScore)
% ExamType: jee_main | jee_advanced | bitsat | viteee | srmjee | own_exam

admission_cutoff(iit_bombay,    jee_advanced, 1,    100).
admission_cutoff(iit_delhi,     jee_advanced, 1,    150).
admission_cutoff(nit_trichy,    jee_main,     97,   100).
admission_cutoff(nit_warangal,  jee_main,     95,   100).
admission_cutoff(bits_pilani,   bitsat,       360,  450).
admission_cutoff(vit_vellore,   viteee,       1,    5000).
admission_cutoff(srm_chennai,   srmjee,       1,    10000).
admission_cutoff(manipal,       own_exam,     60,   100).
admission_cutoff(pec_chandigarh,jee_main,     93,   100).
admission_cutoff(dtu_delhi,     jee_main,     96,   100).
admission_cutoff(nsit_delhi,    jee_main,     95,   100).
admission_cutoff(thapar,        jee_main,     88,   100).
admission_cutoff(upes_dehradun, own_exam,     55,   100).
admission_cutoff(lpu_jalandhar, own_exam,     50,   100).
admission_cutoff(amity_noida,   own_exam,     55,   100).

% SECTION 4: PLACEMENT STATISTICS
% placement_stat(CollegeID, avg_package_lpa, highest_package_lpa, placement_percent)

placement_stat(iit_bombay,    28, 300, 95).
placement_stat(iit_delhi,     26, 280, 95).
placement_stat(nit_trichy,    14, 80,   90).
placement_stat(nit_warangal,  12, 75,   88).
placement_stat(bits_pilani,   18, 200,  92).
placement_stat(vit_vellore,   8,  44,   80).
placement_stat(srm_chennai,   6,  40,   75).
placement_stat(manipal,       9,  65,   78).
placement_stat(pec_chandigarh,10, 60,   82).
placement_stat(dtu_delhi,     15, 100,  85).
placement_stat(nsit_delhi,    13, 90,   84).
placement_stat(thapar,        11, 70,   83).
placement_stat(upes_dehradun, 6,  35,   70).
placement_stat(lpu_jalandhar, 5,  30,   68).
placement_stat(amity_noida,   6,  38,   72).

% SECTION 5: SCHOLARSHIP AVAILABILITY
% scholarship(CollegeID, merit_based|need_based|both, max_amount_in_thousands)

scholarship(iit_bombay,    both,       100).
scholarship(iit_delhi,     both,       100).
scholarship(nit_trichy,    both,       80).
scholarship(nit_warangal,  both,       80).
scholarship(bits_pilani,   merit_based,150).
scholarship(vit_vellore,   merit_based,120).
scholarship(srm_chennai,   both,       100).
scholarship(manipal,       merit_based,100).
scholarship(pec_chandigarh,need_based, 60).
scholarship(dtu_delhi,     merit_based,70).
scholarship(nsit_delhi,    merit_based,70).
scholarship(thapar,        both,       90).
scholarship(upes_dehradun, merit_based,80).
scholarship(lpu_jalandhar, both,       60).
scholarship(amity_noida,   both,       70).

% SECTION 6: HOSTEL & INFRASTRUCTURE
% hostel_available(CollegeID, yes|no)

hostel_available(iit_bombay,    yes).
hostel_available(iit_delhi,     yes).
hostel_available(nit_trichy,    yes).
hostel_available(nit_warangal,  yes).
hostel_available(bits_pilani,   yes).
hostel_available(vit_vellore,   yes).
hostel_available(srm_chennai,   yes).
hostel_available(manipal,       yes).
hostel_available(pec_chandigarh,yes).
hostel_available(dtu_delhi,     yes).
hostel_available(nsit_delhi,    no).
hostel_available(thapar,        yes).
hostel_available(upes_dehradun, yes).
hostel_available(lpu_jalandhar, yes).
hostel_available(amity_noida,   yes).

% campus_size(CollegeID, acres)
campus_size(iit_bombay,    550).
campus_size(iit_delhi,     325).
campus_size(nit_trichy,    800).
campus_size(nit_warangal,  450).
campus_size(bits_pilani,   800).
campus_size(vit_vellore,   372).
campus_size(srm_chennai,   250).
campus_size(manipal,       188).
campus_size(pec_chandigarh,180).
campus_size(dtu_delhi,     164).
campus_size(nsit_delhi,    145).
campus_size(thapar,        250).
campus_size(upes_dehradun, 300).
campus_size(lpu_jalandhar, 600).
campus_size(amity_noida,   150).