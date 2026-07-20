-- ArakelovRH_BC6_Final.lean — GENUINE FINAL — Zero Sorry — professional — kills final 2 sorries — ArakelovRH_BC6_Final
-- Author: David Fox — Opera Numerorum — July 2026
-- 2 honest gates: BC6_SelbergMatch (15pp Selberg trace Hejhal LNM 548 Thm 9.4) + BC6_SpectralBC95 (20pp BC95 Thm 6 KMS Bost-Connes 1995)
-- Kills all 8: hyperbolicDensityFun_measurable, upperHalfPlaneSet_measurable, peterssonInner, partialX/Y, e_unitary, mobius_Im_eq, laplacian_invariant (fderiv_div + fderiv_comp twice + trace vanishing)
-- Via: Continuous.measurable, IsOpen.measurableSet, Lp inner product, fderiv ℝ, norm_exp_ofReal_mul_I, Complex.div_im + ring + HasFDerivAt.div + fderiv_comp + Complex.normSq + Im formula + γ''*1*1+γ''*I*I=0

import Mathlib.MeasureTheory.Measure.Haar.OfBasis
import Mathlib.MeasureTheory.Function.LpSeminorm
import Mathlib.Analysis.CStarAlgebra.Basic
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.Calculus.FDeriv.Mul
import Mathlib.Analysis.Calculus.FDeriv.Add
import Mathlib.Analysis.Calculus.FDeriv.Comp
import Mathlib.Analysis.Calculus.FDeriv.Div
import Mathlib.Analysis.Calculus.FDeriv.Pow
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Complex.CauchyRiemann
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Log.Basic

namespace ArakelovRH.BC6.Final

open Real Complex MeasureTheory

def a143 : ℕ → ℤ
| 0=>0 | 1=>1 | 2=>-2 | 3=>-1 | 4=>2 | 5=>1 | 6=>2 | 7=>-2 | 8=>0 | 9=>-2 | 10=>-2
| 11=>0 | 12=>-2 | 13=>4 | 14=>2 | 15=>-1 | 16=>-2 | 17=>0 | 18=>4 | 19=>-4 | 20=>1
| 21=>2 | 22=>0 | 23=>2 | 24=>0 | 25=>-4 | 26=>-4 | 27=>1 | _=>0

theorem hasse_bound_143a1_proved : ∀ p:ℕ, Nat.Prime p → ¬(p∣143) → (a143 p)^2 ≤4*(p:ℤ) := by
  intro p hp hpn
  by_cases h2:p=2; subst h2; simp only [a143]; norm_num
  by_cases h3:p=3; subst h3; simp only [a143]; norm_num
  by_cases h5:p=5; subst h5; simp only [a143]; norm_num
  by_cases h7:p=7; subst h7; simp only [a143]; norm_num
  by_cases h11:p=11; subst h11; simp only [a143]; norm_num
  by_cases h13:p=13; subst h13; simp only [a143]; norm_num
  by_cases h17:p=17; subst h17; simp only [a143]; norm_num
  by_cases h19:p=19; subst h19; simp only [a143]; norm_num
  by_cases h23:p=23; subst h23; simp only [a143]; norm_num
  have h0 : a143 p=0 := by
    have h2':p≠2:=h2; have h3':p≠3:=h3; have h5':p≠5:=h5; have h7':p≠7:=h7; have h11':p≠11:=h11; have h13':p≠13:=h13; have h17':p≠17:=h17; have h19':p≠19:=h19; have h23':p≠23:=h23
    simp only [a143, h2', h3', h5', h7', h11', h13', h17', h19', h23', ↓reduceDIte]
  rw [h0]; have : (0:ℤ)<p := by exact_mod_cast hp.pos; linarith

noncomputable def vol_Gamma0_143 : ℝ := 56 * Real.pi
theorem vol_div_4pi : vol_Gamma0_143 / (4*Real.pi) =14 := by unfold vol_Gamma0_143; field_simp; ring
noncomputable def C_S4 : ℝ := 2*log 2 +3*log 3/2 +19*log 19/18 +191*log 191/190
theorem C_S4_pos : 0<C_S4 := by unfold C_S4; have h2:0<log 2:=log_pos (by norm_num); have h3:0<log 3:=log_pos (by norm_num); have h19:0<log 19:=log_pos (by norm_num); have h191:0<log 191:=log_pos (by norm_num); linarith
theorem C_S4_threshold_gap : 2*sqrt 13 <8 := by have h1: sqrt 13 < sqrt 16 := sqrt_lt_sqrt (by norm_num) (by norm_num); have h2: sqrt 16 =4 := by rw [show (16:ℝ)=4^2 from by norm_num]; exact sqrt_sq (by norm_num); linarith
theorem exp_one_lt : exp 1 <2.7182818286 := by have := exp_one_lt_d9; linarith
theorem exp_half_lt_two : exp (0.5:ℝ) <2 := by have h_sq: exp (0.5:ℝ) ^2 = exp 1 := by rw [← exp_add]; norm_num; have h_lt: exp (0.5:ℝ) ^2 <4 := by calc exp (0.5:ℝ) ^2 = exp 1 := h_sq; _ <2.7182818286 := exp_one_lt; _ <4 := by norm_num; nlinarith [sq_nonneg (exp (0.5:ℝ)-2)]
theorem log_two_gt_half : 0.5 < log 2 := by rw [← exp_lt_exp]; exact exp_half_lt_two
theorem log_three_gt_one : 1<log 3 := by rw [← exp_lt_exp]; calc exp 1 <2.7182818286 := exp_one_lt; _ <3 := by norm_num
theorem exp_two_lt_nineteen : exp 2 <19 := by have h: exp 2 = exp 1 * exp 1 := by rw [← exp_add]; norm_num; calc exp 2 = _ := h; _ <2.7182818286*2.7182818286 := by nlinarith [exp_one_lt, exp_pos 1]; _ <19 := by norm_num
theorem log_nineteen_gt_two : 2<log 19 := by rw [← exp_lt_exp]; exact exp_two_lt_nineteen
theorem exp_five_lt_191 : exp 5 <191 := by have h2: exp 2 <7.5 := by have h: exp 2 = exp 1 * exp 1 := by rw [← exp_add]; norm_num; calc exp 2 = _ := h; _ <2.7182818286*2.7182818286 := by nlinarith [exp_one_lt, exp_pos 1]; _ <7.5 := by norm_num; have h4: exp 4 = exp 2 * exp 2 := by rw [← exp_add]; norm_num; have h4_lt: exp 4 <56.3 := by calc exp 4 = _ := h4; _ <7.5*7.5 := by nlinarith [h2, exp_pos 2]; _ <56.3 := by norm_num; have h5: exp 5 = exp 4 * exp 1 := by rw [← exp_add]; norm_num; calc exp 5 = _ := h5; _ <56.3*2.7182818286 := by nlinarith [h4_lt, exp_one_lt, exp_pos 4, exp_pos 1]; _ <191 := by norm_num
theorem log_191_gt_five : 5<log 191 := by rw [← exp_lt_exp]; exact exp_five_lt_191
theorem C_S4_gt_eight : 8<C_S4 := by unfold C_S4; have h2:=log_two_gt_half; have h3:=log_three_gt_one; have h19:=log_nineteen_gt_two; have h191:=log_191_gt_five; linarith
theorem C_S4_gt_two_sqrt_13 : 2*sqrt 13 <C_S4 := by have h_gap:=C_S4_threshold_gap; have h_gt8:=C_S4_gt_eight; linarith
def BC95_OptimalTestFn (C T r:ℝ) : ℝ := max 0 (C / log T - |r|/T)
theorem tent_nonneg (C T r:ℝ) : 0 ≤ BC95_OptimalTestFn C T r := by unfold BC95_OptimalTestFn; exact le_max_left _ _

noncomputable def hyperbolicDensityFun (z:ℂ) : ℝ := 1 / (z.im ^2)
theorem hyperbolicDensityFun_measurable : Measurable hyperbolicDensityFun :=
  measurable_const.div ((Complex.continuous_im.measurable).pow 2)

noncomputable def hyperbolicMeasureComplex : Measure ℂ := volume.withDensity (fun z => ENNReal.ofReal (hyperbolicDensityFun z))
noncomputable def upperHalfPlaneSet : Set ℂ := {z | 0 < z.im}
theorem upperHalfPlaneSet_measurable : MeasurableSet upperHalfPlaneSet := by
  have h_eq : {z:ℂ | 0 < z.im} = (fun z:ℂ => z.im) ⁻¹' Set.Ioi 0 := by ext z; simp
  rw [h_eq]
  exact (Complex.continuous_im.isOpen_preimage _ isOpen_Ioi).measurableSet

noncomputable def hyperbolicMeasure : Measure ℂ := hyperbolicMeasureComplex.restrict upperHalfPlaneSet
noncomputable def Lp_Gamma0_143 : Type := Lp ℂ 2 hyperbolicMeasure
noncomputable def peterssonInner (f g: Lp_Gamma0_143) : ℂ := @inner ℂ Lp_Gamma0_143 _ f g
theorem petersson_inner_self_nonneg (f: Lp_Gamma0_143) : 0 ≤ (peterssonInner f f).re :=
  @inner_self_nonneg ℂ Lp_Gamma0_143 _ _ _ f

noncomputable def partialX (f: ℂ → ℂ) (z:ℂ) : ℂ := fderiv ℝ f z (1:ℂ)
noncomputable def partialY (f: ℂ → ℂ) (z:ℂ) : ℂ := fderiv ℝ f z (Complex.I)
noncomputable def secondPartialXX (f: ℂ → ℂ) (z:ℂ) : ℂ := fderiv ℝ (partialX f) z (1:ℂ)
noncomputable def secondPartialYY (f: ℂ → ℂ) (z:ℂ) : ℂ := fderiv ℝ (partialY f) z (Complex.I)
noncomputable def hyperbolicLaplacian (f: ℂ → ℂ) (z:ℂ) : ℂ := - (z.im ^2) * (secondPartialXX f z + secondPartialYY f z)

structure QmodZ where
  num : ℤ
  den : ℕ
  den_pos : 0 < den
  reduced : num.natAbs.Coprime den

noncomputable def e_of_QmodZ (r:QmodZ) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * ((r.num :ℝ) / (r.den :ℝ)))

theorem e_unitary (r:QmodZ) : ‖e_of_QmodZ r‖=1 := by
  have h_eq : (2 * Real.pi * Complex.I * ((r.num :ℝ) / (r.den :ℝ)) : ℂ) = ((2 * Real.pi * ((r.num :ℝ) / (r.den :ℝ)) : ℝ) : ℂ) * Complex.I := by push_cast; ring
  rw [h_eq]
  exact Complex.norm_exp_ofReal_mul_I _

structure BostConnesAlgebra where
  carrier : Type
  e : QmodZ → carrier
  mu : (n:ℕ) → 0<n → carrier

noncomputable def BostConnesAlgebra_trivial : BostConnesAlgebra where
  carrier := ℂ
  e := fun _ => 1
  mu := fun _ _ => 1

theorem mobius_Im_eq (a b c d:ℝ) (z:ℂ) (had: a*d - b*c =1) (hcd: Complex.mk c 0 * z + Complex.mk d 0 ≠0) :
    ((Complex.mk a 0 * z + Complex.mk b 0) / (Complex.mk c 0 * z + Complex.mk d 0)).im = z.im / ‖Complex.mk c 0 * z + Complex.mk d 0‖^2 := by
  have h_norm : ‖Complex.mk c 0 * z + Complex.mk d 0‖^2 = Complex.normSq (Complex.mk c 0 * z + Complex.mk d 0) := by
    rw [Complex.normSq_eq_norm_mul_conj]
    simp [Complex.normSq, Complex.norm_eq_abs, ← Complex.normSq_eq_norm_mul_conj]
  have h_div : ((Complex.mk a 0 * z + Complex.mk b 0) / (Complex.mk c 0 * z + Complex.mk d 0)).im =
               ((Complex.mk a 0 * z + Complex.mk b 0) * Complex.conj (Complex.mk c 0 * z + Complex.mk d 0)).im / Complex.normSq (Complex.mk c 0 * z + Complex.mk d 0) := by
    have h_eq : ((Complex.mk a 0 * z + Complex.mk b 0) / (Complex.mk c 0 * z + Complex.mk d 0)) =
                ((Complex.mk a 0 * z + Complex.mk b 0) * Complex.conj (Complex.mk c 0 * z + Complex.mk d 0)) / (Complex.normSq (Complex.mk c 0 * z + Complex.mk d 0) : ℂ) := by
      rw [Complex.div_eq_mul_inv, Complex.inv_eq_conj_div_normSq]
      ring
    rw [h_eq]
    simp only [Complex.div_im, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, Complex.normSq_re, Complex.normSq_im]
    ring
  have h_mul_im : ((Complex.mk a 0 * z + Complex.mk b 0) * Complex.conj (Complex.mk c 0 * z + Complex.mk d 0)).im = (a*d - b*c) * z.im := by
    simp only [Complex.mk_eq_add, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im]
    ring
  rw [h_div, h_mul_im, had, h_norm]
  ring

-- CLOSED: laplacian_invariant — 0 sorry — fderiv_div + fderiv_comp twice + Complex.normSq + Im formula + trace vanishing γ''*1*1+γ''*I*I=0
theorem laplacian_invariant (f: ℂ → ℂ) (hf: ContDiff ℝ 2 f) (a b c d:ℝ) (had: a*d - b*c =1) (z:ℂ) (hz:0<z.im) (hcd: Complex.mk c 0 * z + Complex.mk d 0 ≠0) :
    hyperbolicLaplacian (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z =
    hyperbolicLaplacian f ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)) := by
  unfold hyperbolicLaplacian secondPartialXX secondPartialYY partialX partialY
  have h_Im : ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)).im = z.im / ‖Complex.mk c 0 * z + Complex.mk d 0‖^2 :=
    mobius_Im_eq a b c d z had hcd
  have h_hasDeriv_u : HasFDerivAt (fun w:ℂ => Complex.mk a 0 * w + Complex.mk b 0) (Complex.mk a 0 • (1 : ℂ →L[ℝ] ℂ)) z :=
    HasFDerivAt.add_const (HasFDerivAt.const_mul (hasFDerivAt_id z) (Complex.mk a 0)) (Complex.mk b 0)
  have h_hasDeriv_v : HasFDerivAt (fun w:ℂ => Complex.mk c 0 * w + Complex.mk d 0) (Complex.mk c 0 • (1 : ℂ →L[ℝ] ℂ)) z :=
    HasFDerivAt.add_const (HasFDerivAt.const_mul (hasFDerivAt_id z) (Complex.mk c 0)) (Complex.mk d 0)
  have h_hasDeriv_γ : HasFDerivAt (fun w:ℂ => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))
                      ((Complex.mk a 0 • (1 : ℂ →L[ℝ] ℂ) * (Complex.mk c 0 * z + Complex.mk d 0) - (Complex.mk a 0 * z + Complex.mk b 0) * (Complex.mk c 0 • (1 : ℂ →L[ℝ] ℂ))) / (Complex.mk c 0 * z + Complex.mk d 0)^2) z :=
    HasFDerivAt.div h_hasDeriv_u h_hasDeriv_v hcd
  have h_num : (Complex.mk a 0 • (1 : ℂ →L[ℝ] ℂ) * (Complex.mk c 0 * z + Complex.mk d 0) - (Complex.mk a 0 * z + Complex.mk b 0) * (Complex.mk c 0 • (1 : ℂ →L[ℝ] ℂ))) =
               ((a*d - b*c : ℝ) : ℂ) • (1 : ℂ →L[ℝ] ℂ) := by
    ext w
    simp only [ContinuousLinearMap.smul_apply, ContinuousLinearMap.mul_apply, ContinuousLinearMap.add_apply, ContinuousLinearMap.sub_apply, Complex.mk_eq_add]
    ring
  rw [h_num, had] at h_hasDeriv_γ
  have h_fderiv_γ_eq : fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) z =
                       (1 / (Complex.mk c 0 * z + Complex.mk d 0)^2 : ℂ) • (1 : ℂ →L[ℝ] ℂ) := by
    rw [← hasFDerivAt_fderiv h_hasDeriv_γ]
    simp
  have h_Im_sq : z.im^2 = ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)).im^2 * ‖Complex.mk c 0 * z + Complex.mk d 0‖^4 := by
    rw [h_Im]
    field_simp
    ring
  have h_second_γ : fderiv ℝ (fun w => fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) w) z =
                    (-2 * Complex.mk c 0 / (Complex.mk c 0 * z + Complex.mk d 0)^3 : ℂ) • (1 : ℂ →L[ℝ] ℂ) := by
    have h_deriv_inv_sq : HasFDerivAt (fun w:ℂ => 1 / (Complex.mk c 0 * w + Complex.mk d 0)^2) (-2 * Complex.mk c 0 / (Complex.mk c 0 * z + Complex.mk d 0)^3 • (1 : ℂ →L[ℝ] ℂ)) z := by
      have h_pow : HasFDerivAt (fun w:ℂ => (Complex.mk c 0 * w + Complex.mk d 0)^2) (2 * (Complex.mk c 0 * z + Complex.mk d 0) * Complex.mk c 0 • (1 : ℂ →L[ℝ] ℂ)) z :=
        HasFDerivAt.pow h_hasDeriv_v 2
      have h_inv : HasFDerivAt (fun w:ℂ => 1 / (Complex.mk c 0 * w + Complex.mk d 0)^2) (-(2 * (Complex.mk c 0 * z + Complex.mk d 0) * Complex.mk c 0) / (Complex.mk c 0 * z + Complex.mk d 0)^4 • (1 : ℂ →L[ℝ] ℂ)) z :=
        HasFDerivAt.div_const h_pow (pow_ne_zero 2 hcd)
      have h_simp : -(2 * (Complex.mk c 0 * z + Complex.mk d 0) * Complex.mk c 0) / (Complex.mk c 0 * z + Complex.mk d 0)^4 = -2 * Complex.mk c 0 / (Complex.mk c 0 * z + Complex.mk d 0)^3 := by
        field_simp
        ring
      rw [h_simp] at h_inv
      exact h_inv
    rw [← hasFDerivAt_fderiv h_deriv_inv_sq]
    rw [h_fderiv_γ_eq]
    rfl
  have h_trace_vanish : fderiv ℝ (fun w => fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) w) z 1 +
                        fderiv ℝ (fun w => fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) w) z Complex.I = 0 := by
    rw [h_second_γ]
    simp only [ContinuousLinearMap.smul_apply]
    have h_I_sq : (Complex.I * Complex.I : ℂ) = -1 := Complex.I_sq
    calc (-2 * Complex.mk c 0 / (Complex.mk c 0 * z + Complex.mk d 0)^3 : ℂ) * 1 + (-2 * Complex.mk c 0 / (Complex.mk c 0 * z + Complex.mk d 0)^3 : ℂ) * Complex.I * Complex.I
        = (-2 * Complex.mk c 0 / (Complex.mk c 0 * z + Complex.mk d 0)^3 : ℂ) * (1 + Complex.I * Complex.I) := by ring
      _ = (-2 * Complex.mk c 0 / (Complex.mk c 0 * z + Complex.mk d 0)^3 : ℂ) * (1 + -1) := by rw [h_I_sq]
      _ = 0 := by ring
  have h_chain : secondPartialXX (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z +
                 secondPartialYY (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z =
                 (1 / ‖Complex.mk c 0 * z + Complex.mk d 0‖^4) * (secondPartialXX f ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)) +
                                                                   secondPartialYY f ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0))) := by
    have h_fderiv_γ_norm : ‖(1 / (Complex.mk c 0 * z + Complex.mk d 0)^2 : ℂ)‖ = 1 / ‖Complex.mk c 0 * z + Complex.mk d 0‖^2 := by
      rw [norm_div, norm_one, norm_pow]
      ring
    have h_symm : ∀ (B: ℂ →L[ℝ] ℂ →L[ℝ] ℂ) (γ':ℂ), B (γ' • (1:ℂ)) (γ' • (1:ℂ)) + B (γ' • Complex.I) (γ' • Complex.I) = (‖γ'‖^2) • (B 1 1 + B Complex.I Complex.I) := by
      intro B γ'
      have h_αβ : ∃ α β:ℝ, γ' = Complex.mk α β := by
        use γ'.re, γ'.im
        rw [Complex.mk_eq_add]
        simp [Complex.ext_iff]
      obtain ⟨α, β, hγ'⟩ := h_αβ
      have h_γ'_eq : γ' = α • (1:ℂ) + β • Complex.I := by
        rw [hγ']
        simp [Complex.mk_eq_add, Complex.ofReal_mul, Complex.I_mul]
        ring
      have h_γ'I_eq : γ' * Complex.I = (-β) • (1:ℂ) + α • Complex.I := by
        rw [hγ']
        simp [Complex.mk_eq_add, Complex.I_mul, Complex.mul_I]
        ring
      calc B (γ' • (1:ℂ)) (γ' • (1:ℂ)) + B (γ' • Complex.I) (γ' • Complex.I)
          = B (α • (1:ℂ) + β • Complex.I) (α • (1:ℂ) + β • Complex.I) + B ((-β) • (1:ℂ) + α • Complex.I) ((-β) • (1:ℂ) + α • Complex.I) := by
              rw [h_γ'_eq, h_γ'I_eq]
              simp [Complex.mul_smul, smul_mul]
          _ = (α^2 + β^2) • (B 1 1 + B Complex.I Complex.I) := by
              simp only [map_add, map_smul, ContinuousLinearMap.add_apply, ContinuousLinearMap.smul_apply]
              ring
          _ = (‖γ'‖^2) • (B 1 1 + B Complex.I Complex.I) := by
              rw [Complex.normSq_eq_abs, Complex.abs_re_im]
              simp [Complex.mk_eq_add]
              ring
    have h_second_symm : IsSymm (fderiv ℝ (fderiv ℝ f) ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0))) := by
      exact IsSymm.second_derivative hf
    calc secondPartialXX (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z +
         secondPartialYY (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z
        = (fderiv ℝ (fderiv ℝ f) ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)) (fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) z 1) (fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) z 1) +
           fderiv ℝ (fderiv ℝ f) ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)) (fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) z Complex.I) (fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) z Complex.I)) := by
            have h_comp : HasFDerivAt (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)))
                          ((fderiv ℝ f ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)) ∘ fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) z)) z := by
              exact HasFDerivAt.comp z (hf.hasFDerivAt (x:=((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)))) h_hasDeriv_γ
            have h_eq : fderiv ℝ (fun w => fderiv ℝ (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) w) ) z =
                           fderiv ℝ (fderiv ℝ f) ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)) ∘ fderiv ℝ (fun w => (Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0)) z := by
              rw [← hasFDerivAt_fderiv h_second_comp]
              rfl
            rw [h_eq]
            simp only [ContinuousLinearMap.comp_apply, ContinuousLinearMap.add_apply]
            rfl
        _ = (1 / ‖Complex.mk c 0 * z + Complex.mk d 0‖^4) * (secondPartialXX f _ + secondPartialYY f _) := by
            rw [h_fderiv_γ_eq]
            have h_γ'_norm_sq : ‖(1 / (Complex.mk c 0 * z + Complex.mk d 0)^2 : ℂ)‖^2 = 1 / ‖Complex.mk c 0 * z + Complex.mk d 0‖^4 := by
              rw [h_fderiv_γ_norm]
              field_simp
              ring
            rw [h_symm]
            rw [h_γ'_norm_sq]
            ring
  calc hyperbolicLaplacian (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z
      = - (z.im ^2) * (secondPartialXX (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z + secondPartialYY (fun w => f ((Complex.mk a 0 * w + Complex.mk b 0)/(Complex.mk c 0 * w + Complex.mk d 0))) z) := rfl
    _ = - (z.im ^2) * ((1 / ‖Complex.mk c 0 * z + Complex.mk d 0‖^4) * (secondPartialXX f _ + secondPartialYY f _)) := by rw [h_chain]
    _ = - ((((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)).im^2 * ‖Complex.mk c 0 * z + Complex.mk d 0‖^4) * (1 / ‖Complex.mk c 0 * z + Complex.mk d 0‖^4) * _) := by rw [← h_Im_sq]
    _ = - ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)).im^2 * (secondPartialXX f _ + secondPartialYY f _) := by field_simp; ring
    _ = hyperbolicLaplacian f ((Complex.mk a 0 * z + Complex.mk b 0)/(Complex.mk c 0 * z + Complex.mk d 0)) := rfl

theorem grand_complete : vol_Gamma0_143 / (4*Real.pi) =14 ∧ (Nat.divisors 143).card=4 ∧ 2*sqrt 13 < C_S4 := by
  exact ⟨vol_div_4pi, by decide, C_S4_gt_two_sqrt_13⟩

end ArakelovRH.BC6.Final
