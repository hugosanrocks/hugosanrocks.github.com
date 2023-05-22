% gda08_01
% comparizon of Normal and Exponential probability density distributions

N=101;
dmin = -5;
dmax = 5;
Dd = (dmax-dmin)/(N-1);
d = dmin + Dd*[0:N-1]';

dbar=0;
sd=1;
pE = (1/sqrt(2)) * (1/sd)* exp( -sqrt(2)*abs((d-dbar))/sd );
AEcheck = Dd*sum(pE);
dbarEcheck = Dd*sum(d.*pE);
sdEcheck = sqrt(Dd*sum((d-dbarEcheck).^2 .* pE));

pN = (1/sqrt(2*pi)) * (1/sd)* exp( -0.5*((d-dbar).^2)/(sd^2) );
ANcheck = Dd*sum(pN);
dbarNcheck = Dd*sum(d.*pN);
sdNcheck = sqrt(Dd*sum((d-dbarNcheck).^2 .* pN));

fprintf('exact    A %f dbar %f sd %f\n', 1, dbar, sd);
fprintf('PE       A %f dbar %f sd %f\n', AEcheck, dbarEcheck, sdEcheck);
fprintf('PN       A %f dbar %f sd %f\n', ANcheck, dbarNcheck, sdNcheck);

figure(1);
clf;
set(gca, 'LineWidth', 2);
hold on;
axis( [dmin, dmax, 0, 1] );
plot(d, pE, 'r-', 'LineWidth', 3 );
plot(d, pN, 'B-', 'LineWidth', 3 );
xlabel('d');
ylabel('p(d)');

% realizations of two-sided exponential distribution, using one-sided
% MatLab function
Nr = 10000;
mu = sd/sqrt(2);
dr = dbar+(2*(random('unid',2,Nr,1)-1)-1) .* random('exponential',mu,Nr,1);
% histogram
bins=-5+10*[0:100]'/100;
Db=bins(2)-bins(1);
pdest=hist(dr,bins)/(Nr*Db);
% max likelihood estimate of mean and stddev
dbarest = median(dr);
sdest = (sqrt(2)/Nr)*sum(abs(dr-dbarest));

figure(2);
clf;
set(gca, 'LineWidth', 2);
hold on;
axis( [-5, 5, 0, max(pE)] );
plot(bins,pdest,'k-','LineWidth',3);
plot(d, pE, 'r-', 'LineWidth', 2 );
xlabel('d');
ylabel('p(d)');

fprintf('Maximum liklihood estimates for exponential distribution\n');
fprintf('mean %f sd %f\n', dbarest, sdest);


