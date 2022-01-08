function y = rungeKutta4(ode, y0, h, range)
% rungeKutta4  Solves ODE using 4th order Runge-Kutta method.
%   y = rungeKutta4(ode, y0, h, range) solves the 
% given ODE with given initial condition y0, step size h and range.


% Get range from function input
T = range;

% Allocate output array of corresponding y values from RK
y = zeros(1,length(T));
% Get initial condition from input y(0)
y(1) = y0;

% Define the differential equation given in the question

F_dydt = ode;
% Main for loop for the Runge-Kutta method to solve the ODE above
for i = 1:(length(T)-1)
    % Calculate coefficients (4th order)
    k1 = h.*F_dydt(T(i),y(i));
    k2 = h.*F_dydt(T(i)+0.5*h,y(i)+0.5.*k1);
    k3 = h.*F_dydt((T(i)+0.5.*h),(y(i)+0.5.*k2));
    k4 = h.*F_dydt((T(i)+h),(y(i)+k3));

    % Calculate the value and store it in the array
    y(i+1) = y(i) + (1./6).*(k1+2.*k2+2.*k3+k4);
end
end