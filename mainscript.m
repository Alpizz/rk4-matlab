clc; clear; close all;

% Define ODE given in the question.
ode = @(t,y) (1+4.*t).*sqrt(y);

% Define initial condition, step size and range given in the question.
y0 = 1;
h = 0.25;
range = 0:h:1;

% Solve the ODE using 4th order Runge-Kutta method
y = rungeKutta4(ode, y0, h, range);

% Plot numerically calculated values from RK method
figure
movegui('west')
plot(range,y,"o-","MarkerSize",7,"LineWidth",1.25)
title('ODE Solution using RK4');
xlim([0 1])
xlabel("t");
ylabel("y(t)");
hold on

% Define and plot the analytical function (actual solution)
analyticalFun = @(x) ((2.*x.^2 + x + 2)./2).^2;
fplot(analyticalFun, "LineWidth",1)
legend("RK Solution", "Actual Solution",'FontSize', 12);
hold off;

% For the other figure, plot solutions for different step sizes
figure
movegui('east')
fplot(analyticalFun, "LineWidth",5,'Color','b')
title('Different Step Sizes');
hold on
xlim([0 1])
xlabel("t");
ylabel("y(t)");

% Define step size range to get a better understanding of the effect
% caused by changing the step size
step_range = 0.05:0.1:1;

legendstrings = cell(10,1);
legendstrings{1} = 'Actual Solution y(t)';
i = 2;

% Solve and plot using different step sizes
for stepsize = step_range
    range = 0:stepsize:1;
    y = rungeKutta4(ode, y0, stepsize, range);
    legendstrings{i}=sprintf('h = %.2f', stepsize); 
    plot(range,y,"o-","MarkerSize",3,"LineWidth",2)
    i = i+1;
end
legend(legendstrings, 'Location','northwest');
hold off
