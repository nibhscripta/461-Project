function f = non_linear_w_PI(t, y, U, T_0, T_sp, k_c, tau_I)
    %{
        System of ordinary differential that represents the state space of the reactor which includes PI control.

        Arguments:

        t: time input to ODE system
        y: state vector input to ODE system
        U: specified heat transfer coefficient
        T_0: specified inlet temperature
        T_sp: temperature set point
        k_c: controller static gain
        tau_I: time constant for the integral action of the controller
    %}

    f = y*0;

    C_A = y(1);
    C_S = y(2);
    T = y(3);
    e_I = y(4);

    e = T_sp - T;
    u_PI = k_c * (e + e_I / tau_I);
    U_in = U+u_PI;

    f(1) = -400000000000000.0*C_A*(C_A + 0.8)*exp(-15395.7180659129/T) - 0.0625*C_A + 0.26875;
    f(2) = -0.0625*C_S - 1.0e+84*C_S*exp(-96223.2379119557/T) + 0.1875;
    f(3) = 5.76581153162306e+15*C_A*(C_A + 0.8)*exp(-15395.7180659129/T) + 1.01600203200406e+86*C_S*exp(-96223.2379119557/T) - 0.0625*T + 0.0625*T_0 - 4.20688341376683e-4*U_in*(T - 373);
    f(4) = e;