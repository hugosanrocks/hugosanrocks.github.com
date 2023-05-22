% gda09_08
% monte carlo example

% data are in a sinple auxillary variable, x
N=40;
xmin=0;
xmax=1.0;
Dx=(xmax-xmin)/(N-1);
x = Dx*[0:N-1]';

% two model parameters
M=2;
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

% 2D grid, for plotting purposes only
L = 101;
Dm = 0.02;
m1min=0;
m2min=0;
m1a = m1min+Dm*[0:L-1]';
m2a = m2min+Dm*[0:L-1]';
m1max = m1a(L);
m2max = m2a(L);

% compute error, E, on grid for plotting purposed only
E = zeros(L,L);
for j = [1:L]
for k = [1:L]
    dpre = sin(w0*m1a(j)*x) + m1a(j)*m2a(k);
    E(j,k) = (dobs-dpre)'*(dobs-dpre);
end
end

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
plot( mt(2), mt(1), 'go', 'LineWidth', 3 );

% initial guess and corresponding error
mg=[1,1]';
dg = sin(w0*mg(1)*x) + mg(1)*mg(2);
Eg = (dobs-dg)'*(dobs-dg);
plot( mg(2), mg(1), 'ko', 'LineWidth', 3 );

% save solution and minimum error as a function of iteration number
Niter=2000;
Ehis=zeros(Niter+1,1);
m1his=zeros(Niter+1,1);
m2his=zeros(Niter+1,1);
Ehis(1)=Eg;
m1his(1)=mg(1);
m2his(1)=mg(2);

% randomly generate pairs of model parameters and check
% if they further minimize the error
ma = zeros(2,1);
for k = [1:Niter]
    
    % randomly generate a solution
    ma(1) = random('unif',m1min,m1max);
    ma(2) = random('unif',m2min,m2max);

    % compute its error
    da = sin(w0*ma(1)*x) + ma(1)*ma(2);
    Ea = (dobs-da)'*(dobs-da);
    
    % adopt it if its better
    if( Ea < Eg )
        mg=ma;
        Eg=Ea;
    end
    
    % save history
    Ehis(1+k)=Eg;
    m1his(1+k)=mg(1);
    m2his(1+k)=mg(2);
    
    plot( mg(2), mg(1), 'wo', 'LineWidth', 2 );
    plot( [m2his(1+k-1), m2his(1+k) ], [m1his(1+k-1), m1his(1+k) ], 'r', 'LineWidth', 2 );
    
end

m1est = m1his(Niter+1);
m2est = m2his(Niter+1);

plot( mt(2), mt(1), 'go', 'LineWidth', 3 );

figure(3);
clf;
subplot(3,1,1);
set(gca,'LineWidth',2);
hold on;
plot( [0:Niter], Ehis, 'k-', 'LineWidth', 2 );
xlabel('iteration');
ylabel('E');
subplot(3,1,2);
set(gca,'LineWidth',2);
hold on;
plot( [0, Niter], [mt(1), mt(1)], 'r', 'LineWidth', 2 );
plot( [0:Niter], m1his, 'k-', 'LineWidth', 2 );
xlabel('iteration');
ylabel('m_1');
subplot(3,1,3);
set(gca,'LineWidth',2);
hold on;
plot( [0, Niter], [mt(2), mt(2)], 'r', 'LineWidth', 2 );
plot( [0:Niter], m2his, 'k-', 'LineWidth', 2 );
xlabel('iteration');
ylabel('m_2');
    
% evaluate prediction and plot it
figure(1);
dpre = sin(w0*m1est*x) + m1est*m2est;
plot(x,dpre,'r-','LineWidth',3);
