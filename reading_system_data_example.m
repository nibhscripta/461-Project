clearvars; close all; clc;

% retrieve data from file by calling the function
system_data = read_system_dict();


% there are four sets of system paramaters

system_parameters = system_data.parameters; % constants and general paramters
system_inlet = system_data.inlet; % inlet conditions
system_steady_state = system_data.steady_state; % calculated steady state values 
system_state_space = system_data.state_space; % state space description of the linearized system

% accessing values

% example C_S0

C_S0 = read_system_dict().inlet.C_S0

% example steady state temperature

T_s = read_system_dict().steady_state.T

% example A matrix

A = read_system_dict().state_space.A