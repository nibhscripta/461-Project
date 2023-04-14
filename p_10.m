function sol = p_10()
    sol = {};

    project_solutions = read_solutions_dict();

    k_w = project_solutions.p_5.around_T_0.k;

    k_p = project_solutions.p_5.around_U.k;

    M = 1;

    k_c = -10;

    % disturbance sols

    disturbance_offset = @(k_c) -M * k_w / (1 + k_c * k_p);

    sol.disturbance_offset = disturbance_offset(k_c);

    G_p = Process_tf();
    G_w = Disturbance_tf();
    G_c = P_tf(k_c);

    G_disturbance = series(feedback(1, series(G_p, G_c)), G_w);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_disturbance);
    sol.disturbance_response = val_dict;

    dist_dict = {};
    dist_dict.denominator = G_disturbance.den;
    dist_dict.numerator = G_disturbance.num;

    sol.G_disturbance = dist_dict;

    % set point sols

    set_point_offset = @(k_c) M - M / (1 + k_c * k_p);

    sol.set_point_offset = set_point_offset(k_c);

    G_set_point = feedback(series(G_c, G_p), 1);

    sp_dict = {};
    sp_dict.denominator = G_set_point.den;
    sp_dict.numerator = G_set_point.num;

    sol.G_set_point = sp_dict;

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_set_point);
    sol.set_point_response = val_dict;

    % k_c plots

    sol.k_c_plots = {};

    sol.k_c_plots.set_point = {};

    sol.k_c_plots.disturbance = {};

    % disturbance plots

    G_c = P_tf(-1);

    G_disturbance = series(feedback(1, series(G_p, G_c)), G_w);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_disturbance);
    sol.k_c_plots.disturbance.minus_1 = val_dict;

    G_c = P_tf(1);

    G_disturbance = series(feedback(1, series(G_p, G_c)), G_w);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_disturbance);
    sol.k_c_plots.disturbance.plus_1 = val_dict;

    G_c = P_tf(-10);

    G_disturbance = series(feedback(1, series(G_p, G_c)), G_w);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_disturbance);
    sol.k_c_plots.disturbance.minus_10 = val_dict;

    G_c = P_tf(10);

    G_disturbance = series(feedback(1, series(G_p, G_c)), G_w);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_disturbance);
    sol.k_c_plots.disturbance.plus_10 = val_dict;

    % set point plots

    G_c = P_tf(-1);

    G_set_point = feedback(series(G_c, G_p), 1);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_set_point);
    sol.k_c_plots.set_point.minus_1 = val_dict;

    G_c = P_tf(1);

    G_set_point = feedback(series(G_c, G_p), 1);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_set_point);
    sol.k_c_plots.set_point.plus_1 = val_dict;

    G_c = P_tf(-10);

    G_set_point = feedback(series(G_c, G_p), 1);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_set_point);
    sol.k_c_plots.set_point.minus_10 = val_dict;

    G_c = P_tf(10);

    G_set_point = feedback(series(G_c, G_p), 1);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_set_point);
    sol.k_c_plots.set_point.plus_10 = val_dict;

    G_c = P_tf(0.001);

    G_set_point = feedback(series(G_c, G_p), 1);

    val_dict = {};
    [val_dict.y, val_dict.t] = step(G_set_point);
    sol.optimal_k_c = val_dict;
