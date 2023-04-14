function sol = p_5()
    sol = {};

    system_data = read_system_dict();


    sys = create_system(system_data.state_space.around_T_0);

    val_dict = {};
    [val_dict.poles, val_dict.zeros, val_dict.k, val_dict.eigen_values] = p_5_returns(sys);
    sol.around_T_0 = val_dict;

    sys = create_system(system_data.state_space.around_U);

    [val_dict.poles, val_dict.zeros, val_dict.k, val_dict.eigen_values] = p_5_returns(sys);
    sol.around_U = val_dict;
    
    function [poles, zeros, k, eigen_values] = p_5_returns(sys)
        poles = pole(sys);
        zeros = zero(sys);
    
        k = dcgain(sys);
    
        eigen_values = eig(sys.A);
    end
end