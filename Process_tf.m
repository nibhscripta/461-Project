function G_p = Process_tf()
    system_data = read_system_dict();
    sys = create_system(system_data.state_space.around_U);
    G_p = tf(sys);