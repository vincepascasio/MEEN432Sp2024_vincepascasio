% Initial Conditions 
w_0 = [10, 0]; % Initial Angular Velocity [rad/s]
J = [100, 0.01]; % Rotational Inertia [kg-m^2]
b = [10, 0.1]; % Damping Coefficient [N-m-s/rad]
A = [0, 100]; % Constant Applied Torque [N-m]

dT = [0.001, 0.1, 1]; % Time Step [s]
solver = ["ode1", "ode4", "ode45", "ode23tb"]; % Euler and Runge Kutta Solvers

% Allocate arrays to store results
cpuTimes = zeros(length(dT), length(solver));
maxErrors = zeros(length(dT), length(solver));

% Iterating through and plotting the time steps and solver combinations
for n = 1:length(dT)
    for m = 1:length(solver)
        tic; % Start measuring CPU time

        % Run simulation
        simout = sim("Week2.slx","Solver",solver(m),"FixedStep",string(dT(n)), "SaveTime", "on");
        
        % Stop measuring CPU time
        cpuTimes(n, m) = toc;

        % Getting data
        W = simout.w.Data;
        W_DOT = simout.w_dot.Data;
        T = simout.tout;
        
        % Save signals to workspace
        assignin('base', ['W_', num2str(n), '_', num2str(m)], W);
        assignin('base', ['W_DOT_', num2str(n), '_', num2str(m)], W_DOT);
        assignin('base', ['T_', num2str(n), '_', num2str(m)], T);

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