close all; clc;

% Import function
addpath('./library');

J = eye(2);

M = [ 0.5 0.05; 0.05 0.5];
B = [ 4 0; 0 2];

% Robot parameters
Kp = [2 0; 0 2];
ki = [4 0; 0 4];

% Organe parameters
ke = [10 0; 0 10];
kc = [0.5 0; 0 0.5];

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