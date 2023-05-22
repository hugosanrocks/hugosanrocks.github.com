% gda02_02 
%
% a Normal pdf
%

% d-axis
Dd = 0.1;
N = 101;
d = Dd*[0:N-1]';
dmin=0;
dmax=10;

% Normal pdf
dbar = 5;
sd = 1;
p = exp(-0.5*((d-dbar).^2)/sd^2)/(sqrt(2*pi)*sd);

% plot
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, 0.5 ] );
plot(d,p,'b-','LineWidth',3);
xlabel('d');
ylabel('p(d)');

