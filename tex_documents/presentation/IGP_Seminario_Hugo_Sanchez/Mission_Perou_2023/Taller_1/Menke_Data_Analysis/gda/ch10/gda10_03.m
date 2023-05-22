% gda10_03

% mixing of endmembers

% grid
xmin = 0;
xmax = 1;

ymin = 0;
ymax = 1;

zmin = 0;
zmax = 1;


% plot
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, ymin, ymax, zmin, zmax]');

% factors
f1 = [1, 0.2, 0.8]';
norm = 1.2*sqrt(f1'*f1);
f1=f1/norm;

f2 = [0.2, 1, 0.8]';
norm = 0.8*sqrt(f2'*f2);
f2=f2/norm;

arrow3(f1,'r-',3);
arrow3(f2,'r-',3);

% samples
s1=0.8*f1+(1-0.8)*f2;
s2=0.6*f1+(1-0.6)*f2;
s3=0.4*f1+(1-0.4)*f2;
s4=0.2*f1+(1-0.2)*f2;
arrow3(s1,'k-',2);
arrow3(s2,'k-',2);
arrow3(s3,'k-',2);
arrow3(s4,'k-',2);

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
xlabel('E_1');
ylabel('E_2');
zlabel('E_3');

% plot
figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, ymin, ymax, zmin, zmax]');

% factors
f1a = [1, 0.2, 0.8]';
norm = 1.2*sqrt(f1a'*f1a);
f1a=f1a/norm;

f2a = [0.2, 1, 0.8]';
norm = 0.8*sqrt(f2a'*f2a);
f2a=f2a/norm;

f1 = f1a+0.2*f2a;
norm = 1.2*sqrt(f1'*f1);
f1=f1/norm;

f2 = f2a + 0.2*f1a;
norm = 0.8*sqrt(f2'*f2);
f2=f2/norm;

arrow3(f1,'r-',3);
arrow3(f2,'r-',3);

arrow3(s1,'k-',2);
arrow3(s2,'k-',2);
arrow3(s3,'k-',2);
arrow3(s4,'k-',2);

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
xlabel('E_1');
ylabel('E_2');
zlabel('E_3');
