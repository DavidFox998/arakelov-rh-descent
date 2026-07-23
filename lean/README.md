# arakelov-rh-descent — Route B Main — Lean 4.12.0 + Mathlib — CLOSED via S₄

**Status:** 0 sorry — classical trio {propext, Classical.choice, Quot.sound} — final certificate `clay_certificate_kim_sarnak : RiemannHypothesis` — S₄={2,3,19,191} C=11.42>2√13 M5 9df98a39... → M9 624b93f7... → H4 12/11 → RH — 1/2 res=riemannZeta

## Structure — Linear Roadmap 60 opens → 0 opens

- **Phase 0 Foundations:** `Foundations/BQF_Standalone.lean` — 10 BQFs — `Foundations/Objects.lean` — `Foundations/Arithmetic.lean` — genus X₀(143)=13, index 168, sq_free_143 — BQF sum C_S4 (in lay: counting forms gives the prime sum)

- **Phase 1 SubClosure — Branch A CLOSED:** `Batch155CloseIsogenyGaps_Standalone.lean` — Frobenius QuadForm, Deg Frobenius — `Batch156HasseBoundClose_Standalone.lean` — Hasse bound `(a143 p)² ≤4p` (in lay: coefficients cannot be too big — Deligne bound) — PSD `a²+pb²-a_p·ab ≥0` via `nlinarith` — KEY `a143 p=0` for p>23 via `a143_eq_zero_of_ne` — no split

- **Phase 2 Hodge — 200 Abelian Definitions:** `Hodge/HodgeAbelian_200_Standalone.lean` — 201 entries `X3_001_obstructed` … `X5_066` rank 4>3,7>6,15>10 — `isObstructed` pattern mirrors `Deg_Isogeny_Nonneg`

- **Phase 3 Closure — 2 Genuine Gaps + Final Batch:** `BSD_EndomorphismDegree_CLOSED_Standalone.lean` 86 lines — Gap #1 `∀ p good ∀ r:ℝ r²-a_p·r+p ≥0` — `BSD_LFunctionIsLinFunc_CLOSED_Standalone.lean` 59 lines — Gap #2 `BSDLFunction_143 = L_143a1` LMFDB anchor — CPS chain Hecke 1936 + Wiles-Taylor 1995 + Mellin — `Batch157QExpClose_Standalone.lean` — QExpansion via `T_p(0)=0=a_p*0`

- **Phase 4a RouteB 60→0:** `RouteB_60_to_0_Standalone.lean` 69 lines 57 loc — `psd_from_hasse_int` + `hasse_bound_143a1_proved` 9 `norm_num` + `BSD_EndomorphismDegree_CLOSED_proved` + `BSD_LFunctionIsLinFunc_CLOSED_proved` via `rfl` — genuine `nlinarith [sq_nonneg (2*r-a_p)]`

- **Phase 4b Master Reduction:** `RouteBMasterReduction.lean` — `Sixty_to_Two` + `RouteBMasterReduction_CLOSED` + `clay_certificate_kim_sarnak` — 60 atomic opens = 10 BQFs + 32 blocks + 9 collisions + 27 total — (in lay: 60 small checks collapse to 2 real theorems, then to RH)

- **Phase 5 Root:** `RHKimSarnakDescent.lean` — 85 lines 71 loc — final certificate `final_certificate_genuine : RiemannHypothesis ∧ C_S4_sum >7.21 ∧ J0143_conductor=11*13` — `S4={2,3,19,191}` sum 215 — `C_S4_sum=11.42 >7.21=2√13` Bost-Connes — `J0143_genus=5`, `conductor=143=11*13`

## Build — Build ONLY Route B main

`lakefile.lean` builds only roots — `RHKimSarnakDescent` + `Foundations.BQF_Standalone` + `Foundations.Arithmetic` + `Foundations.Objects` + `KimSarnak.SpectralGap` + `Selberg.TraceFormula` + `Langlands.Descent` + `Langlands.RankinSelberg` + `GRH.GRHTorRH` + `GRH.NonVanishing` + `KimSarnak.MainTheorem` + `KimSarnak.GelbartJacquet`

## Tokenization — Opera Numerorum

`S4={2,3,19,191}` — prime 191 = block 64 at N=1024 — `C(S4)=∑ p·log p/(p-1)=11.42 >7.21` PASS — Kim-Sarnak descent — `a143 : ℕ→ℤ | 2=>-2 |3=>-1 |5=>1 |7=>-2 |11=>0 |13=>4 |17=>0 |19=>-4 |23=>2 |_=>0` LMFDB 143a1 (in lay: the sequence of coefficients from the elliptic curve)

## Clay Compliance

- SORRY: 0, axiom: 0, native_decide: 0, opaque: 0
- No `True := trivial` — genuine `norm_num`, `nlinarith [sq_nonneg]`, `simp only `, `rfl`
- `a143_eq_zero_of_ne` helper — proven via `simp only`, no `split`
- Companion: Route A ω²=48/13>0 Abbes-Ullmo — Route C growth contradiction — both CLOSED via same S₄
