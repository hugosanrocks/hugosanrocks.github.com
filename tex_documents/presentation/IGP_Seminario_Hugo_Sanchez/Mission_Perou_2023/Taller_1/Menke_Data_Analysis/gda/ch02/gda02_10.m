% gda02_10
%
% two Normal curves of different variance

% axes
Dd = 0.1;
N = 101;
dmin=-5;
d = dmin+Dd*[0:N-1]';
dmax=5;

sd = 1.0;
dbar = 0.0;
pa = exp(-0.5*(d-dbar).^2/(sd^2))/(sqrt(2*pi)*sd);

sd = 2.0;
dbar = 0.0;
pb = exp(-0.5*(d-dbar).^2/(sd^2))/(sqrt(2*pi)*sd);


figure(1);
clf;

% plot pdf
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, 0.5 ] );
plot(d,pa,'r-','LineWidth',3);
plot(d,pb,'b-','LineWidth',3);
xlabel('d');
ylabel('p(d)');
