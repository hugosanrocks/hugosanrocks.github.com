% gda03_05
%
% straight line problem
% least squares fit to synthetic data
% using two solution methods
%   standard solver
%   bicg() solver

clear G;
global G;

% z's
N=30;
zmin=0;
zmax=10;
z = sort(random('Uniform',zmin,zmax,N,1));

% d = a + b*z + noise
a=2.0;
b=1.0;
sd=1.0;
dobs = a+b*z+random('Normal',0,sd,N,1);

% data kernel
M=2;
G=[ones(N,1), z];

% standard matrix solution
mest1 = (G'*G)\(G'*dobs);
dpre1 = G*mest1;

% bigc() solution
tol = 1e-6;
maxit = 3*N;
mest2 = bicg( @leastsquaresfcn, G'*dobs, tol, maxit );
dpre2 = G*mest2;

% plot
figure(1);
clf;
pdmin=0;
pdmax=15;
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pdmin, pdmax ]' );
plot( z, dobs, 'ko', 'LineWidth', 2);
plot( z, dpre1, 'r-', 'LineWidth', 3);
plot( z, dpre2, 'g--', 'LineWidth', 2);
xlabel('z');
ylabel('d');





