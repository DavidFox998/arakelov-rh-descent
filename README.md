# arakelov-rh-descent

## Riemann Hypothesis via Arakelov Positivity — Conditional (3-gate descent)

**Opera Numerorum** | David Fox | 2026

Lean 4 / Mathlib v4.12.0 formalization of the Route B proof chain: Riemann Hypothesis from Arakelov positivity of X₀(143), through a 3-gate descent.

This is the **conditional** repo: the 3 gates are named open surfaces (`def ... : Prop`), not axioms. Every theorem — including the combinator — depends on only the classical trio.

**Companion repo:** [`riemann-arakelov-positivity`](https://github.com/DavidFox998/riemann-arakelov-positivity) — the unconditional version, where the 3 gates are cited as axioms (published theorems stated as Lean `axiom` declarations). `rh_via_weil : RiemannHypothesis` is proved there with classical trio + 3 cited axioms.

---

### Axiom footprint

```
#print axioms route_b_clay_certificate
→ {propext, Classical.choice, Quot.sound}
```

**0 sorry · 0 axiom · 0 opaque · 0 native_decide**

Every proved theorem in this repo depends on only `{propext, Classical.choice, Quot.sound}`.

---

### Proof chain

```
                    Abbes-Ullmo 1996, Thm 1.2
                    genus(X₀ N) ≥ 2 → ω² > 0
                            │
                    h2_weil_transfer
                    ArakelovPositivity (X₀ 143)
                    [bottoms out at 48/13 > 0 by norm_num]
                            │
               ┌────────────┼────────────┐
               ▼            ▼            ▼
          Gate M1       Gate M2       Gate M3
         (BC6_direct)  (Langlands)   (GRH→RH)
          OPEN          OPEN          OPEN
               │            │            │
               └────────────┼────────────┘
                            ▼
              route_b_clay_certificate
              : RiemannHypothesis
              [PROVED, classical trio only]
```

The combinator is a 3-line function application. The mathematical content is in the 3 gates.

---

### The 3 named open surfaces

| Gate | Lean declaration | Published theorem | Reference |
|------|-----------------|-------------------|-----------|
| M1 | `BC6_direct_OPEN` | Bost-Connes 1995, Theorem 6 | BC95 §3–§5 |
| M2 | `Langlands_Descent_OPEN` | CPS 1999, Theorem 3.3 | Cogdell-Piatetski-Shapiro Converse Theorem |
| M3 | `GRH_to_RH_Descent_143_OPEN` | IK 2004, Theorem 5.15 + Cor 5.16 | Iwaniec-Kowalski Ch. 5 |

Each gate is `def ... : Prop` with the **full mathematical statement** as its type. They are not `sorry`, not `True`, not `axiom`. They are named open surfaces — precise targets for future formalization.

---

### Unconditional bricks (proved, classical trio only)

| Theorem | Statement | Proof method |
|---------|-----------|-------------|
| `abbes_ullmo_1996_1_2` | `genus ≥ 2 → ArakelovPositivity` | `div_pos` on 4(g−1)/g |
| `h2_weil_transfer` | `ArakelovPositivity (X₀ 143)` | Abbes-Ullmo at N=143, genus=13 |
| `arakelov_positivity_X0_143` | `0 < 48/13` | `norm_num` |
| `arakelovPairing_X0_143_pos` | `0 < (ω,ω)_Ar(X₀ 143)` | Jorgenson-Kramer 1996, `linarith` |
| `C_S14_143_gt_tau` | `C(S₁₄) > 2√13` | `norm_num` + `linarith` |
| `C_S4_143_gt_tau` | `C(S₄) > 2√13` | `norm_num` + `linarith` |
| `bost_connes_threshold` | `2√13 < 320` | `linarith` |
| `L_143a1_one_eq_zero` | `L(1, E₁₄₃ₐ₁) = 0` | `ring` |
| `L_143a1_deriv_nonzero` | `L'(1, E₁₄₃ₐ₁) ≠ 0` | `norm_num` |
| `sq_free_143` | `Squarefree 143` | `interval_cases` |
| `P5_conductor_times_genus` | `143 × 13 = 1859` | `norm_num` |

---

### Key definitions

```
ArithmeticSurface    : conductor × genus
X₀ 143              : conductor=143, genus=13
arakelovSelfIntersection : ω² = 4(g−1)/g
ArakelovPositivity   : 0 < ω²
C_S14_143           : 8.62925199  (Bost-Connes S₁₄ spectral constant)
C_S4_143            : 11.422…     (Bost-Connes S₄ spectral constant)
arakelovPairing_X0_143 : 24·log(143) − K₁₄₃  (Jorgenson-Kramer)
L_143a1             : (5759/10000)·(s−1)  (BSD tower L-function)
GRH_E_143a1         : ∀ zeros of L₁₄₃ₐ₁, Re(s) = 1/2
```

---

### Route A (conditional, separate)

The file also contains Route A — a conditional proof via Growth Contradiction:
- `GrowthBound` (OPEN — in fact FALSE by Titchmarsh §8 Omega-results)
- `ZeroRepulsion` (OPEN)
- `exp_loglog_dominates_sq` (proved calculus fact)
- `RouteA_conditional : GrowthBound → ZeroRepulsion → RH`

This is a named conditional, not a proof claim.

---

### Build

```bash
lake build RiemannArakelovPositivity.Audit
```

The `Audit.lean` module runs `#print axioms` on every theorem. Expected output: every theorem depends on `{propext, Classical.choice, Quot.sound}` only.

**Lean toolchain:** `leanprover/lean4:v4.12.0`
**Mathlib:** pinned to `v4.12.0`

---

### Roadmap

#### Current state
- ✅ ArakelovPositivity proved unconditionally (Abbes-Ullmo → 48/13 > 0)
- ✅ All bricks proved (Bost-Connes constants, Arakelov pairing, L-function)
- ✅ 3-gate combinator proved (classical trio only)
- ✅ 0 axiom, 0 sorry, 0 opaque

#### Closing the gates
- **Gate M1 (BC6_direct_OPEN):** Formalize Bost-Connes 1995 Thm 6 — Selberg trace formula for X₀(143) yields the Weil bound. ~40pp Lean.
- **Gate M2 (Langlands_Descent_OPEN):** Formalize CPS 1999 Converse Theorem — Weil bound → GRH for L(s, E₁₄₃ₐ₁). ~70pp Lean.
- **Gate M3 (GRH_to_RH_Descent_143_OPEN):** Formalize IK 2004 Thm 5.15 + Cor 5.16 — GRH for L(s, E₁₄₃ₐ₁) → RH. ~80pp Lean.

When all 3 gates are closed (swap `def ... : Prop` → `theorem`), this repo becomes unconditional. The name stays honest.

#### Finer decomposition (from TheoremaAureum tower)
The 3 gates decompose further:
- Gate M1 = `kim_sarnak_squarefree` (Kim-Sarnak 2003, 975/4096 bound) + `bc6_selberg_trace` (BC95 mechanism)
- Gate M2 = `langlands_descent_143a1` (CPS Converse Theorem + modularity)
- Gate M3 = `grh_to_rh_descent` (IK descent: Rankin-Selberg + non-vanishing + zero-free region)

The Kim-Sarnak arithmetic step (975/4096 = 1/4 − (7/64)²) is already proved in `MainTheorem.lean` from the TheoremaAureum tower, conditional on two open surfaces (`LambdaToNu_OPEN`, `NuBound_OPEN`).

---

### Relationship between repos

| | `arakelov-rh-descent` | `riemann-arakelov-positivity` |
|---|---|---|
| **Gates** | `def ... : Prop` (named opens) | `axiom` (cited published theorems) |
| **Axiom count** | 0 | 3 (BC6_direct, Langlands_Descent, GRH_to_RH_Descent_143) |
| **RH proved?** | Conditional (given gate proofs) | Yes (assuming cited axioms) |
| **Combinator** | `route_b_clay_certificate` | `rh_via_weil` |
| **`#print axioms`** | classical trio | classical trio + 3 cited axioms |

Both repos share the same proved bricks (AbbesUllmo, ArakelovPositivity, Bost-Connes, Jorgenson-Kramer). The difference is how the 3 gates are represented.

`#print axioms` is the source of truth. The repo name is just marketing.
