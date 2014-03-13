%% Dynamical Systems modelling - Lotka-Volterra
% Authored by Lianne Meah
% Last modified 13/13/2014

%% CLEANING
clear all
clc

%% PARAMETER SETUP
% step size
dt = 0.001;
% max time limit
seconds = 20; 
% for the loop
iterations = ceil(seconds/dt); 
% forp plotting
time = 0:dt:seconds;

%% POPULATIONS
% prey
x_pop = zeros(1,iterations)+1;
% predators 
y_pop = zeros(1,iterations)+1;

% initialise the first entry
x_pop(1,1) = 1; 
y_pop(1,1) = 1; 

a = 0.8; %1.2
b = 0.8; %0.6
c = 1.2; %0.8
d = 0.4; %0.8

for i = 1:iterations
    % update populations according to numerical solution
    x_pop(1,i+1) = x_pop(1,i) + (x_pop(1,i)*(a - b*y_pop(1,i)))*dt;
    y_pop(1,i+1) = y_pop(1,i) + (y_pop(1,i)*(d*x_pop(1,i)-c))*dt;
end

% plot populations against time
figure(4)
plot(time, x_pop, '--k')
hold on
plot(time, y_pop, '-k')
hleg1 = legend('prey','predators');
set(hleg1,'Location','NorthEast')
xlabel('time (s)')
ylabel('number of individuals')
line1 = sprintf('Population dynamics over time with dt = %.4f', dt);
line2 = sprintf('a = %.1f, b=%.1f, c=%.1f and d=%.1f', a,b,c,d);
title({line1, line2})
% plot system dynamics in the phase plane
figure(5)
plot(x_pop, y_pop, '-k')
xlabel('prey population')
ylabel('predator population')
title('system dynamics in the phase plane')