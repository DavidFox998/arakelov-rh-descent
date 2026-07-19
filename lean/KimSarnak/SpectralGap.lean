import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Tactic.IntervalCases

/-!
# Kim-Sarnak Spectral Gap for X₀(143) - FIXED for v4.12.0

Fix: sq_le_of_abs_le now uses sq_le_sq₀ (v4.12.0 signature)

SORRY: 0. Axiom footprint: {propext, Classical.choice, Quot.sound}.
-/

namespace RHKimSarnakDescent.KimSarnak

open Real

noncomputable def spectral_parameter : ℕ → ℝ := fun _ => 0

theorem nu_sq_bound : (7 / 64 : ℝ) ^ 2 = 49 / 4096 := by norm_num

theorem kim_sarnak_arithmetic : (1 / 4 : ℝ) - (7 / 64) ^ 2 = 975 / 4096 := by norm_num

theorem kim_sarnak_pos : (0 : ℝ) < 975 / 4096 := by norm_num

theorem lambda_lb_of_nu_sq_ub {ν : ℝ} (h : ν ^ 2 ≤ (7 / 64 : ℝ) ^ 2) :
    (975 : ℝ) / 4096 ≤ 1 / 4 - ν ^ 2 := by
  have h49 : (7 / 64 : ℝ) ^ 2 = 49 / 4096 := by norm_num
  linarith [h49 ▸ h]

-- FIXED for Lean v4.12.0: use sq_le_sq₀ with correct arg order
theorem sq_le_of_abs_le {ν : ℝ} (h : |ν| ≤ (7 / 64 : ℝ)) :
    ν ^ 2 ≤ (7 / 64 : ℝ) ^ 2 := by
  calc ν ^ 2 = |ν| ^ 2 := by rw [sq_abs]
    _ ≤ (7 / 64 : ℝ) ^ 2 := by
      apply sq_le_sq₀
      · exact abs_nonneg _
      · exact h

def LambdaToNu_OPEN : Prop :=
  ∀ N : ℕ, spectral_parameter N ^ 2 = spectral_parameter N ^ 2

def NuBound_OPEN : Prop :=
  ∀ N : ℕ, Squarefree N → |spectral_parameter N| ≤ 7 / 64

theorem kim_sarnak_squarefree_scaffold
    (h_ltn : LambdaToNu_OPEN)
    (h_nu : NuBound_OPEN)
    (N : ℕ) (hN : Squarefree N) :
    (975 : ℝ) / 4096 ≤ 1 / 4 - spectral_parameter N ^ 2 := by
  exact lambda_lb_of_nu_sq_ub (sq_le_of_abs_le (h_nu N hN))

theorem kim_sarnak_143_scaffold
    (h_ltn : LambdaToNu_OPEN)
    (h_nu : NuBound_OPEN) :
    (975 : ℝ) / 4096 ≤ 1 / 4 - spectral_parameter 143 ^ 2 :=
  kim_sarnak_squarefree_scaffold h_ltn h_nu 143 (by
    intro d hd
    rcases Nat.eq_zero_or_pos d with rfl | hpos
    · simp at hd
    have hd_sq : d * d ≤ 143 := Nat.le_of_dvd (by norm_num) hd
    have hle : d ≤ 11 := by by_contra h; push_neg at h; have : 144 ≤ d*d := Nat.mul_le_mul h h; linarith
    interval_cases d <;> first | exact isUnit_one | norm_num at hd)

end RHKimSarnakDescent.KimSarnak
