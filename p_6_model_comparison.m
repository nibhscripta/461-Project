function p_6_model_comparison()
    disp("Compare linear and Non-linear models")

    system_data = read_system_dict();

    C_As = system_data.steady_state.C_A;
    C_Ss = system_data.steady_state.C_A;
    T_s = system_data.steady_state.T;
    T_0s = system_data.steady_state.T_0;
    U_s = system_data.steady_state.U;

    t_range = linspace(0, 100, 100);

    step_size = 10;

    % non-linear simulation
    [t_nonlinear, y_nonlinear] = ode23s(@non_linear_system_ode, t_range, [C_As C_Ss T_s], odeset(), U_s, T_0s+step_size);


    linear_sys = create_system(system_data.state_space.around_T_0);
    
    u = step_size * ones(1, 100);

    [y_linear, t_linear] = lsim(linear_sys, u, t_range);

    figure
    plot(t_nonlinear, y_nonlinear(:,3), t_linear, y_linear+T_s)
    grid on
    legend(["Non Linear", "Linear"], 'Location','best')
    xlabel("Time (hr)")
    ylabel("Temperature (K)")
    title("Non-Linear/Linear Model Response to +10K Step in T_0")

    