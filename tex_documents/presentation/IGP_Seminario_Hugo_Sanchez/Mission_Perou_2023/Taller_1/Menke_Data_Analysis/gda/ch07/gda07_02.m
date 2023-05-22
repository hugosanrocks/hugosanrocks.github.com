% gda07_02

% grid
xmin = 0;
xmax = 1;

ymin = 0;
ymax = 1;

zmin = 0;
zmax = 1;

% span space graph

m1 = [0.7, 0.8, 0.8]';
m2 = [0.5, 0.7, 0.8]';
m3 = [0.8, 0.6, 0.7]';

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, ymin, ymax, zmin, zmax]');

% improvise 3D box
plot3( [xmin,xmin], [ymin,ymin], [zmin,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymin,ymax], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmax], [ymin,ymin], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymax], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymax,ymax], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymin,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymin,ymin], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymax,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymax,ymax], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymin], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymax,ymax], [zmin,zmin], 'k-', 'LineWidth', 2 );
xlabel('m_1');
ylabel('m_2');
zlabel('m_3');

maxP=max(max(max(PP)));

% pretty crazy way to draw an arrowhead!
rbar=m1;
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );
tangent = rbar/sqrt(rbar'*rbar);
per1 = cross( tangent, [0, 0, 1]' );
per1 = per1/sqrt(per1'*per1);
per2 = cross( tangent, per1 );
per2 = per2/sqrt(per2'*per2);
L = 0.05;
v1 = rbar - L*tangent + 0.25*L*per1;
v2 = rbar - L*tangent - 0.25*L*per1;
v3 = rbar - L*tangent + 0.25*L*per2;
v4 = rbar - L*tangent - 0.25*L*per2;
plot3( [rbar(1), v1(1)], [rbar(2), v1(2)], [rbar(3), v1(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v2(1)], [rbar(2), v2(2)], [rbar(3), v2(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v3(1)], [rbar(2), v3(2)], [rbar(3), v3(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v4(1)], [rbar(2), v4(2)], [rbar(3), v4(3)], 'k-', 'LineWidth', 3 );

rbar=m2;
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );
tangent = rbar/sqrt(rbar'*rbar);
per1 = cross( tangent, [0, 0, 1]' );
per1 = per1/sqrt(per1'*per1);
per2 = cross( tangent, per1 );
per2 = per2/sqrt(per2'*per2);
L = 0.05;
v1 = rbar - L*tangent + 0.25*L*per1;
v2 = rbar - L*tangent - 0.25*L*per1;
v3 = rbar - L*tangent + 0.25*L*per2;
v4 = rbar - L*tangent - 0.25*L*per2;
plot3( [rbar(1), v1(1)], [rbar(2), v1(2)], [rbar(3), v1(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v2(1)], [rbar(2), v2(2)], [rbar(3), v2(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v3(1)], [rbar(2), v3(2)], [rbar(3), v3(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v4(1)], [rbar(2), v4(2)], [rbar(3), v4(3)], 'k-', 'LineWidth', 3 );

rbar=m3;
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );
tangent = rbar/sqrt(rbar'*rbar);
per1 = cross( tangent, [0, 0, 1]' );
per1 = per1/sqrt(per1'*per1);
per2 = cross( tangent, per1 );
per2 = per2/sqrt(per2'*per2);
L = 0.05;
v1 = rbar - L*tangent + 0.25*L*per1;
v2 = rbar - L*tangent - 0.25*L*per1;
v3 = rbar - L*tangent + 0.25*L*per2;
v4 = rbar - L*tangent - 0.25*L*per2;
plot3( [rbar(1), v1(1)], [rbar(2), v1(2)], [rbar(3), v1(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v2(1)], [rbar(2), v2(2)], [rbar(3), v2(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v3(1)], [rbar(2), v3(2)], [rbar(3), v3(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v4(1)], [rbar(2), v4(2)], [rbar(3), v4(3)], 'k-', 'LineWidth', 3 );

plot3( [m1(1), m2(1)] , [m1(2), m2(2)], [m1(3), m2(3)], 'r:', 'LineWidth', 2 );
plot3( [m2(1), m3(1)] , [m2(2), m3(2)], [m2(3), m3(3)], 'r:', 'LineWidth', 2 );
plot3( [m3(1), m1(1)] , [m3(2), m1(2)], [m3(3), m1(3)], 'r:', 'LineWidth', 2 );

% dont span space graph

m1 = [0.7, 0.8, 0.9]';
m2 = [0.5, 0.7, 0.8]';
m3 = 0.5*(m1+m2);

figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, ymin, ymax, zmin, zmax]');

% improvise 3D box
plot3( [xmin,xmin], [ymin,ymin], [zmin,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymin,ymax], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmax], [ymin,ymin], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymax], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymax,ymax], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymin,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymin,ymin], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymax,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymax,ymax], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymin], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymax,ymax], [zmin,zmin], 'k-', 'LineWidth', 2 );
xlabel('m_1');
ylabel('m_2');
zlabel('m_3');


% pretty crazy way to draw an arrowhead!
rbar=m1;
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );
tangent = rbar/sqrt(rbar'*rbar);
per1 = cross( tangent, [0, 0, 1]' );
per1 = per1/sqrt(per1'*per1);
per2 = cross( tangent, per1 );
per2 = per2/sqrt(per2'*per2);
L = 0.05;
v1 = rbar - L*tangent + 0.25*L*per1;
v2 = rbar - L*tangent - 0.25*L*per1;
v3 = rbar - L*tangent + 0.25*L*per2;
v4 = rbar - L*tangent - 0.25*L*per2;
plot3( [rbar(1), v1(1)], [rbar(2), v1(2)], [rbar(3), v1(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v2(1)], [rbar(2), v2(2)], [rbar(3), v2(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v3(1)], [rbar(2), v3(2)], [rbar(3), v3(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v4(1)], [rbar(2), v4(2)], [rbar(3), v4(3)], 'k-', 'LineWidth', 3 );

rbar=m2;
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );
tangent = rbar/sqrt(rbar'*rbar);
per1 = cross( tangent, [0, 0, 1]' );
per1 = per1/sqrt(per1'*per1);
per2 = cross( tangent, per1 );
per2 = per2/sqrt(per2'*per2);
L = 0.05;
v1 = rbar - L*tangent + 0.25*L*per1;
v2 = rbar - L*tangent - 0.25*L*per1;
v3 = rbar - L*tangent + 0.25*L*per2;
v4 = rbar - L*tangent - 0.25*L*per2;
plot3( [rbar(1), v1(1)], [rbar(2), v1(2)], [rbar(3), v1(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v2(1)], [rbar(2), v2(2)], [rbar(3), v2(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v3(1)], [rbar(2), v3(2)], [rbar(3), v3(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v4(1)], [rbar(2), v4(2)], [rbar(3), v4(3)], 'k-', 'LineWidth', 3 );

rbar=m3;
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );
tangent = rbar/sqrt(rbar'*rbar);
per1 = cross( tangent, [0, 0, 1]' );
per1 = per1/sqrt(per1'*per1);
per2 = cross( tangent, per1 );
per2 = per2/sqrt(per2'*per2);
L = 0.05;
v1 = rbar - L*tangent + 0.25*L*per1;
v2 = rbar - L*tangent - 0.25*L*per1;
v3 = rbar - L*tangent + 0.25*L*per2;
v4 = rbar - L*tangent - 0.25*L*per2;
plot3( [rbar(1), v1(1)], [rbar(2), v1(2)], [rbar(3), v1(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v2(1)], [rbar(2), v2(2)], [rbar(3), v2(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v3(1)], [rbar(2), v3(2)], [rbar(3), v3(3)], 'k-', 'LineWidth', 3 );
plot3( [rbar(1), v4(1)], [rbar(2), v4(2)], [rbar(3), v4(3)], 'k-', 'LineWidth', 3 );

plot3( [m1(1), m2(1)] , [m1(2), m2(2)], [m1(3), m2(3)], 'r:', 'LineWidth', 2 );
plot3( [m2(1), m3(1)] , [m2(2), m3(2)], [m2(3), m3(3)], 'r:', 'LineWidth', 2 );
plot3( [m3(1), m1(1)] , [m3(2), m1(2)], [m3(3), m1(3)], 'r:', 'LineWidth', 2 );