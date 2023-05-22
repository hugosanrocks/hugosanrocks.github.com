% gda05_04
%
% examples of probability distributions

clear all;

% grid
Nd1 = 51;
d1min = 0;
d1max = 5.0;
Dd1 = (d1max-d1min)/(Nd1-1);
d1 = d1min + Dd1*[0:Nd1-1]';

Nd2 = 51;
d2min = 0;
d2max = 5.0;
Dd2 = (d2max-d2min)/(Nd2-1);
d2 = d2min + Dd2*[0:Nd2-1]';

[X,Y]=meshgrid( d1, d2);

% distribution 1
P1=zeros(Nd1,Nd2);
dbar = [2.5, 2.5]';
sd1 = 0.5;
sd2 = 0.5;
C = diag( [sd1, sd2]' );
CI = inv(C);
DC = det(C);
norm = (1/(2*pi)) * (1/sqrt(DC));
for i=[1:Nd1]
for j=[1:Nd2]
    d =[X(i,j), Y(i,j)]' - dbar;
    P1(i,j) = norm*exp( -0.5 * d'*CI* d );
end
end

% for test purposes
% A = Dd1*Dd2*sum(sum(P1)

% distribution 2, ridge
% Note distribution not normalizable
P2=zeros(Nd1,Nd2);
sda = 0.5;
d0a = [2.5, 2.5]';
for i=[1:Nd1]
for j=[1:Nd2]
    dr =[X(i,j)-d0a(1), Y(i,j)-d0a(2)]';
    r2= (dr'*[1,1]')^2;
    P2(i,j) = 0.2*exp(-0.5*r2/sda);
end
end

% plot
figure(1);
clf;

% improvise 3D box
pxmin=d1min; pxmax=d1max;
pymin=d2min; pymax=d2max;
pzmin=0; pzmax=0.4;

subplot(1,2,1);
set(gca,'LineWidth',2);
hold on;
axis( [pxmin-0.01, pxmax+0.01, pymin-0.01, pymax+0.01, pzmin-0.01, pzmax+0.01 ]' );

mesh(X,Y,P1);

% improvise 3D box
plot3( [pxmin,pxmin], [pymin,pymin], [pzmin,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmin], [pymin,pymax], [pzmin,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmax], [pymin,pymin], [pzmin,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmax], [pymax,pymax], [pzmax,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmax], [pymax,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmin], [pymax,pymax], [pzmax,pzmax], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmin], [pymin,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmax], [pymin,pymin], [pzmax,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmin,pxmin], [pymax,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmin], [pymax,pymax], [pzmax,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmax], [pymax,pymin], [pzmin,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmin], [pymax,pymax], [pzmin,pzmin], 'k-', 'LineWidth', 2 );

subplot(1,2,2);
set(gca,'LineWidth',2);
hold on;
axis( [pxmin-0.01, pxmax+0.01, pymin-0.01, pymax+0.01, pzmin-0.01, pzmax+0.01 ]' );

mesh(X,Y,P2);

% improvise 3D box
plot3( [pxmin,pxmin], [pymin,pymin], [pzmin,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmin], [pymin,pymax], [pzmin,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmax], [pymin,pymin], [pzmin,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmax], [pymax,pymax], [pzmax,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmax], [pymax,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmin], [pymax,pymax], [pzmax,pzmax], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmin], [pymin,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmax], [pymin,pymin], [pzmax,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmin,pxmin], [pymax,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmin], [pymax,pymax], [pzmax,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmax], [pymax,pymin], [pzmin,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmin], [pymax,pymax], [pzmin,pzmin], 'k-', 'LineWidth', 2 );



