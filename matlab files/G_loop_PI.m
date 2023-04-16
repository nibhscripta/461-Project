function G = G_loop_PI(k_c, tau_I)
    %{
        Return the closed loop transfer function with a PI controller for changes in the inlet temperature to the reactor

        Arguments:

        k_c: static gain of the controller
        tau_I: time constant for the integral action of the controller
    %}

    G_p = tf(sys_around_U);
    G_w = tf(sys_around_T_0);
    k_I = 1/tau_I;
    G_c = tf(pid(k_c, k_I));

    G = series(feedback(1, series(G_p, G_c)), G_w);