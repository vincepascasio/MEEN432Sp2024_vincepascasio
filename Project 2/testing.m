% Define parameters
radius_curved = 200; % Radius of curved sections
length_straight = 900; % Length of straight sections
track_width = 15;

% Define points for the track

theta3 = linspace(pi, 2*pi, 100); % Curved section 1
x1 = radius_curved * cos(theta3) + radius_curved; % Adjusted for starting position
y1 = radius_curved * sin(theta3); % Adjusted for starting position

x2 = ones(1, 100); % Straight section 1
y2 = linspace(0, length_straight, 100);

theta1 = linspace(0, pi, 100); % Curved section 2
x3 = radius_curved * cos(theta1) + radius_curved; % Adjusted for starting position
y3 = radius_curved * sin(theta1) + length_straight; % Adjusted for starting position

x4 = zeros(1, 100) + 2 * radius_curved; % Straight section 2
y4 = linspace(length_straight, 0, 100);

% Define parameters
patch_width = 2; % Width of the patch
patch_length = 4; % Length of the patch
initial_position = [0, 0]; % Initial position of the patch

% Define the vertices of the patch __ Can't figure out what is wrong with
% this
patch_vertices = [
    initial_position(1) - (1/2 * patch_width), initial_position(2);
    initial_position(1) + (1/2 * patch_width), initial_position(2);
    initial_position(1) + (1/2 * patch_width), initial_position(2) + patch_length;
    initial_position(1) - (1/2 * patch_width), initial_position(2) + patch_length
];

% Plot the race track __ Works but isn't technically continuous
figure;
hold on;
plot(x1, y1, 'k', 'LineWidth', 15); % Curved section 1
plot(x2, y2, 'k', 'LineWidth', 15); % Straight section 1
plot(x3, y3, 'k', 'LineWidth', 15); % Curved section 2
plot(x4, y4, 'k', 'LineWidth', 15); % Straight section 2
hold off;

% Plot the initial position of the patch
% patch_handle = patch(patch_vertices(:, 1), patch_vertices(:, 2), 'r');

% Concatenate the coordinates for a continuous line __ Doesn't work (adds
% weird bars)
% x_track = [x1, x2, x3, x4];
% y_track = [y1, y2, y3, y4];

% Plot the race track __ goes with code above
% figure;
% plot(x_track, y_track, 'k', 'LineWidth', track_width);

% Attempting to repeat the patch but it does not work
% x_patch = ones(1, 100);
% y_patch = linspace(0, length_straight, 100);
% c = 'r';
% patch(x_patch, y_patch, c)

axis equal;
xlabel('X Position (m)');
ylabel('Y Position (m)');
title('Race Track');
grid on;
