% gda02_04 
%
% calculaion of mode and mean for a skewed pdf
%

% d-axis
Dd = 0.1;
N = 101;
d = Dd*[0:N-1]';
dmin=0;
dmax=10;

% Normal pdf
dbar = 0;
sd = 3;
p = d .* exp(-0.5*((d-dbar).^2)/sd^2);
dbar = 1;
sd = 0.3;
p = p + 4*exp(-0.5*((d-dbar).^2)/sd^2);
norm = Dd*sum(p);
p = p/norm;

% maximum liklihood point
[pmax, imax] = max(p);
dml = d(imax);

% mean
dbar = Dd*sum(d.*p);

% plot
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, 0.5 ] );
plot(d,p,'b-','LineWidth',3);
xlabel('d');
ylabel('p(d)');
plot( [dml, dml]', [0, 0.05]', 'k-', 'LineWidth', 2 );
plot( [dbar, dbar]', [0, 0.05]', 'k-', 'LineWidth', 2 );


