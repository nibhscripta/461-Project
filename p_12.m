clearvars; close all; clc;

k_c = -100;
tau_I = 0.7;

linear_sys = G_loop_PI(k_c, tau_I);

ss_init = [0.21167013796294581 2.9999920948240835 460.31823156995324 0];

T_0s = 410;
U_s = 14656.0e-3;
T_sp = ss_init(3);


step_sizes = [5 10 20];

[y_linear, t_linear] = step(linear_sys);

figure
hold on
for i = 1:length(step_sizes)
    step_size = step_sizes(i);
    [t_non_linear, y_non_linear] = ode23s(@non_linear_w_PI, t_linear, ss_init, odeset(), U_s, T_0s+step_size, T_sp, k_c, tau_I);
    plot(t_non_linear, y_non_linear(:,3), t_linear, (step_size*y_linear)+ss_init(3), "--", "LineWidth", 1.5)
end
grid on
legend(["Non Linear +5 step", "Linear +5 step", "Non Linear +10 step", "Linear +10 step", "Non Linear +20 step", "Linear +20 step"], "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 12 Model Comparison")
hold off

set_points = [-5 -1 1 5];

figure
hold on
for i = 1:length(set_points)
    sp = set_points(i);
    [t_non_linear, y_non_linear] = ode23s(@non_linear_w_PI, t_linear, ss_init, odeset(), U_s, T_0s, T_sp+sp, k_c, tau_I);
    plot(t_non_linear, y_non_linear(:,3), "LineWidth", 1.5)
    leg(i) = sp+" K set point change";
end
grid on
legend(leg, "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 12 Non Linear Model Set Point Tracking")
hold off
