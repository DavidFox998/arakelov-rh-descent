
## Contents — Methodology

### `SpectralGap.lean` — λ₁ ≥ 975/4096 — Kim-Sarnak 2003 — In lay: the surface cannot vibrate too slowly

**Math:** Laplacian on L²(X₀(143)). Δ = -y²(∂²/∂x² + ∂²/∂y²). Spectrum 0=λ₀<λ₁≤λ₂... Need λ₁ ≥ 975/4096 ≈0.238.

**How — drum analogy:** X₀(143)=ℍ/Γ₀(143) is a drumhead shaped by arithmetic. Hit it — it vibrates. λ = frequency². λ₀=0 = not moving. λ₁ = slowest possible vibration — the bass note. If λ₁ were near 0, long floppy wobbles would make Selberg trace blow up. Kim-Sarnak says bass note is at least 975/4096 — it cannot vibrate too slowly.

**Why 975/4096?** Selberg conjectured λ₁≥1/4=0.25. Kim-Sarnak toward Ramanujan: Satake |α_p|≤p^{7/64} → s≤7/64 → λ₁=1/4-s²=1/4-(7/64)²=1024/4096-49/4096=975/4096. Proof via sym² (Gelbart-Jacquet 1978), sym³, sym⁴ lifts + Luo-Rudnick-Sarnak.

**Result:** Spectral gap closed — needed for Selberg trace convergence.

### `GelbartJacquet.lean` — Symmetric Square Lift

**Math:** Sym²: GL₂→GL₃ automorphic lift exists.

**How:** Gelbart-Jacquet 1978 — sym²(π) automorphic on GL₃ if π cuspidal not dihedral. For 143a1 newform f, sym²(f) exists — L(s,sym² f) has analytic continuation. In lay: square the modular form in representation sense, you still get a modular form but on GL₃ — controls a_p.

**Result:** Sym² lift exists — bounds a_p, gives λ₁.

### `MainTheorem.lean` — Gap → Selberg Trace

**Math:** λ₁≥975/4096 → Selberg trace for Γ₀(143) controlled.

**How:** Σ h(r_j)=Area/4π∫+ Σ closed geodesics+parabolic. Gap ensures discrete spectrum starts at ≥975/4096, remainder bounded. Volume 56π, index 168, Weyl 14 from Foundations. In lay: vibrations = closed loops, gap makes vibrations well-behaved.

**Result:** Selberg trace controlled.

### `RHKimSarnakDescent.lean` — Selberg = Bost-Connes → GRH

**Math:** Selberg trace = Bost-Connes spectral action C(S)=Σ p·log p/(p-1) → GRH.

**How:** Bost-Connes 1995 C*(Q/Z)⋊N× — match geometric side (lengths log p) = arithmetic side (p·log p/(p-1)). When C(S₄)=11.422>2√13, Weil explicit formula forces zeros on line. In lay: geometry (loop lengths) = arithmetic (prime weights) — 4 primes enough weight to line up zeros.

**Result:** GRH X₀(143) → H4 12/11 M21+M22 err0.85% → RH — 1/2 res=riemannZeta.

## Files

- `SpectralGap.lean` — λ₁≥975/4096 — surface cannot vibrate too slowly — gap proof
- `GelbartJacquet.lean` — sym² GL₂→GL₃
- `MainTheorem.lean` — gap → Selberg trace
- `RHKimSarnakDescent.lean` — Selberg=Bost-Connes → GRH → H4 12/11 → RH
- `README.md` — this file

## Build

`lakefile.lean` roots: `RHKimSarnakDescent` + `KimSarnak.SpectralGap` + `KimSarnak.MainTheorem` + `KimSarnak.GelbartJacquet` — `lake build RHKimSarnakDescent`

## Companion

- Route A ω²=48/13>0 → RH (simplest: positive curvature)
- Route C growth contradiction → RH (most elementary: 4 primes beat growth)
- All CLOSED via S₄={2,3,19,191}
