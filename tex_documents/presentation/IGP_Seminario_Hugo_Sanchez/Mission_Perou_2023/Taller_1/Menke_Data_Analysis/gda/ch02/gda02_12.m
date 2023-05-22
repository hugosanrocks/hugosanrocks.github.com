% gda02_12
%
% example of a Pierson's chi-squared test

figure(1);
clf;

% Part 1: Correct Distribution
fprintf('Part 1: Correct Distribution\n');

% make some Gaussian random daya
Ndata = 200;
dbar = 5;
sigmad = 1;
drandom = random('Normal',dbar,sigmad,Ndata,1);

% estimate mean and standard deviation of d's
dbarest = mean(drandom);
sigmadest = std(drandom);
fprintf('mean: true %f estimated %f\n', dbar, dbarest);
fprintf('sigma: true %f estimated %f\n', sigmad, sigmadest);

% make histogram.  The bins are from d +/- Dd/2.
dmin = 0;
dmax = 10;
Nbin=40;
Dd = (dmax-dmin)/(Nbin-1);
d = Dd*[0:Nbin-2]+Dd/2;
dhist = hist( drandom, d);

% normalize to unit area
norm = sum(dhist);
pdest = dhist / norm;

% theoretical distribution
pdtrue = normcdf(d+Dd/2,dbarest,sigmadest)-normcdf(d-Dd/2,dbarest,sigmadest);

% plot
subplot(1,2,1);
hold on;
set(gca,'LineWidth',3);
plot(d,pdest,'r-','LineWidth',3);
plot(d,pdtrue,'b-','LineWidth',3);
xlabel('d');
ylabel('p(d)');

% compute chi squared statistic
x2est = Ndata*sum( ((pdest-pdtrue).^2) ./ pdtrue );
K = Nbin-3;

% compute P( x2 >= x2est ) = 1 - P(x2<x2est);
P = 1-chi2cdf( x2est, K );
fprintf('K %d   chi-squared-est   %f   P(x2>=x2est)   %f\n', K, x2est, P );

fprintf('\n');

% Part 2: Incorrect Distribution
fprintf('Part 2: Incorrect Distribution\n');

% estimate mean and standard deviation of d's
% then make them incorrect
dbarest = mean(drandom)-0.5;
sigmadest = std(drandom)*1.5;
fprintf('mean: true %f estimated %f\n', dbar, dbarest);
fprintf('sigma: true %f estimated %f\n', sigmad, sigmadest);

% incorrecr theoretical distribution
pdtrue = normcdf(d+Dd/2,dbarest,sigmadest)-normcdf(d-Dd/2,dbarest,sigmadest);

% plot
subplot(1,2,2);
hold on;
set(gca,'LineWidth',3);
plot(d,pdest,'r-','LineWidth',3);
plot(d,pdtrue,'b-','LineWidth',3);
xlabel('d');
ylabel('p(d)');

% compute chi squared statistic
x2est = Ndata*sum( ((pdest-pdtrue).^2) ./ pdtrue );
K = Nbin-3;

% compute P( x2 >= x2est ) = 1 - P(x2<x2est);
P = 1-chi2cdf( x2est, K );
fprintf('K %d   chi-squared-est   %f   P(x2>=x2est)   %f\n', K, x2est, P );




