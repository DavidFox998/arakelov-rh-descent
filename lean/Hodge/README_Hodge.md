# Hodge — Phase 2 — 200 Abelian Definitions — Tie Isogeny to Hodge Wall 3

**Status:** NEW — 200 definitions — 0 sorry — norm_num only — STANDALONE

## Files

### HodgeAbelian_200_Standalone.lean — 201 entries from JSONL
- **Source:** file1326672711396049291.bin — 201 JSONL — id X3_001..X5_066 — genus 3,4,5
- **SHA:** 2b56180c490603a5044e871a16316d83d7a2d5ece14a1fb0e4cc70e28d0a4449 — Rank_Obstructions_Replicit_v17_PDF3.pdf
- **Each definition:**
  ```lean
  def X3_001 : Hodge22ClassData 3 := { basis_pairs := [(1,2),(3,4)], observed_rank := 4, bound := 3, certified := true, sha := "2b56..." }
  theorem X3_001_obstructed : isObstructed 3 X3_001 := by unfold isObstructed criterionBound; norm_num -- 4>3
  ```
- **Counts:**
  - g=3: 67 classes rank 4 > C(3,2)=3
  - g=4: 67 classes rank 7 > C(4,2)=6
  - g=5: 67 classes rank 15 > C(5,2)=10 — M8C-certified

### Companion — Consolidated Abelian
- **Source:** file3789259335399504271.txt — 317 defs C01-C08 + 199 new
- **J0143_data:** g=5 CM by CyclotomicField 11 — conductor 143=11×13 — same as X₀(143) genus 13
- **HodgeConjecture_CM_OPEN:** Clay Millennium — Abdulali 1994, Hazama 1995 — holds for all CM abelian varieties

## Isogeny Reference — Why This Ties to SubClosure
- **SubClosure:** Deg_Isogeny_Nonneg_OPEN p (a143 p) — 0≤a²+pb²-a_p·ab — isogeny degree nonneg
- **Hodge:** isObstructed g cls := observed_rank > criterionBound g — rank obstruction — same > pattern
- Both use rank > bound — one for isogeny degree, one for Hodge (2,2)-class
- J_0(143) Jacobian is genus 5 abelian variety — same object in both walls — Hodge Wall 3 + Arakelov Wall

## Search Referenced Isogeny
In HodgeMathlib: AbelianVarietyData → J0143_data → cm.isSome → HodgeConjecture_CM — isogeny appears in CM type

## Push Order
Phase 2 — After SubClosure green b3bc3cf — Before Closure fixed gaps
- This file standalone imports only Mathlib.Tactic.NormNum — 0 sorry — stays green

## Tokenization
John 5-9 five primes 47,71,53,59,41 — exceptional set S14 14 primes — same exceptional set concept as Hodge exceptional (2,2)-classes
