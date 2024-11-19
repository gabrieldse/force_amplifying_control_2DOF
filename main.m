close all; clc; clear all;

% Import function
addpath('./library');

J = eye(2);

M = [ 0.5 0.05; 0.05 0.5];
Beta = 0.4*eye(2);
B = [ 4 0; 0 2];

% Robot parameters
kp = [2 0; 0 2]; % Gain correcteur Proportionnel
ki = [4 0; 0 4]; % Gain correcteur Integrateur

% Organe parameters
ke = [1 0; 0 1]; % Matrice raideur de l'environemment
kc = [0.05 0; 0 0.05]; % Matrice d'amortissement de l'environemment
% ke = [100 0; 0 100]; % Matrice raideur de l'environemment
% kc = [5 0; 0 5]; % Matrice d'amortissement de l'environemment

%Position du centre d'organe
xo = [0.7;0.5];
ro = 0.15; %rayon d'organe (m)

%Position initialle robot
x = [0.45;0];

% Effort apliqué
w0 = [0 ; 0]; % Effort initiale de l'utilisateur
wu = [0.5; 0.7]; % Effort de l'utilisateur
we = [0.5; 0.5]; % Effort de reaction de l'organe

out = sim("Simulink/rest");
sim_time = out.get('tout');
pos = out.get("position");

% out = sim ('effort');
% pos = out.get('coordene');
% tcomp = out.get('tout');

%% PLOT
% example of plot of the model
step = 0;
% t = linspace(0,sim_time,108);
for i=1:1:length(pos)
    cla;
    x(1) = pos(1,1,i);
    x(2) = pos(2,1,i);
    plot_prismatic_robot(x,xo,ro)
    %pause(0.1);
    drawnow;

end