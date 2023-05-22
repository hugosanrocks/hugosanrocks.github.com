% gda09_02
%
% example of transforming distributions

% model parameter, m
M=200;
mmin = 0;
mmax = 1;
Dm = (mmax-mmin)/(M-1);
m = mmin + Dm*[0:M-1]';

% uniform distribution
Pm = ones(M,1);

% transformation mp = m^2
mp=m;
Pmp = 0.5 ./ sqrt(mp);
Pmp(1)=0.0; % set singularity to zero

% check
Am = Dm*sum(Pm);
Amp = Dm*sum(Pmp);
fprintf('areas: %f %f\n', Am, Amp );

figure(1);
clf;

subplot(1,2,1);
set(gca,'LineWidth',2);
hold on;
axis( [mmin, mmax, 0, 2] );
plot( m, Pm, 'r-', 'LineWidth', 3 );
xlabel('m');
ylabel('p(m)');

subplot(1,2,2);
set(gca,'LineWidth',2);
hold on;
axis( [mmin, mmax, 0, 2] );
plot( mp(2:M), Pmp(2:M), 'b-', 'LineWidth', 3 );
xlabel('m');
ylabel('p(m)');






