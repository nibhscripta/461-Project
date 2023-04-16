function sol = p_6()
    %{
        Returns the solutions to problem 6
    %}
    
    sol = {};

    sys = sys_around_T_0;

    N = 1000;

    t_range = linspace(0, 100, N);

    % linear system step responses

    u = -5 * ones(1, N);
    [sol.minus_5K_step.y, sol.minus_5K_step.t] = lsim(sys, u, t_range);

    u = 5 * ones(1, N);
    [sol.plus_5K_step.y, sol.plus_5K_step.t] = lsim(sys, u, t_range);

    u = 10 * ones(1, N);
    [sol.plus_10K_step.y, sol.plus_10K_step.t] = lsim(sys, u, t_range);

    u = 20 * ones(1, N);
    [sol.plus_20K_step.y, sol.plus_20K_step.t] = lsim(sys, u, t_range);

    % nonlinear response

    C_As = 0.21167013796294581;
    C_Ss = 2.9999920948240835;
    T_s = 460.31823156995324;
    T_0s = 410;
    U_s = 14656.0;

    step_size = 10;

    [sol.non_linear_10K_step.t, sol.non_linear_10K_step.y] = ode23s(@non_linear_system_ode, t_range, [C_As C_Ss T_s], odeset(), U_s, T_0s+step_size);