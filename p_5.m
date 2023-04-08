function p_5()
    disp("Problem 5")

    system_data = read_system_dict();

    disp("System around T_0:")

    sys = create_system(system_data.state_space.around_T_0);

    [poles, zeros, k, eigen_values] = p_5_returns(sys)

    disp("System around U:")

    sys = create_system(system_data.state_space.around_U);

    [poles, zeros, k, eigen_values] = p_5_returns(sys)
    
    function [poles, zeros, k, eigen_values] = p_5_returns(sys)
        poles = pole(sys);
        zeros = zero(sys);
    
        k = dcgain(sys);
    
        eigen_values = eig(sys.A);
    end
end