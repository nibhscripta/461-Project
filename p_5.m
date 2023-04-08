function p_5()
    system_data = read_system_dict();

    A = system_data.state_space.around_T_0.A;
    b = system_data.state_space.around_T_0.b;
    c = system_data.state_space.around_T_0.c;
    d = system_data.state_space.around_T_0.d;

    sys = ss(A, b, c, d);

    display("System around T_0:")

    poles = pole(sys)
    zeros = zero(sys)

    k = -c * A^-1 * b + d