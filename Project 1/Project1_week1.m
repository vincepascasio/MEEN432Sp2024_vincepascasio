% Initial Conditions 
w_0 = 1.0; % Initial Angular Velocity [rad/s]
J = 1; % Rotational Inertia [kg-m^2]
b = 1; % Damping Coefficient [N-m-s/rad]
A = 4; % Constant Applied Torque [N-m]

dT = [0.001, 0.1, 1]; % Time Step [s]
solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]

% Iterating through and plotting the time steps and solver combinations
for n = 1:length(dT)
    for m = 1:length(solver)
        simout = sim("P1_demo.slx","Solver",solver(m),"FixedStep",string(dT(n)));

        % Getting data
        W = simout.w.Data;
        W_DOT = simout.w_dot.Data;
        T = simout.tout;
        
        % Plots
        figure;
        subplot(2,1,1);
        plot(T,W);
        title(['Angular Velocity (Solver:' solver(m) 'TimeStep:' string(dT(n)) 's']);
        subplot(2,1,2);
        plot(T,W_DOT);
        title(['Angular Acceleration (Solver: ' solver(m) 'TimeStep:' string(dT(n)) 's']);
    end
end    