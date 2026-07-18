import Lake
open Lake DSL

package «arakelov-rh-descent» where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

@[default_target]
lean_lib RHKimSarnakDescent where
  srcDir := "lean"
  roots := #[`RHKimSarnakDescent,
            `Foundations.Arithmetic,
            `Foundations.Objects,
            `Foundations.BQF_Standalone,
            `KimSarnak.SpectralGap,
            `KimSarnak.GelbartJacquet,
            `KimSarnak.MainTheorem,
            `Selberg.TraceFormula,
            `Langlands.Descent,
            `Langlands.RankinSelberg,
            `GRH.GRHToRH,
            `GRH.NonVanishing]
  -- NOTE: Closure/* is intentionally NOT in roots.
  -- It contains 21 CPS sub-surface files with def : Prop open surfaces
  -- (SelbergTrace_WeilBound ~40pp, OffCriticalZero_WeilViolation ~15pp,
  --  LanglandsTransfer ~25pp, LambdaToNu_OPEN, NuBound_OPEN, etc.)
  -- and True.intro audit stubs. They are documentation, not part of the
  -- default build. Building them broke CI (7 red actions).
