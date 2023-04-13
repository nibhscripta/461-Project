function G_c = PI_tf(k_c, tau_I)
    G_c = tf(k_c * [tau_I, 1], k_c * [tau_I, 0]);