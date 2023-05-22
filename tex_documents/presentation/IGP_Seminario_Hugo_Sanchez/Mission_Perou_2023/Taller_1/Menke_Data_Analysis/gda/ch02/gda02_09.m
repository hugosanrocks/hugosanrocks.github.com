% gda02_09
%
% 1D uniform p.d.f., p(d)=constant, traansformed to p(m) with m(d)=d^2
% note that m=sqrt(d) and that dm/dd=0.5/sqrt(d)
%

% d-axis
Dd = 0.01;
N = 100;
d = Dd*[1:N]';
dmin=0;
dmax=1;

% m-axis
Dm = 0.01;
M = 100;
m = Dm*[1:M]';
mmin=0;
mmax=1;

% uniform, p(d)
d1bar = 5;
pd = ones(N,1);

% transform to p(m)
J = abs(0.5 ./sqrt(d));
pm = pd.*J;

figure(1);
clf;

subplot(2,1,1);
set(gca,'LineWidth',2,'FontName','Cambria Math','FontAngle','italic');
hold on;
axis( [0, 1, 0, 2]' );
plot(d,pd,'r-','LineWidth',3);
xlabel('d','FontName','Cambria Math','FontAngle','italic');
ylabel('p(d)','FontName','Cambria Math','FontAngle','italic');

subplot(2,1,2);
set(gca,'LineWidth',2,'FontName','Cambria Math','FontAngle','italic');
hold on;
axis( [0, 1, 0, 2]' );
plot(m,pm,'b-','LineWidth',3);
xlabel('d','FontName','Cambria Math','FontAngle','italic');
ylabel('p(m)','FontName','Cambria Math','FontAngle','italic');

