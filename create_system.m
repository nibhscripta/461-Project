function sys = create_system(state_space_dict)
    A = state_space_dict.A;
    b = state_space_dict.b;
    c = state_space_dict.c;
    d = state_space_dict.d;
    
    sys = ss(A, b, c, d);