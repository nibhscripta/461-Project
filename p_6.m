clearvars; clc; close all;

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
U_s = 14656.0e-3;

step_size = 10;

[sol.non_linear_10K_step.t, sol.non_linear_10K_step.y] = ode23s(@non_linear_system_ode, t_range, [C_As C_Ss T_s], odeset(), U_s, T_0s+step_size);

% Plotting

figure
plot(sol.minus_5K_step.t, sol.minus_5K_step.y, sol.plus_5K_step.t, sol.plus_5K_step.y, sol.plus_10K_step.t, sol.plus_10K_step.y, sol.plus_20K_step.t, sol.plus_20K_step.y, "LineWidth", 1.5)
grid on
legend(["-5K Step", "+5K Step", "+10K Step", "+20K Step"], "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 6 Linear Step Responses")

figure
plot(sol.plus_10K_step.t, sol.plus_10K_step.y+460.318, sol.non_linear_10K_step.t, sol.non_linear_10K_step.y(:,3), "LineWidth", 1.5)
grid on
legend(["Linear", "Non-Linear"], "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 6 Model Comparison")