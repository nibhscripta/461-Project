clearvars; close all; clc;


%{
    Returns the solutions to problem 10
%}

sol = {};

% offset calculation

k_w = dcgain(sys_around_T_0());
k_p = dcgain(sys_around_U());
M = 1;
k_c = -10;

disturbance_offset = @(k_c) -M * k_w / (1 + k_c * k_p);

sol.disturbance_offset = disturbance_offset(k_c)

% disturbance plots (T_0)

k_c = -1;
G = G_loop_P(k_c);
[sol.minus_1.y, sol.minus_1.t] = step(G);

k_c = 1;
G = G_loop_P(k_c);
[sol.plus_1.y, sol.plus_1.t] = step(G);


k_c = -10;
G = G_loop_P(k_c);
[sol.minus_10.y, sol.minus_10.t] = step(G);

k_c = 10;
G = G_loop_P(k_c);
[sol.plus_10.y, sol.plus_10.t] = step(G);

figure
plot( ...
sol.minus_1.t, sol.minus_1.y, ...
sol.plus_1.t, sol.plus_1.y, ...
sol.minus_10.t, sol.minus_10.y, "LineWidth", 1.5...
)
grid on
legend(["k_c=-1", "k_c=+1", "k_c=-10"], "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 10 Closed Loop P-Only")

figure
plot(sol.plus_10.t, sol.plus_10.y, "LineWidth", 1.5)
grid on
legend("k_c=+10", "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 10 Closed Loop P-Only")

k_c = -1000;
G = G_loop_P(k_c);
[sol.best_k_c.y, sol.best_k_c.t] = step(G);

figure
plot(sol.best_k_c.t, sol.best_k_c.y, "LineWidth", 1.5)
grid on
legend("Best k_c", "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 10 Closed Loop P-Only Best k_c")
