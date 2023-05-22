% gda05_09

% relative entropy of one Gaussian distribution p(m)
% with respect to another q(m)

% grid
N=101;
mmin = -25;
mmax = 25;
Dm = (mmax-mmin)/(N-1);
m = mmin + Dm*[0:N-1]';

% p(m) = pA(m)
mbarp = 0;
sigmamp = 1;
p = (1 /(sqrt(2*pi)*sigmamp))*exp(-((m-mbarp).^2)/(2*sigmamp*sigmamp));
normp = Dm*sum(p);

% q(m) = pN(m)
mbarq = 0;
sigmamq = 5;
q = (1 /(sqrt(2*pi)*sigmamq))*exp(-((m-mbarq).^2)/(2*sigmamq*sigmamq));
normq = Dm*sum(q);

% plot
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [mmin, mmax, 0, max(p)] );
plot( m, p, 'r-', 'LineWidth', 3);
plot( m, q, 'g-', 'LineWidth', 3);
xlabel('m');
ylabel('p and q');

% relative entropy S
r = (sigmamp^2)/(sigmamq^2);
Sanalytic = ((mbarp-mbarq)^2)/(2*sigmamq*sigmamq) + 0.5*(r-1-log(r));
Snumeric = Dm*sum( p .* log( p ./ q ) );
fprintf('S = %f (analytic) and %f (numeric)\n', Sanalytic, Snumeric );

% relative entropy as a function of sigmamp
Nv=100;
sigmampv = sigmamq*[1:Nv]'/Nv;
rv = (sigmampv.^2)/(sigmamq^2);
Sv = ((mbarp-mbarq)^2)./(2*sigmamq*sigmamq) + 0.5*(rv-1-log(rv));

% plot
figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [0, sigmamq, 0, max(Sv)] );
plot( sigmampv, Sv, 'k-', 'LineWidth', 3);
plot( sigmamp, Sanalytic, 'ro', 'LineWidth', 3);
xlabel('sigmamp');
ylabel('S');





