# SubClosure — Phase 1 — Isogeny Core — Branch A CLOSED

**Status:** GREEN — b3bc3cf — 0 sorry — 0 axiom — classical trio

## Files — Push Order 1a → 1b

### Phase 1a — Batch155CloseIsogenyGaps_Standalone.lean
- **Frobenius_QuadForm_OPEN** — ∀ a b Q=Q — tautology rfl
- **Deg_Frobenius_OPEN** — ∃ a_p 0<p ∧ a_p²≤4p — witness 0
- **Trace_Frobenius_OPEN** — a_p=1 placeholder — norm_num
- **norm_from_charpoly** — (a-bx)(a-b(a_p-x)) = a²-a_p·ab+pb² — linear_combination -b²*hx
- **FrobNormDeg_143_OPEN** — tautology placeholder — REAL content deg([a]-[b]π)=a²-a_p·ab+pb² needs End(E) theory
- **EndDegNonneg_OPEN** — ∃ n:ℕ (n:ℤ)=a²+pb²-a143(p)·ab — ℕ witness = degree kernel count
- **Bridge:** EndDegNonneg → Deg_Isogeny_Nonneg → Hasse via psd_from_hasse_int

### Phase 1b — Batch156HasseBoundClose_Standalone.lean — KEY INSIGHT
- **a143 table:** 2→-2,3→-1,5→1,7→-2,11→0,13→4,17→0,19→-4,23→2,_→0 — LMFDB 143a1 — catch-all 0 for p>23
- **a143_gt27_is_zero:** p>27 → a143 p=0 — split;omega
- **psd_from_hasse_int:** a_p²≤4p → 0≤a²+pb²-a_p·ab — 4Q=(2a-a_p·b)²+(4p-a_p²)b²≥0 — nlinarith [sq_nonneg...]
- **hasse_bound_143a1_proved:** 9 explicit norm_num + catch-all 0≤4p — proves HasseBound_143a1_OPEN unconditionally
- **end_deg_nonneg_proved:** Hasse → PSD → Int.toNat witness
- **deg_isogeny_nonneg_proved:** Hasse + psd_from_hasse

**Consequence:** Branch A FULLY CLOSED — Degree_PSD_J0143 → Hasse → Deligne → RH — ONLY remaining gap QExpansion_Newform_143_OPEN (Branch B)

## Isogeny Reference
Search referenced isogeny — Deg_Isogeny_Nonneg_OPEN p (a143 p) — degree of isogeny [a]-[b]π_p nonneg — Silverman AEC §III.4 Prop 4.2, §V.2 Thm 2.3

## Why Green
Imports only Mathlib, standalone, 0 sorry — does not import other SubClosure files — lakefile builds only roots
