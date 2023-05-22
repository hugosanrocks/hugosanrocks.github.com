% gda09_07
% grid search example

% data are in a sinple auxillary variable, x
N=40;
xmin=0;
xmax=1.0;
Dx=(xmax-xmin)/(N-1);
x = Dx*[0:N-1]';

% two model parameters
M=2;

% true model parameters
mt = [1.21, 1.54]';

% y=f(x, m1, m2);
w0=20;
dtrue = sin(w0*mt(1)*x) + mt(1)*mt(2);
sd=0.4;
dobs = dtrue + random('Normal',0,sd,N,1);

% plot data
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [0, xmax, 0, 4 ] );
plot(x,dtrue,'k-','LineWidth',3);
plot(x,dobs,'ko','LineWidth',3);
xlabel('x');
ylabel('d');

% 2D grid
L = 101;
Dm = 0.02;
m1min=0;
m2min=0;
m1a = m1min+Dm*[0:L-1]';
m2a = m2min+Dm*[0:L-1]';
m1max = m1a(L);
m2max = m2a(L);

% grid search, compute error, E
E = zeros(L,L);
for j = [1:L]
for k = [1:L]
    dpre = sin(w0*m1a(j)*x) + m1a(j)*m2a(k);
    E(j,k) = (dobs-dpre)'*(dobs-dpre);
end
end

% find the minimum value of E and the corresponding (a b) value
[Erowmins, rowindices] = min(E);
[Emin, colindex] = min(Erowmins);
rowindex = rowindices(colindex);
m1est = m1min+Dm*(rowindex-1);
m2est = m2min+Dm*(colindex-1);

% evaluate prediction and plot it
dpre = sin(w0*m1est*x) + m1est*m2est;
plot(x,dpre,'r-','LineWidth',3);

figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [m2min, m2max, m1min, m1max] );
axis ij;
imagesc( [m2min, m2max], [m1min, m1max], E);
colorbar;
xlabel('m2');
ylabel('m1');
plot( m2est, m1est, 'wo', 'LineWidth', 3 );
plot( mt(2), mt(1), 'go', 'LineWidth', 3 );
    


