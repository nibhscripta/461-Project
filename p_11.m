clearvars; clc; close all;

k_c_vals = linspace(-2, -100, 10);

tau_I_vals = linspace(0.1, 10, 10);

figure
hold on
for i = 1:5
    [y, t] = step(G_loop_PI(k_c_vals(i), 0.5));
    plot(t, y, "LineWidth", 1.5)
    leg(i) = "k_c="+round(k_c_vals(i), 1);
end
legend(leg, "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 11 Closed Loop PI Descending k_c")
grid on
hold off

figure
hold on
for i = 1:5
    [y, t] = step(G_loop_PI(k_c_vals(i+5), 0.5));
    plot(t, y, "LineWidth", 1.5)
    leg(i) = "k_c="+round(k_c_vals(i+5), 1);
end
legend(leg, "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 11 Closed Loop PI Descending k_c")
grid on
hold off

figure
hold on
for i = 1:5
    [y, t] = step(G_loop_PI(-100, tau_I_vals(i)));
    plot(t, y, "LineWidth", 1.5)
    leg(i) = "\tau_I="+round(tau_I_vals(i), 1);
end
legend(leg, "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 11 Closed Loop PI Descending \tau_I")
grid on
hold off

figure
hold on
for i = 1:5
    [y, t] = step(G_loop_PI(-100, tau_I_vals(i+5)));
    plot(t, y, "LineWidth", 1.5)
    leg(i) = "\tau_I="+round(tau_I_vals(i+5), 1);
end
legend(leg, "Location", "best")
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 11 Closed Loop PI Descending \tau_I")
grid on
hold off

figure
best_k_c = -100;
best_tau_I = 0.7;
[y, t] = step(G_loop_PI(best_k_c, best_tau_I));
plot(t, y, "LineWidth", 1.5)
xlabel("Time (hr)")
ylabel("Temperatur (K)")
title("Problem 11 Closed Loop PI Best k_c and \tau_I")
legend("k_c="+best_k_c+", \tau_I="+best_tau_I)
grid on