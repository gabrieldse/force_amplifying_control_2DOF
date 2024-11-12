close all; clc;

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
ke = [10 0; 0 10]; % Matrice raideur de l'environemment
kc = [0.5 0; 0 0.5]; % Matrice d'amortissement de l'environemment


% Effort apliqué
w0 = [0 ; 0]; % Effort initiale de l'utilisateur
wu = [0.5; 0.7]; % Effort de l'utilisateur
we = [0.5; 0.5]; % Effort de reaction de l'organe

%% PLOT
% example of plot of the model
step = 1/20;
duration = 5;
t = linspace(0,duration,duration/step);
for i=0:step:duration
    cla;
    x = i/10;
    y = i/10;
    plot_prismatic_robot(x, y,0.5,0.7,0.05)
    %pause(0.1);
    drawnow;

end