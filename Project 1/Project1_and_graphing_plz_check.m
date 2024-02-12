% Initial Conditions arrays
w0_a = [10.0, 0.0]; % Initial Angular Velocity [rad/s]
J_a = [100, 0.01]; % Rotational Inertia [kg-m^2]
b_a = [10, 0.1]; % Damping Coefficient [N-m-s/rad]
A_a = [0.0, 100]; % Constant Applied Torque [N-m]
freq_a = [0.1, 100]; % Frequency for sinusodial 

dT_a = [0.001, 0.1, 1]; % Time Step [s]
fix_solv_a = ["ode1", "ode4"]; % Fixed Time Step Solver
var_solv_a = ["ode45", "ode23tb"]; % Variable Time Step Solver

% CPU time
simout_a = {};
solver_a = {};
cputime_a = {};
cputime_simulation = [];
timestep = [];
solver = [];
simout = [];
eigen_plot = [];

% Sinusoidal/Constant and Fixed/Variable Checker
sin_check_a = [0,1]; % check if applied torque is sinusodial or constant
var_check_a = [0,1]; % check if time step is variable or fixed

% Time variable check
for i = 1:length(var_check_a)
    var_check = var_check_a(i);

    % Fixed Time
    if (var_check == 0)

        % Going through time steps
        for j = 1:length(dT_a)
            dT = dT_a(j);

            % Going through constant and sinusoidal applied torques
            for k = 1:length(sin_check_a)
                sin_check = sin_check_a(k);

                % Constant applied torque
                if (sin_check == 0)

                    % freq = 0 because applied torque is constant
                    freq = 0;

                    % Going through applied torques
                    for l = 1:length(A_a)
                        A = A_a(l);

                        % Going through damping coefficients
                        for m = 1:length(b_a)
                            b = b_a(m);

                            % Going through roational inertia
                            for n = 1:length(J_a)
                                J = J_a(n);
                                eigen = -1*b/J;

                                % Going through angular velocity
                                for o = 1:length(w0_a)
                                    w0 = w0_a(o);

                                    % Calculating cpu time before sim
                                    cputime_before = cputime;

                                    % Simulation
                                    simout = sim("Project1_wk2.slx", "Solver", fix_solv_a,"FixedStep",string(dT));

                                    % Calculating cpu time after sim
                                    cputime_after = cputime;

                                    % Simulation data collection
                                    simout_a = cat(1, simout_a, simout);
                                    solver_a = cat(1, solver_a, simout.SimulationMetadata.ModelInfo.SolverInfo);

                                    % cpu data collection
                                    cputime_sim = cputime_after - cputime_before;
                                    cputime_a = cat(1, cputime_a, cputime_sim);                                 

                                end
                            end
                        end
                    end
                    cputime_simulation = [cputime_simulation, cputime_sim];
                    timestep = [timestep, dT];
                    simout = [simout,simout_a]
                    solver = [solver, solver_a]
                    eigen_plot = [eigen_plot, eigen];
                    fprintf('Timestep x %.4f\n', timestep);
                    fprintf('CPU Time %.4f\n', cputime_simulation);

                % Sinusodial applied torque
                else 
                    A = A_a(2);

                    % Going through the frequencies
                    for p = 1:length(freq_a)
                        freq = freq_a(p);

                        % Going through the damping coefficients
                        for q = 1:length(b_a)
                            b = b_a(q);
                            
                            % Going through rotational inertia
                            for r = 1:length(J_a)
                                J = J_a(r);

                                % Going through angular velocity
                                for s = 1:length(w0_a)
                                    w0 = w0_a(s);

                                    % Calculating cpu time before sim
                                    cputime_before = cputime;

                                    % Simulation
                                    simout = sim("Project1_wk2.slx", "Solver", fix_solv_a,"FixedStep",string(dT));

                                    % Calculating cpu time after sim
                                    cputime_after = cputime;

                                    % Simulation data collection
                                    simout_a = cat(1, simout_a, simout);
                                    solver_a = cat(1, solver_a, simout.SimulationMetadata.ModelInfo.SolverInfo);

                                    % cpu data collection
                                    cputime_sim = cputime_after - cputime_before;
                                    cputime_a = cat(1, cputime_a, cputime_sim);
         

                                end
                            end
                        end
                    end
                end
            end
        end
        cputime_simulation = [cputime_simulation, cputime_sim];
        timestep = [timestep, dT];
        simout = [simout,simout_a]
        solver = [solver, solver_a]
        fprintf('Timestep y  %.4f\n', timestep);
        fprintf('CPU Time %.4f\n', cputime_simulation);


            % Variable Time
    else
        solver = var_solv_a;

        % Going through constant and sinusoidal applied torques
        for k = 1:length(sin_check_a)
            sin_check = sin_check_a(k);

            % Constant applied torque
            if (sin_check == 0)

                % freq = 0 because applied torque is constant
                freq = 0;

                % Going through applied torques
                for l = 1:length(A_a)
                    A = A_a(l);

                    % Going through damping coefficients
                    for m = 1:length(b_a)
                        b = b_a(m);

                        % Going through roational inertia
                        for n = 1:length(J_a)
                            J = J_a(n);
                            eigen = -1*b/J;

                            % Going through angular velocity
                            for o = 1:length(w0_a)
                                w0 = w0_a(o);

                                % Calculating cpu time before sim
                                cputime_before = cputime;

                                % Simulation
                                simout = sim("Project1_wk2.slx", "Solver", var_solv_a,"VariableStep");

                                % Calculating cpu time after sim
                                cputime_after = cputime;

                                % Simulation data collection
                                simout_a = cat(1, simout_a, simout);
                                solver_a = cat(1, solver_a, simout.SimulationMetadata.ModelInfo.SolverInfo);

                                % cpu data collection
                                cputime_sim = cputime_after - cputime_before;
                                cputime_a = cat(1, cputime_a, cputime_sim);
                                


                            end
                        end
                    end
                end
                cputime_simulation = [cputime_simulation, cputime_sim];
                timestep = [timestep, dT];
                eigen_plot = [eigen_plot, ]
                fprintf('Timestep %.4f\n', timestep);
                fprintf('CPU Time %.4f\n', cputime_simulation);

                % Sinusodial applied torque
            else
                A = A_a(2);

                % Going through the frequencies
                for p = 1:length(freq_a)
                    freq = freq_a(p);

                    % Going through the damping coefficients
                    for q = 1:length(b_a)
                        b = b_a(q);

                        % Going through rotational inertia
                        for r = 1:length(J_a)
                            J = J_a(r);

                            % Going through angular velocity
                            for s = 1:length(w0_a)
                                w0 = w0_a(s);

                                % Calculating cpu time before sim
                                cputime_before = cputime;

                                % Simulation
                                simout = sim("Project1_wk2.slx", "Solver", var_solv_a,"VariableStep");

                                % Calculating cpu time after sim
                                cputime_after = cputime;

                                % Simulation data collection
                                simout_a = cat(1, simout_a, simout);
                                solver_a = cat(1, solver_a, simout.SimulationMetadata.ModelInfo.SolverInfo);

                                % cpu data collection
                                cputime_sim = cputime_after - cputime_before;
                                cputime_a = cat(1, cputime_a, cputime_sim);
                                
                            end
                        end
                    end
                end
                cputime_simulation = [cputime_simulation, cputime_sim];
                timestep = [timestep, dT];
                simout = [simout,simout_a]
                solver = [solver, solver_a]
                fprintf('Timestep  z %.4f\n', timestep);
                fprintf('CPU Time %.4f\n', cputime_simulation);
            end
        end
    end
end
fprintf(cputime_sim);
fprintf(cputime_a);

%finding Max Simulation Error
sim_speed = simout;
theo_speed = solver;
errors = abs(sim_speed-theo_speed);
MSE = max(errors);

%Plotting Timestep V Cpu time
x = timestep;
y = cputime_a;
xlabel('Timestep [sec]')
ylabel('CPU time [sec]')
title('CPU Time V.s. Time Step')
plot(x,y)

%Plotting Simulation Error V Timestep
x2 = dT_a;
y2 = MSE;
xlabel('Timestep [sec]')
ylabel('Max Simulation Error [%]')
title('Max Simulation Error V.s. Time Step')
plot(x2,y2)

%Plotting Simulation Error V CPU time 
x3 = cputime_simulation;
y3 = MSE;
xlabel('CPU Time [sec]')
ylabel('Max Simulation Error [%]')
title('Max Simulation Error V.s. CPU Time')
plot(x3,y3)


