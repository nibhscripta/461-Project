# CHEN 461 Computer Project

Simulation Code Repository

## State Space Model:

$$\frac{dC_A}{dt}=\frac{F}{V}\left(C_{A0}-C_A\right)-k_1(T)C_A\left(C_A+C_B-C_{A0}\right)$$

$$\frac{dC_S}{dt}=\frac{F}{V}\left(C_{S0}-C_S\right)-k_2(T)C_S$$

$$\frac{dT}{dt}=\frac{F}{V}\left(T_0-T\right)+\frac{-\Delta H_1k_1(T)C_A\left(C_A+C_B-C_{A0}\right)-\Delta H_2k_2(T)C_S}{\rho C_p}-\frac{UA\left(T-T_c\right)}{V\rho C_p}$$