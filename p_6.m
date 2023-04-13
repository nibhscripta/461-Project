function sol = p_6()
    sol = {};
 
    system_data = read_system_dict();

    sys = create_system(system_data.state_space.around_T_0);

    N = 1000;

    t_range = linspace(0, 100, N);

    u = -5 * ones(1, N);
    val_dict = {};
    [val_dict.y, val_dict.t] = lsim(sys, u, t_range);
    sol.minus_5K_step = val_dict;

    u = 5 * ones(1, N);
    val_dict = {};
    [val_dict.y, val_dict.t] = lsim(sys, u, t_range);
    sol.plus_5K_step = val_dict;

    u = 10 * ones(1, N);
    val_dict = {};
    [val_dict.y, val_dict.t] = lsim(sys, u, t_range);
    sol.plus_10K_step = val_dict;

    u = 20 * ones(1, N);
    val_dict = {};
    [val_dict.y, val_dict.t] = lsim(sys, u, t_range);
    sol.plus_20K_step = val_dict;

    C_As = system_data.steady_state.C_A;
    C_Ss = system_data.steady_state.C_A;
    T_s = system_data.steady_state.T;
    T_0s = system_data.steady_state.T_0;
    U_s = system_data.steady_state.U;

    t_range = linspace(0, 100, 100);

    step_size = 10;

    val_dict = {};
    [val_dict.t, val_dict.y] = ode23s(@non_linear_system_ode, t_range, [C_As C_Ss T_s], odeset(), U_s, T_0s+step_size);
    sol.non_linear_10K_step = val_dict;