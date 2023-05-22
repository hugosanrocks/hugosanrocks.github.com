% gda05_02

% isosurfaace of a 3D Normal distribution

% grid
Nx = 31;
xmin = 0;
xmax = 5;
Dx = (xmax-xmin)/(Nx-1);
x = xmin + Dx*[0:Nx-1]';

Ny = 31;
ymin = 0;
ymax = 5;
Dy = (ymax-ymin)/(Ny-1);
y = ymin + Dy*[0:Ny-1]';

Nz = 31;
zmin = 0;
zmax = 5;
Dz = (zmax-zmin)/(Nz-1);
z = zmin + Dz*[0:Nz-1]';

[XX, YY, ZZ] = meshgrid( x, y, z );

% parameters for Normal distribution
rbar = [2.5, 2.5, 2.5]';
sd=0.5;
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

% for test purposes
% A = Dx*Dx*Dz*sum(sum(sum(PP)));

maxP=max(max(max(PP)));

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

plot3( [0, 5], [0, 5], [0, 5], 'b-', 'LineWidth', 3 );

for ip = [1:10]
    p(ip)=patch(isosurface( XX, YY, ZZ, PP, ip*maxP/10 ));
    isonormals(XX,YY,ZZ,PP, p(ip))
    set(p(ip), 'FaceColor', 'red', 'FaceAlpha', ip/20, 'EdgeColor', 'none');
end

daspect([1 1 1])
view(3)
camlight; lighting phong

    
    

