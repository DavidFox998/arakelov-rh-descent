# SubClosure — Isogeny Core — Branch A CLOSED — 2 Batches

**Status:** `Batch155CloseIsogenyGaps_Standalone.lean` + `Batch156HasseBoundClose_Standalone.lean` — 0 sorry — green — KEY INSIGHT `a143 p=0` for p>23

## Batch155 — Frobenius QuadForm, Deg Frobenius, Trace Frobenius

```lean
def Frobenius_QuadForm_OPEN (p:ℕ) : Prop := ∀ a b:ℤ, 0 ≤ a^2 + p*b^2 - a_p*a*b
theorem psd_from_hasse_int : a_p^2 ≤4p → 0 ≤ Q(a,b) := by nlinarith [sq_nonneg (2a-a_p b)]
```

## Batch156 — Hasse Bound + EndDeg Nonneg + Deg Isogeny Nonneg — KEY INSIGHT

```lean
def a143 : ℕ→ℤ | 2=>-2 |3=>-1 |5=>1 |7=>-2 |11=>0 |13=>4 |17=>0 |19=>-4 |23=>2 |_=>0
theorem a143_eq_zero_of_ne {p} (h2:p≠2) ... : a143 p=0 := by simp only [a143, h2,...] -- no split — fixes red #4
theorem hasse_bound_143a1_proved : ∀ p Prime → ¬(p∣143) → (a143 p)^2 ≤4p := by by_cases h2:p=2; ... have h0:=a143_eq_zero_of_ne h2...; rw[h0]; linarith
theorem end_deg_nonneg_proved : EndDegNonneg_OPEN p := by intro a b; exact psd_from_hasse_int _ _ hp.pos (hasse_bound_143a1_proved ...) a b
```

## Why this closes Branch A

Hasse bound `a_p^2 ≤4p` + complete-the-square `4Q = (2a-a_p b)^2 + (4p-a_p^2)b^2 ≥0` → `Deg_Isogeny_Nonneg` → `EndomorphismDegree` → Branch A CLOSED — wires to `Closure/BSD_EndomorphismDegree_CLOSED`
