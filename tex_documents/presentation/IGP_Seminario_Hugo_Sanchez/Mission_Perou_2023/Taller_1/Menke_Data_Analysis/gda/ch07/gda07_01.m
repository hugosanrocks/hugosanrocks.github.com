% gda07_01

% grid
Nx = 51;
xmin = 0;
xmax = 1;
Dx = (xmax-xmin)/(Nx-1);
x = xmin + Dx*[0:Nx-1]';

Ny = 51;
ymin = 0;
ymax = 1;
Dy = (ymax-ymin)/(Ny-1);
y = ymin + Dy*[0:Ny-1]';

Nz = 51;
zmin = 0;
zmax = 1;
Dz = (zmax-zmin)/(Nz-1);
z = zmin + Dz*[0:Nz-1]';

[XX, YY, ZZ] = meshgrid( x, y, z );

% model parameter graph

% parameters for Normal distribution
rbar = [0.7, 0.8, 0.9]';
sd=0.1;
C = (sd^2)*eye(3,3);
CI = inv(C);
DC = det(C);
norm = ( ((2*pi)^(3/2)) * sqrt(DC) );

PP = zeros(Nx,Ny,Nz);
for i=[1:Nx]
for j=[1:Ny]
for k=[1:Nz]
    r = [XX(i,j,k), YY(i,j,k), ZZ(i,j,k)]';
    PP(i,j,k) = exp(-0.5*(r-rbar)'*CI*(r-rbar))/norm;
end
end
end

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
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );

% pretty crazy way to draw an arrowhead!
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

p=patch(isosurface( XX, YY, ZZ, PP, 0.95*maxP ));
isonormals(XX,YY,ZZ,PP, p)
set(p, 'FaceColor', 'red', 'FaceAlpha', 0.5, 'EdgeColor', 'none');

daspect([1 1 1])
view(3)
camlight; lighting phong

% data graph

% parameters for Normal distribution
rbar = [0.9, 0.6, 0.7]';
sd=0.1;
C = (sd^2)*eye(3,3);
CI = inv(C);
DC = det(C);
norm = ( ((2*pi)^(3/2)) * sqrt(DC) );

PP = zeros(Nx,Ny,Nz);
for i=[1:Nx]
for j=[1:Ny]
for k=[1:Nz]
    r = [XX(i,j,k), YY(i,j,k), ZZ(i,j,k)]';
    PP(i,j,k) = exp(-0.5*(r-rbar)'*CI*(r-rbar))/norm;
end
end
end

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
xlabel('d_1');
ylabel('d_2');
zlabel('d_3');

maxP=max(max(max(PP)));
plot3( [0, rbar(1)], [0, rbar(2)], [0, rbar(3)], 'k-', 'LineWidth', 3 );

% pretty crazy way to draw an arrowhead!
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

p=patch(isosurface( XX, YY, ZZ, PP, 0.95*maxP ));
isonormals(XX,YY,ZZ,PP, p)
set(p, 'FaceColor', 'blue', 'FaceAlpha', 0.5, 'EdgeColor', 'none');

daspect([1 1 1])
view(3)
camlight; lighting phong
