function sol = p_5()
    %{
        Returns the solutions to problem 5
    %}
    sol = {};

    sys = sys_around_T_0();

    [sol.around_T_0.poles, sol.around_T_0.zeros, sol.around_T_0.k, sol.around_T_0.eigen_values] = p_5_returns(sys);

    sys = sys_around_U();

    [sol.around_U.poles, sol.around_U.zeros, sol.around_U.k, sol.around_U.eigen_values] = p_5_returns(sys);
    
    function [poles, zeros, k, eigen_values] = p_5_returns(sys)
        poles = pole(sys);
        zeros = zero(sys);
    
        k = dcgain(sys);
    
        eigen_values = eig(sys.A);
    end
end