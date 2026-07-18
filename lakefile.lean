import Lake
open Lake DSL

package «arakelov-rh-descent»

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

@[default_target]
lean_lib RHKimSarnakDescent where
  srcDir := "lean"
  roots := #[`RHKimSarnakDescent, `Foundations.Arithmetic, `Foundations.Objects,
            `Foundations.BQF_Standalone, `KimSarnak.SpectralGap, `KimSarnak.GelbartJacquet,
            `KimSarnak.MainTheorem, `Selberg.TraceFormula, `Langlands.Descent,
            `Langlands.RankinSelberg, `GRH.GRHToRH, `GRH.NonVanishing,
            `Closure.BoundedStripsClosure, `Closure.ConverseUniquenessClosure,
            `Closure.EulerProductClosure, `Closure.FunctionalEquationClosure,
            `Closure.L_sym2_NonVanishingClosure, `Closure.RSIdentityAttack,
            `Closure.RSIdentityFullAttack, `Closure.RamanujanFactorizationClosed,
            `Closure.ResidueArgumentClosure, `Closure.RouteBMasterReduction,
            `Closure.SelbergTraceSubClosure, `Closure.SelbergWeilClosure,
            `Closure.SineGrowthSubClosure, `Closure.WeilBoundSubClosure,
            `Closure.WeilBoundToGRHClosure, `Closure.WeilExplicitSubClosure,
            `Closure.WeilGateAttack, `Closure.ZFRGateAttack,
            `Closure.ZeroFreeStripSubClosure, `Closure.ZetaZeroFreeClosure,
            `Closure.ZetaZeroFreeDecomp]
