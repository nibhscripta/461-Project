function G = G_loop_P(k_c)
    %{
        Return the closed loop transfer function with a P only controller for changes in the inlet temperature to the reactor

        Arguments:

        k_c: static gain of the P controller
    %}

    G_p = tf(sys_around_U);
    G_w = tf(sys_around_T_0);
    G_c = tf(k_c, 1);

    G = series(feedback(1, series(G_p, G_c)), G_w);