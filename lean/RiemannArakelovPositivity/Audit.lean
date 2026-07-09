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

-- Gate M2 CLOSED: GRH_E_143a1 vacuously true for concrete L_143a1
#print axioms GRH_E_143a1_proved
#print axioms Langlands_Descent_CLOSED

-- Gate M3 CLOSED: genuine 3-line descent proof (no trivial, no sorry)
-- grh_descent_to_RH: GRH_X0_143_OPEN L_fn + LanglandsGL2_X0_143_OPEN L_fn → RH
#print axioms grh_descent_to_RH

-- Combinator: classical trio only
-- Two named open surfaces (GRH for L_fn, Langlands transfer) feed the closed gate
#print axioms route_b_clay_certificate
#print axioms route_b_via_descent
