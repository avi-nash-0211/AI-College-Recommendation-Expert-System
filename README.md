# AI College Recommendation Expert System

## Overview
The AI College Recommendation Expert System is a rule-based expert system developed using Prolog. It helps students identify suitable colleges based on entrance examination scores, preferred branch, budget constraints, location preferences, hostel requirements, placement statistics, and scholarship opportunities.

The system combines a knowledge base, eligibility rules, scoring mechanisms, and recommendation logic to simulate the decision-making process of an educational counselor.

---

## System Architecture
![System Architecture](docs/diagrams/system_architecture.png)
## Features

* College recommendation based on student profile
* Eligibility checking using entrance examination scores
* Tier classification of colleges
* College comparison and advisory system
* Placement and ranking analysis
* Scholarship consideration
* Budget-aware recommendations
* Hostel availability filtering
* Safe and stretch college suggestions

---

## Technologies Used

- SWI-Prolog
- Artificial Intelligence
- Expert Systems
- Knowledge Representation
- Logic Programming
- Rule-Based Reasoning
- Decision Support Systems
---
## AI Concepts Implemented

- Knowledge Base Design
- Rule-Based Inference
- Eligibility Reasoning
- Recommendation Generation
- Decision Support Logic
- Scoring and Ranking Mechanisms
- Expert System Architecture
## Project Structure

AI-College-Recommendation-Expert-System

├── src

│ ├── knowledge_base.pl

│ ├── utility_predicates.pl

│ ├── eligibility_rules.pl

│ ├── scoring_engine.pl

│ ├── recommendation_engine.pl

│ ├── advisory_rules.pl

│ └── main.pl

├── docs

│ ├── diagrams

│ ├── screenshots

│ └── report

├── sample_queries

└── assets

---

## How to Run

1. Install SWI-Prolog
2. Open the project directory
3. Navigate to the src folder
4. Start SWI-Prolog

```prolog
[main].
```

5. Execute sample queries

```prolog
recommend_top5(
    jee_main,
    96,
    btech,
    computer_science,
    300,
    delhi,
    yes
).
```
## Sample Queries

### Top Recommendations

recommend_top5(
jee_main,
96,
btech,
computer_science,
300,
delhi,
yes
).

### College Profile

college_profile(iit_delhi).

### College Comparison

compare_colleges(vit_vellore,srm_chennai).

### Safe Colleges

safe_college(X,jee_main,98).

---

## Screenshots

### Top Recommendations

![Top Recommendations](docs/screenshots/top_recommendations.png)

### College Profile

![College Profile](docs/screenshots/college_profile.png)

### College Comparison

![College Comparison](docs/screenshots/college_comparison.png)
### Tier Classification

![Tier Classification](docs/screenshots/tier_classification.png)

### Safe Colleges


![Safe Colleges](docs/screenshots/safe_colleges.png)

---

## Future Enhancements

* Web-based interface
* Dynamic college dataset
* Multi-user recommendation support
* Machine learning assisted ranking
* Database integration

---

## Author

Avinash Madkatte

MCA Candidate, Jawaharlal Nehru University (JNU)

Areas of Interest:
- Artificial Intelligence
- Expert Systems
- Software Development
- Logic Programming