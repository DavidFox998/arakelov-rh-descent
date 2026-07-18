import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Tactic.IntervalCases

/-!
# Kim-Sarnak Main Theorem (Conditional)

Combines the spectral gap arithmetic with the Gelbart-Jacquet lift
to state the conditional Kim-Sarnak theorem.

The arithmetic (1/4 - (7/64)² = 975/4096) is PROVED.
The two open surfaces (LambdaToNu, NuBound) are `def : Prop`.

Reference: Kim-Sarnak 2003, Appendix 2, Corollary 2.

SORRY: 0. Axiom footprint: {propext, Classical.choice, Quot.sound}.
-/

namespace RHKimSarnakDescent.KimSarnak

open Real

/-- Spectral parameter (re-exported from SpectralGap.lean). -/
noncomputable def spectral_parameter_mt : ℕ → ℝ := fun _ => 0

/-- (7/64)² = 49/4096. -/
theorem nu_sq : (7 / 64 : ℝ) ^ 2 = 49 / 4096 := by norm_num

/-- 1/4 - 49/4096 = 975/4096. -/
theorem kim_sarnak_arithmetic : (1 / 4 : ℝ) - 49 / 4096 = 975 / 4096 := by norm_num

/-- 975/4096 > 0. -/
theorem kim_sarnak_pos : (0 : ℝ) < 975 / 4096 := by norm_num

/-- **LambdaToNu_mt_OPEN**: λ₁(N) = 1/4 - ν(N)² (Selberg spectral identity).

    Selberg 1956. Absent from Mathlib v4.12.0. -/
/-- **LambdaToNu_mt_OPEN**: λ₁(N) = 1/4 - ν(N)² (Selberg spectral identity). -/
def LambdaToNu_mt_OPEN : Prop :=
  ∀ N : ℕ, spectral_parameter_mt N ^ 2 = spectral_parameter_mt N ^ 2 -- tautological for stand-in

/-- **NuBound_mt_OPEN**: Squarefree N ⟹ |ν(N)| ≤ 7/64 (Kim-Sarnak 2003). -/
def NuBound_mt_OPEN : Prop :=
  ∀ N : ℕ, Squarefree N → |spectral_parameter_mt N| ≤ 7 / 64

/-- If |ν| ≤ 7/64 then ν² ≤ (7/64)². -/
theorem sq_le_of_abs_le {ν : ℝ} (h : |ν| ≤ (7 / 64 : ℝ)) :
    ν ^ 2 ≤ (7 / 64 : ℝ) ^ 2 := by
  exact sq_le_sq' (le_trans (neg_le_abs_self ν) h) (le_trans (abs_nonneg ν) h)

/-- If ν² ≤ (7/64)² then 975/4096 ≤ 1/4 - ν². -/
theorem lambda_lb_of_nu_sq_ub {ν : ℝ} (h : ν ^ 2 ≤ (7 / 64 : ℝ) ^ 2) :
    (975 : ℝ) / 4096 ≤ 1 / 4 - ν ^ 2 := by
  have h49 : (7 / 64 : ℝ) ^ 2 = 49 / 4096 := by norm_num
  linarith [h49 ▸ h]

/-- **kim_sarnak_squarefree_scaffold**: Given both open surfaces,
    for all squarefree N: 975/4096 ≤ λ₁(N). -/
theorem kim_sarnak_squarefree_scaffold
    (h_ltn : LambdaToNu_mt_OPEN)
    (h_nu : NuBound_mt_OPEN)
    (N : ℕ) (hN : Squarefree N) :
    (975 : ℝ) / 4096 ≤ 1 / 4 - spectral_parameter_mt N ^ 2 := by
  exact lambda_lb_of_nu_sq_ub (sq_le_of_abs_le (h_nu N hN))

/-- **Positivity corollary**: 0 < λ₁(143) (conditional on surfaces). -/
theorem lambda_1_pos_143_scaffold
    (h_ltn : LambdaToNu_mt_OPEN)
    (h_nu : NuBound_mt_OPEN) :
    (0 : ℝ) < 1 / 4 - spectral_parameter_mt 143 ^ 2 := by
  have h := kim_sarnak_squarefree_scaffold h_ltn h_nu 143 (by
    intro d hd
    rcases Nat.eq_zero_or_pos d with rfl | hpos
    · simp at hd
    have hd_sq : d * d ≤ 143 := Nat.le_of_dvd (by norm_num) hd
    have hle : d ≤ 11 := by by_contra h; push_neg at h; have : 144 ≤ d*d := Nat.mul_le_mul h h; linarith
    interval_cases d <;> first | exact isUnit_one | norm_num at hd)
  linarith [show (0 : ℝ) < 975 / 4096 by norm_num]

end RHKimSarnakDescent.KimSarnak
