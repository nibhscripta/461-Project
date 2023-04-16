function sol = p_10()
    %{
        Returns the solutions to problem 10
    %}
    
    sol = {};


    % offset calculation

    k_w = dcgain(sys_around_T_0());
    k_p = dcgain(sys_around_U());
    M = 1;
    k_c = -10;

    disturbance_offset = @(k_c) -M * k_w / (1 + k_c * k_p);

    sol.disturbance_offset = disturbance_offset(k_c);

    % disturbance plots (T_0)

    k_c = -1;
    G = G_loop_P(k_c);
    [sol.k_c_plots.disturbance.minus_1.y, sol.k_c_plots.disturbance.minus_1.t] = step(G);

    k_c = 1;
    G = G_loop_P(k_c);
    [sol.k_c_plots.disturbance.plus_1.y, sol.k_c_plots.disturbance.plus_1.t] = step(G);


    k_c = -10;
    G = G_loop_P(k_c);
    [sol.k_c_plots.disturbance.minus_10.y, sol.k_c_plots.disturbance.minus_10.t] = step(G);

    k_c = 10;
    G = G_loop_P(k_c);
    [sol.k_c_plots.disturbance.plus_10.y, sol.k_c_plots.disturbance.plus_10.t] = step(G);