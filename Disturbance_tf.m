function G_w = Disturbance_tf()
    system_data = read_system_dict();
    sys = create_system(system_data.state_space.around_T_0);
    G_w = tf(sys);