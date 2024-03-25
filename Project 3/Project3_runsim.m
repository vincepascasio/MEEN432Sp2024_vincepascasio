%% Urban
run('init.m');
run('init_URB_DriveCycle.m');
DriveData = DriveData_urban;
Time_urb = 1369;
simout_urb = sim("Project3_model.slx",'StopTime', num2str(Time_urb));
sim_vel_urb = simout_urb.vel.Data;
sim_time_urb = simout_urb.tout;

figure;
plot(sim_time_urb, sim_vel_urb*(1/mph2mps), 'b') % Remember, drive cycles are mph
hold on
plot(Time, DriveData, '--r') 
plot(Time, (DriveData)+3, 'k') 
plot(Time, (DriveData)-3, 'k') 
xlabel("Time (s)")
ylabel("Velocity (mph)") 
legend("Sim Velocity", "Drive Cycle Velocity", "3 mph Error Band")
title("Simulated Vehicle Velocity vs Time for Urban Cycle")
hold off

%% Highway
clearvars -except simout_urb sim_vel_urb sim_time_urb;

run('init.m');
run('init_HWY_DriveCycle.m');
DriveData = DriveData_Hwy;
Time_hwy = 765;
simout_hwy = sim("Project3_model.slx",'StopTime', num2str(Time_hwy));
sim_vel_hwy = simout_hwy.vel.Data;
sim_time_hwy = simout_hwy.tout;

figure;
plot(sim_time_hwy, sim_vel_hwy*(1/mph2mps), 'b') % Remember, drive cycles are mph
hold on
plot(Time, DriveData, '--r') 
plot(Time, (DriveData)+3, 'k') 
plot(Time, (DriveData)-3, 'k') 
xlabel("Time (s)")
ylabel("Velocity (mph)") 
legend("Sim Velocity", "Drive Cycle Velocity", "3 mph Error Band")
title("Simulated Vehicle Velocity vs Time for Highway Cycle")
hold off

% For seeing how large the errors are
% error = zeros(length(Time),1);
% for j = 1:length(Time)
%     time_dc = Time(j);
%     vel_dc = DriveData(j);
%     for i = 1:length(sim_time)
%         time_s = sim_time(i);
%         vel_s = sim_vel(i);
% 
%         if time_s == time_dc
%             err = vel_dc - vel_s;
%             error(j) = err;
%         else
%         end
%     end
% end