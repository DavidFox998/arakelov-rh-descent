import Lake
open Lake DSL

package «arakelov-rh-descent»

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

@[default_target]
lean_lib RiemannArakelovPositivity where
  srcDir := "lean"
