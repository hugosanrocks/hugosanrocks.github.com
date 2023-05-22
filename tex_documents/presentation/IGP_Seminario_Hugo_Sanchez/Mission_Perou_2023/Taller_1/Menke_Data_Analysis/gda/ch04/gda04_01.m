% gda04_01
%
% data Resolution Matrix example

% z's
N=101;
zmin=0;
zmax=10;
Dz = (zmax-zmin)/(N-1);
z = zmin + Dz*[0:N-1]';

% d = a + b*z + noise
a=2.0;
b=1.0;
sd=0.5;
dtrue = a+b*z;
dobs = dtrue+random('Normal',0,sd,N,1);

% least squares fit
M=2;
G=[ones(N,1), z];
GMG = (G'*G)\G';
mest = GMG * dobs;
dpre = G*mest;

% predicted data
dpre = G*mest;
e = dobs - dpre;
[emax, iemax] = max(abs(e));

% data resolution matrix
Nres = G*GMG;
gda_draw(' ',dpre,'=',' ',Nres,' ',dobs);

% plot
figure(2);
clf;

pdmin=0;
pdmax=15;

set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pdmin, pdmax ]' );
plot( z, dobs, 'ro', 'LineWidth', 2);
plot( z, dpre, 'b-', 'LineWidth', 2);
xlabel('z');
ylabel('d');

