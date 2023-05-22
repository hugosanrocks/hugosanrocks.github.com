% gda12_08

% grid
xmin = 0;
xmax = 1;
ymin = 0;
ymax = 1;
zmin = 0;
zmax = 1;

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
xlabel('x_1');
ylabel('x_2');
zlabel('x_3');

rbar=[1, 1, 1]';
rlen = sqrt( rbar'*rbar );
rbar = rbar/rlen;
% Note: this is not a Fisher distribution, but it is azimuthually uniform
for i=[1:20];
    rvec = random('Uniform', -1, 1, 3, 1); % random vector
    b = cross(rvec,rbar); % vector perpendicular to rvec
    rnew = rbar + 0.15*b; % add small deviation to rvec
    rnew = rnew/sqrt(rnew'*rnew); % normalize to unit length
    arrow3( rnew, 'k-', 2 );
end
arrow3( rbar, 'r-', 4 )

daspect([1 1 1])
view(3)
camlight; lighting phong
