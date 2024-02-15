% Define parameters
radius_curved = 200; % Radius of curved sections
length_straight = 900; % Length of straight sections
track_width = 15;

% Define points for the track
theta3 = linspace(pi, 2*pi, 100); % Curved section 1
x2 = radius_curved * cos(theta3) + radius_curved; % Adjusted for starting position
y2 = radius_curved * sin(theta3); % Adjusted for starting position

x1 = ones(1, 100) * (2 * radius_curved); % Straight section 1
y1 = linspace(0, 0, 100); % make these constant

theta1 = linspace(0, pi, 100); % Curved section 2
x4 = radius_curved * cos(theta1) + radius_curved; % Adjusted for starting position
y4 = radius_curved * sin(theta1) + length_straight; % Adjusted for starting position

x3 = zeros(1, 100); % Straight section 2
y3 = linspace(0, 400, 100); % make these constant

% Concatenate the coordinates for a continuous line
x_track = [x2, x1, x4, x3]; % change coordinates
y_track = [y2, y1, y4, y3];

% Plot the race track
figure;
plot(x_track, y_track, 'k', 'LineWidth', track_width);
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