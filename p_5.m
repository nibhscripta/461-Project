clearvars; close all; clc;
%{
    Returns the solutions to problem 5
%}
disp("System around T_0")
sys = tf(sys_around_T_0())

p_5_returns(sys);

disp("System around U")
sys = tf(sys_around_U())

p_5_returns(sys);

function [poles, zeros, k, eigen_values] = p_5_returns(sys)
    poles = pole(sys)
    zeros = zero(sys)

    k = dcgain(sys)

    eigen_values = eig(ss(sys).A)
end