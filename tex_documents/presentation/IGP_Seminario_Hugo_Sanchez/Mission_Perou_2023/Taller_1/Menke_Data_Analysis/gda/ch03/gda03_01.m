% gda03_01 
%
% least squares fit to synthetic data

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

% least squares fit
M=2;
G=[ones(N,1), z];
mest = (G'*G)\(G'*dobs);

% predicted data
dpre = G*mest;
e = dobs - dpre;
[emax, iemax] = max(abs(e));

% plot
figure(1);
clf;

pdmin=0;
pdmax=15;

subplot(1,2,1);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pdmin, pdmax ]' );
plot( z, dobs, 'ro', 'LineWidth', 2);
plot( z, dpre, 'b-', 'LineWidth', 2);
xlabel('z');
ylabel('d');

subplot(1,2,2);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pdmin, pdmax ]' );
i=iemax;
plot( z(i), dobs(i), 'ro', 'LineWidth', 2);
plot( z, dpre, 'b-', 'LineWidth', 2);
plot( [z(i), z(i)]', [pdmin, dpre(i)]', 'k:', 'LineWidth', 2);
plot( [zmin, z(i)]', [dpre(i), dpre(i)]', 'k:', 'LineWidth', 2);
plot( [zmin, z(i)]', [dobs(i), dobs(i)]', 'k:', 'LineWidth', 2);
xlabel('z');
ylabel('d');





