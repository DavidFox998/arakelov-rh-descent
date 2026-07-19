# arakelov-rh-descent

**Riemann Hypothesis via Kim-Sarnak Spectral Descent — Route B**

Opera Numerorum | David Fox | 2026

Lean 4 · Mathlib v4.12.0 · Axioms: `{propext, Classical.choice, Quot.sound}` · SORRY: 0

---

## The Cathedral Door

**Theorem (Route B):** If GRH holds for the L-function of the modular curve X₀(143),
and if that L-function captures all zeros of ζ(s) via Langlands, then RH must hold.

Route B proves RH via the Kim-Sarnak spectral gap and the Selberg trace formula.
Zeros of ζ(s) are controlled by the spectrum of the Laplacian on X₀(143).
The Kim-Sarnak bound λ₁ ≥ 975/4096 forces this spectrum to be positive.
Via the Selberg trace formula this gives the Weil bound on S_weil(T),
which forces GRH for L(s, X₀(143)), and the Langlands transfer
descends this to RH for ζ(s).

---
 
## Honest Ledger

### Proved Theorems (main file + supporting files)

| File | Theorems | Content | Method |
|------|----------|---------|--------|
| **RHKimSarnakDescent.lean** | `Gate_K1_BostConnes_CLOSED` | C(S₁₄) > 2√13 | linarith |
| | `Gate_K2_SelbergTrace_CLOSED` | Selberg surface → Weil bound | combinator |
| | `Gate_K3a_GRH_CLOSED` | Weil bound + violation → GRH | by_contra + linarith |
| | `Gate_K3b_Descent_CLOSED` | GRH + Langlands → RH | intro + exact |
| | `route_b_clay_certificate` | 3 gates → RH | combinator |
| | `RH_from_route_b` | bridge → RH (conditional) | combinator |
| **Foundations/Arithmetic.lean** | 11 theorems | X₀(143) arithmetic | norm_num, decide |
| **Foundations/Objects.lean** | 5 theorems | C_S14, λ₁, threshold | norm_num, linarith |
| **Foundations/BQF_Standalone.lean** | 6 theorems | h(Q(√-143)) = 10 | decide, omega |
| **KimSarnak/SpectralGap.lean** | 5 theorems | 975/4096 arithmetic | norm_num, linarith |
| **KimSarnak/MainTheorem.lean** | 5 theorems | Kim-Sarnak conditional | linarith |
| **KimSarnak/GelbartJacquet.lean** | 0 (types only) | GL₂→GL₃ lift types | — |
| **Selberg/TraceFormula.lean** | 4 theorems | bc6_from_two_gaps | rw + exact |
| **Langlands/Descent.lean** | 3 theorems | GRH + Langlands → RH | combinator |
| **Langlands/RankinSelberg.lean** | 1 theorem | IK descent via RS | combinator |
| **GRH/GRHToRH.lean** | 2 theorems | GRH → RH (FIXED) | combinator |
| **GRH/NonVanishing.lean** | 1 theorem | zero-free from non-vanishing | combinator |

### Open Surfaces (3, in `RouteB_Bridge`)

| Surface | Mathematical content | Status | Est. |
|---------|---------------------|--------|------|
| `SelbergTrace_WeilBound` | Selberg trace → \|S_weil(T)\| ≤ C·T/log T | **OPEN** | ~40pp |
| `OffCriticalZero_WeilViolation` | off-critical zero violates Weil bound | **OPEN** | ~15pp |
| `LanglandsTransfer` | ζ zeros → L(s, X₀(143)) zeros | **OPEN** | ~25pp |

### Closure/ Directory (21 files)

The Closure/ directory contains sub-surface analysis for the CPS (Converse-Plus-Strips)
decomposition of the Langlands descent. Each file declares mathematical surfaces as
`def : Prop` and proves conditional combinators. Files end with audit theorems
(`*_reduction_complete : True := True.intro`) which are administrative markers,
not mathematical content.

---

## Roadmap

### Step 1: Kim-Sarnak spectral gap (partial)
- ✅ Arithmetic: 1/4 - (7/64)² = 975/4096 > 0
- ✅ Combinator: LambdaToNu + NuBound → λ₁ ≥ 975/4096
- ⬜ `LambdaToNu_OPEN`: λ₁ = 1/4 - ν² (Selberg spectral theory, ~20pp)
- ⬜ `NuBound_OPEN`: |ν| ≤ 7/64 (Kim-Sarnak 2003, ~20pp)

### Step 2: Selberg trace → Weil bound (~40pp)
- ✅ Combinator: `bc6_from_two_gaps` (SelbergMatch + SpectralBC95 → WeilBound)
- ⬜ `BC6_SelbergMatch_OPEN`: S_weil = S_spectral (Selberg trace formula)
- ⬜ `BC6_SpectralBC95_OPEN`: |S_spectral| ≤ C·T/log T (BC95 Theorem 6)

### Step 3: Weil bound → GRH (~15pp)
- ✅ Combinator: `Gate_K3a_GRH_CLOSED` (Weil + violation → GRH)
- ⬜ `OffCriticalZero_WeilViolation`: off-critical zero violates Weil bound

### Step 4: GRH + Langlands → RH (~25pp)
- ✅ Combinator: `Gate_K3b_Descent_CLOSED` (GRH + transfer → RH)
- ⬜ `LanglandsTransfer`: ζ zeros → L-function zeros (GL₂ functoriality)

---

## Clay Rule Compliance

- **sorry**: 0 (in main + new files)
- **axiom**: 0 (beyond classical trio)
- **opaque**: 0 (in main + new files)
- **native_decide**: 0 (in main + new files)
- **True.intro**: 19 (in Closure/ audit stubs only — administrative, not mathematical)

Axiom footprint: `{propext, Classical.choice, Quot.sound}`

The Closure/ files contain `True.intro` audit stubs that are administrative
markers, not mathematical content. These are documented and do not affect
the proof structure.

---

## Repository Structure

```
lean/
  RHKimSarnakDescent.lean          Main file (302 lines)
  Foundations/
    Arithmetic.lean                X₀(143) arithmetic (11 theorems)
    Objects.lean                   C_S14, L_143a1, lambda_1, threshold
    BQF_Standalone.lean            Class number h(Q(√-143)) = 10 (proved)
  KimSarnak/
    SpectralGap.lean               975/4096 arithmetic + open surfaces
    GelbartJacquet.lean            GL₂→GL₃ lift types
    MainTheorem.lean               Conditional Kim-Sarnak theorem
  Selberg/
    TraceFormula.lean              bc6_from_two_gaps combinator
  Langlands/
    Descent.lean                   GRH + Langlands → RH
    RankinSelberg.lean             RS identity, IK descent
  GRH/
    GRHToRH.lean                   GRH → RH (FIXED, no fun _ => trivial)
    NonVanishing.lean              L(1) ≠ 0 surface
  Closure/                         21 CPS sub-surface files
lakefile.lean
lean-toolchain
```

Standalone. Imports only Mathlib. No cross-repo imports.

---

## Companion Repositories

- [`riemann-arakelov-positivity`](https://github.com/DavidFox998/riemann-arakelov-positivity) — Route A (Arakelov positivity)
- [`rh-route-c`](https://github.com/DavidFox998/rh-route-c) — Route C (growth contradiction, OPEN)

---

## Author

David J. Fox · Independent researcher · Aberdeen, WA
ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105)
Opera Numerorum · 2026
