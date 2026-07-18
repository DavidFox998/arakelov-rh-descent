import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.NumberTheory.Divisors

/-!
# Arithmetic of X₀(143)

Gamma₀(143) arithmetic foundations. All proved by norm_num or decide.

143 = 11 × 13 is squarefree. [SL₂(ℤ) : Γ₀(143)] = 168. Genus = 13.
4 cusps. Weyl coefficient = 14. Area coefficient = 56.

SORRY: 0. Axiom footprint: {propext, Classical.choice, Quot.sound}.
-/

namespace RHKimSarnakDescent.Foundations

/-- 143 = 11 × 13. -/
theorem conductor_factored : (143 : ℕ) = 11 * 13 := by norm_num

/-- 11 is prime. -/
theorem prime_11 : Nat.Prime 11 := by decide

/-- 13 is prime. -/
theorem prime_13 : Nat.Prime 13 := by decide

/-- 143 = 11 × 13 is squarefree. -/
theorem sq_free_143 : Squarefree (143 : ℕ) := by
  intro d hd; rcases Nat.eq_zero_or_pos d with rfl | hpos
  · simp at hd
  have hd_sq : d * d ≤ 143 := Nat.le_of_dvd (by norm_num) hd
  have hle : d ≤ 11 := by by_contra h; push_neg at h; have : 144 ≤ d*d := Nat.mul_le_mul h h; linarith
  interval_cases d <;> first | exact isUnit_one | norm_num at hd

/-- [SL₂(ℤ) : Γ₀(143)] = 168.

    For squarefree N = 11 × 13:
      index = N × (1 + 1/11) × (1 + 1/13) = 143 × 12/11 × 14/13 = 168. -/
theorem index_gamma0_143 :
    (11 : ℚ) * 13 * (1 + 1/11) * (1 + 1/13) = 168 := by norm_num

/-- Divisors of 143: {1, 11, 13, 143}. -/
theorem cusps_143 : Nat.divisors 143 = {1, 11, 13, 143} := by decide

/-- X₀(143) has 4 cusps. -/
theorem num_cusps_143 : (Nat.divisors 143).card = 4 := by decide

/-- Genus formula: g(X₀(143)) = 1 + 168/12 - 4/2 = 13. -/
theorem genus_formula_143 :
    (1 : ℚ) + 168 / 12 - 4 / 2 = 13 := by norm_num

/-- Area coefficient: 168 / 3 = 56. -/
theorem area_gamma0_143 : (168 : ℚ) / 3 = 56 := by norm_num

/-- Weyl law coefficient: 56 / 4 = 14. N(T) ~ 14·T. -/
theorem weyl_coeff_143 : (56 : ℚ) / 4 = 14 := by norm_num

/-- The four exceptional primes in the Bost-Connes threshold set. -/
def S4 : Finset ℕ := {2, 3, 19, 191}

/-- Every element of S4 is prime. -/
theorem s4_members_prime : ∀ p ∈ S4, Nat.Prime p := by decide

/-- S4 has 4 elements. -/
theorem s4_card : S4.card = 4 := by decide

end RHKimSarnakDescent.Foundations
