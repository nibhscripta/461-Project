%%%%%%%%%% Increasing tau_I plot %%%%%%%%%%%%%%%
% arbitrary controller parameters
k_c = -2;
tau_I = 0.5;

% Define increasing range of tau_I values to plot
tau_I_range_incr = 0.5:0.5:5;

% Initialize arrays to store step response data
t = 0:0.01:50;
y = zeros(length(t), length(tau_I_range_incr));

% Loop over tau_I values and simulate step response
for i = 1:length(tau_I_range_incr)
    tau_I = tau_I_range_incr(i);
    G_closed_loop = G_loop_PI(k_c,tau_I);
    [y(:,i), ~, ~] = step(G_closed_loop, t);
end

% Plot step response as tau_I is increased
figure();
plot(t, y);
xlabel('Time (s)');
ylabel('Output');
legend(string(tau_I_range_incr));

%%%%%%%%%% Decreasing tau_I plot %%%%%%%%%%%%%%%

% Define range of decreasing tau_I values to plot
tau_I_range_decr = 5:-0.5:0.5;

% Initialize arrays to store step response data
t = 0:0.01:50;
y = zeros(length(t), length(tau_I_range_decr));

% Loop over tau_I values and simulate step response
for i = 1:length(tau_I_range_decr)
    tau_I = tau_I_range_decr(i);
    G_closed_loop = G_loop_PI(k_c,tau_I);
    [y(:,i), ~, ~] = step(G_closed_loop, t);
end

% Plot step response as tau_I is decreased
figure();
plot(t, y);
xlabel('Time (s)');
ylabel('Output')
legend(string(tau_I_range_decr));

%%%%% Find the "best values" of kc and tau_I %%%%%%%%%%%%%%%%%

% Define desired performance requirements
settling_time = 3;   % seconds
overshoot = 10;      % percent
steady_state_error = 0.01;

% Initialize search range for kc and tau_I
kc_range = linspace(-10, 10, 21);
tau_I_range = linspace(0.1, 10, 20);

% Initialize arrays to store step response data
t = 0:0.01:50;
y = zeros(length(t), length(kc_range), length(tau_I_range));

% Loop over kc and tau_I values and simulate step response
for i = 1:length(kc_range)
    for j = 1:length(tau_I_range)
        kc = kc_range(i);
        tau_I = tau_I_range(j);
        G_closed_loop = G_loop_PI(k_c,tau_I);
        y(:,i,j) = step(G_closed_loop, t);
        
        % Calculate step response metrics
        info = stepinfo(G_closed_loop);
        settling_time_error(i,j) = abs(info.SettlingTime - settling_time);
        overshoot_error(i,j) = abs(info.Overshoot - overshoot);
        steady_state_error(i,j) = abs(y(end,i,j)-1);
    end
end

% Find values of kc and tau_I that minimize the error metrics
[~, ind] = min(settling_time_error + overshoot_error + steady_state_error, [], 'all', 'linear');
[ind_kc, ind_tau_I] = ind2sub(size(settling_time_error + overshoot_error + steady_state_error), ind);

% Plot step response for the best values of kc and tau_I
kc_best = kc_range(ind_kc);
tau_I_best = tau_I_range(ind_tau_I);
G_closed_loop = G_loop_PI(kc_best,tau_I_best);
y_best = step(G_closed_loop, t);

figure();
plot(t, y_best);
xlabel('Time (s)');
ylabel('Output');
title(['Best step response (kc = ' num2str(kc) ', tau_I = ' num2str(tau_I) ')']);
