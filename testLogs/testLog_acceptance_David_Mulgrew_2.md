# Test Log - Employee Fatigue Monitoring Game

This document tracks the testing of core features, including user roles, dashboards, mini-games, and feedback functionality.

## Status Key
✅ - Passed | ⚠️ - Issues Found | ❌ - Failed | ⏳ - Not Tested

---

## Feature Implemented in This Pull Request
| Feature | Test Case | Expected Result | Status |
|---------|-----------|-----------------|--------|
| Admin/Staff Mode Toggle | Can users switch between employee, staff, and admin modes? | User role updates successfully with appropriate permissions | ✅ |
| Staff Dashboard Access | Can a staff user access the staff dashboard? | Staff dashboard loads correctly with relevant data | ✅ |
| Admin Dashboard Access | Can an admin user access the admin dashboard? | Admin dashboard loads correctly with all management tools | ✅ |
| Feedback Submission | Can a user submit feedback? | Feedback is stored correctly and confirmation is shown | ✅ |
| Feedback Aggregation | Can management view aggregated feedback reports? | Aggregated feedback is readable and properly grouped | ✅ |

---

## Impacted Features
| Feature | Test Case | Expected Result | Status |
|---------|-----------|-----------------|--------|
| Role Switching | See Admin/Staff Testing | No negative side effects on gameplay or feedback systems | ✅ |
| Game Session Flow | See Full Game Loop Testing | No critical interruptions after mode switching | ❌ |

---

## Full Game Loop Testing
| Feature | Test Case | Expected Result | Status |
|---------|-----------|-----------------|--------|
| Game Start | Player enters the game world correctly | Dashboard loads, game session starts without errors | ✅ |
| Focus Mini-Game | All differences selectable, timer ends game if not complete | Player can find/select every difference, 2-minute timeout works | ✅ |
| Reaction Mini-Game | Player can react correctly to target icons | Correct taps recorded, incorrect taps penalized, 2-minute timeout works | ✅ |
| Mental Agility Mini-Game | 3x3 tile puzzle can be solved | Puzzle can be completed, or timeout ends session after 2 minutes | ✅ |
| Decision Making Mini-Game | Question and answers function | Player can pick one answer and proceed immediately, timeout fallback | ✅ |
| Memory Mini-Game | Simon-says sequence can be repeated | Sequence grows correctly, win/lose conditions detected properly | ⚠️ |
| Game Loop End | After all 5 mini-games, return to main menu | No crashes, menu loads automatically after loop | ❌ |
| UI & Menus | Menus function between and after games | Smooth navigation between mini-games, feedback form, dashboards | ✅ |
| Feedback Submission | Can submit feedback after the game session | Feedback form captures and stores all inputs | ✅ |
| Performance | Stable frame rate during entire session | No major FPS drops or crashes during gameplay or menus | ✅ |

---

## Notes & Known Issues
- Only got shown 4 games, also got a loop of more than 5, print log showed 10 games loaded

---

## How to Update
- When a test is **completed**, replace ⏳ with ✅ (Pass), ⚠️ (Issues Found), or ❌ (Fail).
- Leave notes on failed tests or necessary fixes in the Git commit messages.

---

**Commit Reference:** [Insert commit hash here]
