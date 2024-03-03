% Define parameters
path.radius = 200; % Radius of curved sections
path.l_st = 900; % Length of straight sections
path.width = 15;

% Define points for the track

% First straight
theta1 = linspace(0, 0, 100); 
x1 = linspace(0, path.l_st, 100);
y1 = linspace(0, 0, 100);

% First curve
theta2 = linspace(3*pi/2, pi/2, 100); 
x2 = path.radius * -cos(theta2) + path.l_st; 
y2 = path.radius * sin(theta2) + path.radius;

% Second straight
theta3 = linspace(pi, pi, 100);
x3 = linspace(path.l_st, 0, 100);
y3 = linspace(2*path.radius, 2*path.radius, 100);

% Second curve
theta4 = linspace(pi/2, 3*pi/2, 100);
x4 = path.radius * cos(theta4);
y4 = path.radius * sin(theta4) + path.radius;

% Concatenate the coordinates for a continuous line
x_track = [x1, x2, x3, x4];
y_track = [y1, y2, y3, y4];

% Running the simulation
simout = sim("Team23_project2_final.slx", "StopTime", num2str(400));
carX = simout.X.Data;
carY = simout.Y.Data;
carPsi = simout.psi.Data;
simT = simout.tout;


% Plot the race track
figure;
plot(carX, carY, 'k');
hold on;

% Define parameters for the patch
patch_width = 2; % Width of the patch
patch_length = 4; % Length of the patch
initial_position = [0, 0]; % Initial position of the patch

% Plot the initial position of the patch
patch_vertices = [
    initial_position(1) - (1/2 * patch_width), initial_position(2);
    initial_position(1) + (1/2 * patch_width), initial_position(2);
    initial_position(1) + (1/2 * patch_width), initial_position(2) + patch_length;
    initial_position(1) - (1/2 * patch_width), initial_position(2) + patch_length
];

patch_handle = patch(patch_vertices(:, 1), patch_vertices(:, 2), 'r');

% Loop through the waypoints and update the patch position
for i = 1:length(x_track) - 1 % Fix: iterate up to length(x_track) - 1
    % Update patch position
    x_patch = (x_track(i) + x_track(i+1))/2;
    y_patch = (y_track(i) + y_track(i+1))/2;

    % Update patch rotation based on the tangent angle
    rotation_angle = atan2(y_track(i+1) - y_track(i), x_track(i+1) - x_track(i));
    rotate(patch_handle, [x_patch, y_patch, 0], rad2deg(rotation_angle));

    % Update patch vertices
    patch_vertices = [
        x_patch - (1/2 * patch_width), y_patch - (1/2 * patch_length);
        x_patch + (1/2 * patch_width), y_patch - (1/2 * patch_length);
        x_patch + (1/2 * patch_width), y_patch + (1/2 * patch_length);
        x_patch - (1/2 * patch_width), y_patch + (1/2 * patch_length)
    ];

    % Update patch position in the plot
    set(patch_handle, 'XData', patch_vertices(:, 1), 'YData', patch_vertices(:, 2));

    pause(0.1); % Adjust pause time as needed
end

hold off;

axis equal;
xlabel('X Position (m)');
ylabel('Y Position (m)');
title('Race Track with Vehicle Path');
grid on;

race = raceStat(carX, carY, simT, path)