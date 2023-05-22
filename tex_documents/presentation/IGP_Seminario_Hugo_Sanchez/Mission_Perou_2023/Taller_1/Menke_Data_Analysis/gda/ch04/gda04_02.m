% gda04_02
%
% Model Resolution Matrix example

% model, m(z), moztly zero but a few spikes
M=101;
zmin=0;
zmax=10;
Dz=(zmax-zmin)/(M-1);
z=zmin+Dz*[0:M-1]';
mtrue = zeros(M,1);
mtrue(5)=1;
mtrue(10)=1;
mtrue(20)=1;
mtrue(50)=1;
mtrue(90)=1;

% experiment: exponential smoothing of model
N=80;
cmin=0.00;
cmax=0.10;
Dc=(cmax-cmin);
c = cmin + Dc*[0:N-1]';
G = exp(-c*z');

sd=0.0;
dtrue = G*mtrue;
dobs = dtrue + random('Normal',0,sd,N,1);

% minimum length solution
epsilon=1e-12;
GMG = G'/(G*G'+epsilon*eye(N,N));
mest = GMG * dobs;
Rres = GMG*G;

gda_draw(' ',mest,'=',' ',Rres,' ',mtrue);

% plot
figure(2);
clf;

pmmin=-0.2;
pmmax=1;

set(gca,'LineWidth',3);
hold on;
axis( [zmin, zmax, pmmin, pmmax ]' );
plot( z, mtrue, 'r-', 'LineWidth', 3);
plot( z, mest,  'b-', 'LineWidth', 3);
xlabel('z');
ylabel('m');

