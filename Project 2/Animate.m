% This code animtes the patch vehicle going around the generated track

% From a kinematic model (do in later part of this project)
% xpath = X1p;
% ypath = Y1p;
% theta = psi1p;

% From no model
xpath = path.xpath;
ypath = path.ypath;
theta = (path.tpath);

% Animating the patch
figure
plot(xpath, ypath, '.r'); % Plotting x and y coordinate of the generated track
xlabel("X-axis(m)")
ylabel("Y-axis(m)")
hold on
h = animatedline; % Look into animating patches
axis([min(xpath) max(xpath) min(ypath) max(ypath)])
for i = 1:length(xpath)
   x = xpath(i);
   y = ypath(i);
   addpoints(h,x,y)
   width = 5;
   Lcar = 15;
   car = [-Lcar/2 -width/2; -Lcar/2 width/2; Lcar/2 width/2; Lcar/2 -width/2];
   a = polyshape(rcar + [x,y]);
   ap = plot(a);
   drawnow limitrate
   ap.Facecolor = 'none';
   drawnow limitrate
   pause(0.05);
end

hold off