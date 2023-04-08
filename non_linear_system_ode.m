function f = non_linear_system_ode(t, y, U, T_0)
    f = y*0;

    C_A = y(1);
    C_S = y(2);
    T = y(3);

    f(1) = -400000000000000.0*C_A*(C_A + 0.8)*exp(-15395.7180659129/T) - 0.0625*C_A + 0.26875;
    f(2) = -0.0625*C_S - 1.0e+84*C_S*exp(-96223.2379119557/T) + 0.1875;
    f(3) = 5.76581153162306e+15*C_A*(C_A + 0.8)*exp(-15395.7180659129/T) + 1.01600203200406e+86*C_S*exp(-96223.2379119557/T) - 0.0625*T + 0.0625*T_0 - 4.20688341376683e-7*U*(T - 373);
