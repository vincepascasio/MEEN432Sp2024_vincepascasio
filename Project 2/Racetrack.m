% creating a racetrack
% variables

x_i = [0];
y_i = [0];
x_o = [0];
y_o = [15];
radius = 200;
radius2 = 185;
center_right = [900,-200];
center_left = [0,-200];
theta = linspace(0,pi,1000);

% loop to obtain all values

for i = 1:900;
    j_i = 0;
    j_o = 15;
    x_i = [x_i, i];
    x_o = [x_o,i];
    y_o = [y_o,j_o];
    y_i = [y_i,j_i];
end

for i = 1:length(theta);
    x_o = [x_o, center_right(1)+radius*sin(theta(i))];
    x_i = [x_i, center_right(1)+radius2*sin(theta(i))];
    y_o = [y_o, 15 + center_right(2)+radius*cos(theta(i))];
    y_i = [y_i, 15 + center_right(2)+radius2*cos(theta(i))];
end 

for i = 1:900;
    x_o = [x_o,900-i];
    x_i = [x_i,900-i];
    y_o = [y_o, -385];
    y_i = [y_i,-370];
end 

for i = 1:length(theta);
    x_o = [x_o, center_left(1)-radius*sin(theta(i))];
    x_i = [x_i, center_left(1)-radius2*sin(theta(i))];
    y_o = [y_o, 15 + center_left(2)-radius*cos(theta(i))];
    y_i = [y_i, 15 + center_left(2)-radius2*cos(theta(i))];
end

% plotting racetrack
plot(x_i, y_i)
axis([-100 1000 -400 25])
hold on
plot(x_o,y_o)
hold off

% code for plotting animated moving car
%variables for finding path to plot

x_p = [0];
y_p = [];
center_rightpath = [0,-192.5];
center_leftpath = [900,-192.5];
radius_path = -192.5; 

for i = 1:900;
    x_p = [x_p, i];
    y_p = [y_p,7.5];
end

for i = 1:length(theta);
    x_p = [x_p, center_leftpath(1)-radius_path*sin(theta(i))];
    y_p = [y_p, 7.5 + center_leftpath(2)-radius_path*cos(theta(i))];
end 

for i = 1:900;
    x_p = [x_p,900-i];
    y_p = [y_p,-377.5];
end 

for i = 1:length(theta);
    x_p = [x_p, center_rightpath(1)+radius_path*sin(theta(i))];
    y_p = [y_p, 7.5 + center_rightpath(2)+radius_path*cos(theta(i))];

end   

% plotting racetrack 
%plot(x_i, y_i)
%hold on
%plot(x_o,y_o)
%hold off

% car is the square
car_size = 8;

% plotting racetrack and car
for i = 1:length(x_pi);
    plot(x_i, y_i)
    hold on
    plot(x_o,y_o)
    car_x = [x_p(i)-.5*car_size,x_p(i)+.5*car_size,x_p(i)+.5*car_size,x_p(i)-.5*car_size,x_p(i)-.5*car_size];
    car_y = [y_p(i)-.5*car_size,y_p(i)-.5*car_size,y_p(i)+.5*car_size,y_p(i)+.5*car_size,y_p(i)-.5*car_size];
    plot(car_x,car_y) 
    axis([-400 1300 -400 50])
    hold off
    f = getframe;
end

% showing the car moving
movie(f)