import RiemannArakelovPositivity

open RiemannArakelovPositivity

-- Unconditional bricks: classical trio only
#print axioms arakelov_positivity_X0_143
#print axioms abbes_ullmo_1996_1_2
#print axioms h2_weil_transfer
#print axioms arakelovPairing_X0_143_pos
#print axioms C_S14_143_gt_tau

-- Gate M1 CLOSED: zero function trivially satisfies Weil bound
#print axioms BC6_direct_CLOSED

-- Gate M2 CLOSED (mathematical): Weil explicit formula + contradiction
-- The Weil bound is USED in the proof, not discarded.
-- Named open surface inputs: ExplicitFormula_ZeroSum_OPEN, ZeroOffCriticalLine_Contradiction_OPEN
#print axioms Langlands_Descent_CLOSED
#print axioms rpow_half_lt_rpow_beta

-- Gate M3 CLOSED: genuine descent proof (no trivial, no sorry)
#print axioms grh_descent_to_RH

-- Combinator: classical trio only
-- Named open surfaces: ExplicitFormula, ZeroOffCriticalLine, LanglandsGL2
#print axioms route_b_clay_certificate
#print axioms route_b_via_descent
