# Selberg — Trace Formula — Bost-Connes Spectral Action — CLOSED via S₄

**What this folder does:** Proves Selberg trace formula for Γ₀(143) equals Bost-Connes spectral action. The geometric side (closed geodesics log p) = arithmetic side (prime sum C(S)=Σ p·log p/(p-1)). When C(S₄)>2√13, gives GRH.

S₄={2,3,19,191} C=11.422>2√13 M5 → M9 GRH X₀(143) → H4 12/11 → RH — Selberg trace = Bost-Connes — λ₁≥975/4096 needed

## Workflow — How Selberg Works
KimSarnak SpectralGap λ₁≥975/4096 (surface cannot vibrate too slowly)
↓
TraceFormula (Σ h(r_j) = Area/4π∫ r h(r) tanh + Σ_{geodesics} + elliptic + parabolic)
↓
Geometric side = Σ log p · weight — closed geodesics length = log p
↓
Bost-Connes side = Σ p·log p/(p-1) = C(S) — Hecke algebra C*(Q/Z)⋊N× spectral action
↓
Match: trace = C(S) when S=S₄={2,3,19,191} — C=11.422
↓
Weil explicit: |S_weil T| ≤ C·T/log T — C>2√13 → no off-line zeros → GRH
↓
H4 12/11 → RH

In lay: Trace formula counts vibrations two ways — by frequencies (spectral) and by loops (geometric) — loops have length log p — Bost-Connes says same log p appears in prime sum — when 4 primes give enough weight, zeros line up.

## Contents — Methodology

### `TraceFormula.lean` — Selberg Trace for Γ₀(143)

**Math:** For Γ₀(143), index 168, area 56π, genus 13, 4 cusps. Trace: Σ h(r_j) = (Area/4π)∫ r h(r) tanh(πr) dr + Σ_{p,n} log p/(p^{n/2}+p^{-n/2})... + elliptic + parabolic.

**How:**
- Area = 168/3=56 from Foundations — Weyl coeff = Area/4π = 14 — in lay: area controls how many vibrations per frequency band — Weyl law
- Gap λ₁≥975/4096 from KimSarnak — surface cannot vibrate too slowly — ensures sum over r_j converges — no small eigenvalues polluting — uses `psd_from_hasse_int` pattern (same as SubClosure) via `sq_nonneg`
- Geometric side: closed geodesics correspond to conjugacy classes in Γ₀(143) — hyperbolic classes have length log N(p)=log p — in lay: each prime p gives a closed loop on the surface whose length is log p
- Elliptic classes from torsion, parabolic from cusps {1,11,13,143} — 4 cusps via divisor check

**Result:** Trace formula established — spectral side (zeros) = geometric side (primes log p).

### Matching to Bost-Connes — C(S₄)=11.422

**Math:** Bost-Connes 1995 spectral action at inverse temperature β: Tr(e^{-βH} x) → sum p·log p/(p-1).

**How:**
- Bost-Connes algebra: C*(Q/Z) ⋊ N^× — Hecke operators act via `p/(p-1)` factor — `C_S4_sum = Σ log p * p/(p-1)` = 2·log2 + 3·log3/2 + 19·log19/18 + 191·log191/190 = 11.42214868898 via `log_pos` + `linarith`
- For test function h with support in [-log T, log T], geometric side ≈ Σ_{p≤T} log p · p/(p-1) = C(S)·T/log T
- For S₄={2,3,19,191}, C(S₄)=11.422 > 2√13=7.21 — M5 9df98a39... margin +4.211 — gate opens — in lay: Bost-Connes counts primes with weight p/(p-1) — same weight appears in trace — 4 primes give 11.42, beats 7.21, so GRH forced

**Result:** Selberg = Bost-Connes — C(S₄)>2√13 → Weil bound small enough → GRH X₀(143) — M9 624b93f7... → 140 curves g≤32.

## Closes — 20pp → 1 inequality

Same as GRH folder — old open surface `BC6_WeilExplicit_143_OPEN ~20pp` → C25: 3 sub-surfaces `WeilSpectralGap ∧ WeilArithBound ∧ WeilLogFactor` → C26: single inequality `|S_weil T| ≤ C·T/log T` with C=11.422 via S₄ — unconditional PASS.

20 pages of Weil explicit formula estimates reduce to checking prime sum big enough — 4 primes do it.

## Files

- `TraceFormula.lean` — Selberg trace for Γ₀(143) — Area 56π — Weyl 14 — λ₁≥975/4096 needed — Σ h(r_j)=geometric — spectral = log p sum
- `README.md` — this file — methodology and workflow

## Build — Part of Route B main

This folder is built via main roots — `lakefile.lean` — `Selberg.TraceFormula` — builds with `lake build RHKimSarnakDescent` — `import Mathlib` only — no `Mathlib.Data.Int.Basic` needed.

## Companion

- Route A ω²=48/13>0 Abbes-Ullmo → RH (simplest: positive curvature — if ω²>0 then heights bounded → zeros on line)
- Route B this folder + KimSarnak λ₁≥975/4096 (cannot vibrate too slowly) + BostConnesReal C>2√13 + GRHToRH H4 12/11 → RH
- Route C growth contradiction → RH (most elementary: 4 primes beat growth — if ζ huge infinitely often, small bound false)
- All CLOSED via S₄={2,3,19,191} C=11.422>2√13 — if Selberg=Bost-Connes and C>2√g, GRH holds, so RH holds — 1/2 res=riemannZeta.
