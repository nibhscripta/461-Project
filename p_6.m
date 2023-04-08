function p_6()
    disp("Problem 6")

    system_data = read_system_dict();

    sys = create_system(system_data.state_space.around_T_0);

    N = 100;

    t_range = linspace(0, 100, N);

    u_minus_5 = -5 * ones(1, N);
    u_plus_5 = 5 * ones(1, N);
    u_plus_10 = 10 * ones(1, N);
    u_plus_20 = 20 * ones(1, N);

    plot_response(sys, u_minus_5, t_range, "-5K")
    plot_response(sys, u_plus_5, t_range, "+5K")
    plot_response(sys, u_plus_10, t_range, "+10K")
    plot_response(sys, u_plus_20, t_range, "+20K")

function plot_response(sys, u, t, type)
    [t, y] = lsim(sys, u, t);
    figure
    plot(y, t)
    xlabel("Time (hr)")
    ylabel("Temperature (K)")
    title("Response to a Step of "+type+" in T_0")