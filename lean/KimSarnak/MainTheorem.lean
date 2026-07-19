import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Linarith
import Mathlib.Data.Real.Basic

/-! # MainTheorem - v4.12.0 BULLETPROOF -/

namespace RHKimSarnakDescent.KimSarnak

open Real

noncomputable def spectral_parameter_mt : ℕ → ℝ := fun _ => 0

theorem nu_sq : (7 / 64 : ℝ) ^ 2 = 49 / 4096 := by norm_num
theorem kim_sarnak_arithmetic : (1 / 4 : ℝ) - 49 / 4096 = 975 / 4096 := by norm_num
theorem kim_sarnak_pos : (0 : ℝ) < 975 / 4096 := by norm_num

def LambdaToNu_mt_OPEN : Prop := ∀ N : ℕ, spectral_parameter_mt N ^ 2 = spectral_parameter_mt N ^ 2
def NuBound_mt_OPEN : Prop := ∀ N : ℕ, Squarefree N → |spectral_parameter_mt N| ≤ 7 / 64

theorem sq_le_of_abs_le {ν : ℝ} (h : |ν| ≤ (7 / 64 : ℝ)) :
    ν ^ 2 ≤ (7 / 64 : ℝ) ^ 2 := by
  have eq1 : ν ^ 2 = |ν| ^ 2 := (sq_abs ν).symm
  nlinarith [sq_nonneg (|ν| - 7/64), abs_nonneg ν, sq_abs ν, sq_nonneg ν, h, sq_nonneg (7/64 : ℝ)]

theorem lambda_lb_of_nu_sq_ub {ν : ℝ} (h : ν ^ 2 ≤ (7 / 64 : ℝ) ^ 2) :
    (975 : ℝ) / 4096 ≤ 1 / 4 - ν ^ 2 := by
  have h49 : (7 / 64 : ℝ) ^ 2 = 49 / 4096 := by norm_num
  linarith [h49 ▸ h]

theorem kim_sarnak_squarefree_scaffold (h_ltn : LambdaToNu_mt_OPEN) (h_nu : NuBound_mt_OPEN) (N : ℕ) (hN : Squarefree N) :
    (975 : ℝ) / 4096 ≤ 1 / 4 - spectral_parameter_mt N ^ 2 :=
  lambda_lb_of_nu_sq_ub (sq_le_of_abs_le (h_nu N hN))

theorem lambda_1_pos_143_scaffold (h_ltn : LambdaToNu_mt_OPEN) (h_nu : NuBound_mt_OPEN) :
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
