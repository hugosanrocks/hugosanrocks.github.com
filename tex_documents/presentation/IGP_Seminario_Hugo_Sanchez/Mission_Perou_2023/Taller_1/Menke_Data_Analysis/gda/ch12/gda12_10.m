% gda12_10

% grid
Nx = 101;
xmin = -pi;
xmax = pi;
Dx = (xmax-xmin)/(Nx-1);
x = xmin + Dx*[0:Nx-1]';

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [-3.5, 3.5, 0, 1] );
xlabel('theta');
ylabel('p(theta)');

k1=1;
k2=5;

p1 = (k1/(4*pi*sinh(k1)))*exp(k1*cos(x));
p2 = (k2/(4*pi*sinh(k2)))*exp(k2*cos(x));

plot( x, p1, 'r-', 'LineWidth', 3);
plot( x, p2, 'b-', 'LineWidth', 3);
plot( -pi, 0, 'k+', 'LineWidth', 2);
plot( pi, 0, 'k+', 'LineWidth', 2);

