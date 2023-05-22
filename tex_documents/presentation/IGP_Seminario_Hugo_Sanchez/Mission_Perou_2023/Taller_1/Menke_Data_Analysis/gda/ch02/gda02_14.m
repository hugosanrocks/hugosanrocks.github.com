% gda02_14 

% generate Normal random numbers with these mean and variance
N=1000;
mbar = 5.0;
sigma = 1.0;

% by transformation of a uniform distribution
mnormal1 = random('Normal',mbar,sigma,N,1);

% by transformation of a uniform distribution
muniform = random('unif',0,1,N,1);
mnormal2 = norminv(muniform,mbar,sigma);

% histogram
Nbins=100;
mmin=0;
mmax=10;
Dm = (mmax-mmin)/(Nbins-1);
m = mmin+Dm*[0:Nbins-2]'+Dm/2;
h1 = hist(mnormal1,m);
norm = Dm*sum(h1);
h1 = h1/norm;
h2 = hist(mnormal2,m);
norm = Dm*sum(h2);
h2 = h2/norm;
p = normpdf(m,mbar,sigma);

% plot
figure(1)
clf;
set(gca,'LineWidth',3);
hold on;
axis( [mmin, mmax, 0, 0.5] );
plot( m, h1, 'r-', 'LineWidth', 3 );
plot( m, h2, 'b-', 'LineWidth', 3 );
plot( m, p, 'k-', 'LineWidth', 3 );
xlabel('m');
ylabel('p(m)');



