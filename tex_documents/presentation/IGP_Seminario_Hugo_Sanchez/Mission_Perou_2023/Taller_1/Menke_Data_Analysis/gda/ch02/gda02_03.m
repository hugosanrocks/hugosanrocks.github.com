% gda02_03
%
% operations on a probability distributions

% axes
Dd = 0.1;
N = 101;
d = Dd*[0:N-1]';
dmin=0;
dmax=10;

% Normal distribution
dbar = 5;
sigma = 1;
sigma2=sigma^2;
p = exp(-0.5*(d-dbar).^2/sigma2) / (sqrt(2*pi)*sigma);

% plot p
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis([0,10,0,max(p)]);
plot(d,p,'k-','LineWidth',3);
xlabel('d');
ylabel('p(d)');

% total probability
Ptotal = Dd * sum(p);
fprintf('total probabilty %f\n', Ptotal );

% cumulative probability
P = Dd * cumsum(p);
figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis([0,10,0,max(P)]);
plot(d,P,'k-','LineWidth',3);
xlabel('d');
ylabel('P(d)');

% mean and variance
Ed = Dd * sum(d.*p);
sigma2 = Dd * sum(((d-Ed).^2).*p);
fprintf('mean %f and variance %f\n', Ed, sigma2 );
