clearvars; clc; close all;

disp("Factorize the transfer function around T_0")
% factorization
linear_sys = tf(sys_around_T_0())

fact_sys = tf(minreal(linear_sys))

% Check vs. p6 linear

[y_linear, t_linear] = step(linear_sys);
[y_fact, t_fact] = step(fact_sys);

figure
plot(t_fact, y_fact, t_linear, y_linear, "--", "LineWidth", 2)
grid on
legend(["Factorized","Linear"], 'Location','best')
xlabel("Time (hr)")
ylabel("Temperature (K)")
title("Linear Model vs. Factorized Function for T_0")

disp("Factorize the transfer function around U")
% factorization
linear_sys = tf(sys_around_U())

fact_sys = tf(minreal(linear_sys))

% Check vs. p6 linear

[y_linear, t_linear] = step(linear_sys);
[y_fact, t_fact] = step(fact_sys);

figure
plot(t_fact, y_fact, t_linear, y_linear, '--', "LineWidth", 2)
grid on
legend(["Factorized","Linear"], 'Location','best')
xlabel("Time (hr)")
ylabel("Temperature (K)")
title("Linear Model vs. Factorized Function for U")