% gda05_15
%
% parameteric function passing thru distribution

% grid

Nd1 = 101;
d1min = 0;
d1max = 5.0;
Dd1 = (d1max-d1min)/(Nd1-1);
d1 = d1min + Dd1*[0:Nd1-1]';

Nm1 = 101;
m1min = 0;
m1max = 5.0;
Dm1 = (m1max-m1min)/(Nm1-1);
m1 = m1min + Dm1*[0:Nm1-1]';

% Case 1: nearly exact (narrow) theory
P1=zeros(Nd1,Nm1);
d1bar = 2.25;
m1bar = 2.08;
bar = [d1bar, m1bar]';
sd1 = 0.5;
sm1 = 1;
C1 = diag( [sd1^2, sm1^2]' );
CI1 = inv(C1);
DC1 = det(C1);
% note not normaalized, so max is unity
for i=[1:Nm1]
for j=[1:Nd1]
    x1 =[d1(i), m1(j)]' - bar;
    P1(i,j) = exp( -0.5 * x1'*CI1*x1 );
end
end

% axis for parametric curve
Ns = 51;
smin = 0;
smax = 5.0;
Ds = (smax-smin)/(Ns-1);
s = smin + Ds*[0:Ns-1]';

% parameric curve
dp = 1+s-2*(s/smax).^2;
mp = s;

% Parametric distribution; not normalizable
P2 = zeros(Nd1,Nm1);
sg = 0.1;
sg2 = sg^2;
for i=[1:Nm1]
for j=[1:Nd1]
    r2 = (d1(i)-dp).^2 + (m1(j)-mp).^2;
    r2min=min(r2);
    P2(i,j) = exp( -r2min/sg2 );
end
end

P3 = P1.*P2;
[tmp, itmp] = max(P3);
[P3max, Pj] = max(tmp);
Pi=itmp(Pj);
Pmaxm1 = m1min+Dm1*(Pj-1);
Pmaxd1 = d1min+Dd1*(Pi-1);

figure(2);
clf;

subplot(1,3,1);
set(gca,'LineWidth',2);
hold on;
axis( [d1min, d1max, m1min, m1max] );
axis ij;
imagesc( [d1min, d1max], [m1min, m1max], P1 );
plot( m1bar, d1bar, 'wo', 'LineWidth', 3 );
plot( [m1bar, m1bar], [d1max, d1max-0.1], 'w-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [d1bar, d1bar], 'w-', 'LineWidth', 3 );
plot( mp, dp, 'w:', 'LineWidth', 2 );
xlabel('m');
ylabel('d');

subplot(1,3,2);
set(gca,'LineWidth',2);
hold on;
axis( [d1min, d1max, m1min, m1max] );
axis ij;
imagesc( [d1min, d1max], [m1min, m1max], P2 );
plot( mp, dp, 'w:', 'LineWidth', 2 );
plot( m1bar, d1bar, 'wo', 'LineWidth', 3 );
plot( [m1bar, m1bar], [d1max, d1max-0.1], 'w-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [d1bar, d1bar], 'w-', 'LineWidth', 3 );
xlabel('m');
ylabel('d');

subplot(1,3,3);
set(gca,'LineWidth',2);
hold on;
axis( [d1min, d1max, m1min, m1max] );
axis ij;
imagesc( [d1min, d1max], [m1min, m1max], P3 );
plot( mp, dp, 'w:', 'LineWidth', 2 );
plot( m1bar, d1bar, 'wo', 'LineWidth', 3 );
plot( Pmaxm1, Pmaxd1, 'ko', 'LineWidth', 3 );
plot( [m1bar, m1bar], [d1max, d1max-0.1], 'w-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [d1bar, d1bar], 'w-', 'LineWidth', 3 );
plot( [Pmaxm1, Pmaxm1], [d1max, d1max-0.1], 'k-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [Pmaxd1, Pmaxd1], 'k-', 'LineWidth', 3 );

xlabel('m');
ylabel('d');



% Case 2: inexact (wide) theory
P1=zeros(Nd1,Nm1);
d1bar = 2.25;
m1bar = 2.08;
bar = [d1bar, m1bar]';
sd1 = 0.5;
sm1 = 1;
C1 = diag( [sd1^2, sm1^2]' );
CI1 = inv(C1);
DC1 = det(C1);
% note not normaalized, so max is unity
for i=[1:Nm1]
for j=[1:Nd1]
    x1 =[d1(i), m1(j)]' - bar;
    P1(i,j) = exp( -0.5 * x1'*CI1*x1 );
end
end

% axis for parametric curve
Ns = 51;
smin = 0;
smax = 5.0;
Ds = (smax-smin)/(Ns-1);
s = smin + Ds*[0:Ns-1]';

% parameric curve
dp = 1+s-2*(s/smax).^2;
mp = s;

% Parametric distribution; not normalizable
P2 = zeros(Nd1,Nm1);
sg = 2;
sg2 = sg^2;
for i=[1:Nm1]
for j=[1:Nd1]
    r2 = (d1(i)-dp).^2 + (m1(j)-mp).^2;
    r2min=min(r2);
    P2(i,j) = exp( -r2min/sg2 );
end
end

P3 = P1.*P2;
[tmp, itmp] = max(P3);
[P3max, Pj] = max(tmp);
Pi=itmp(Pj);
Pmaxm1 = m1min+Dm1*(Pj-1);
Pmaxd1 = d1min+Dd1*(Pi-1);

figure(1);
clf;

subplot(1,3,1);
set(gca,'LineWidth',2);
hold on;
axis( [d1min, d1max, m1min, m1max] );
axis ij;
imagesc( [d1min, d1max], [m1min, m1max], P1 );
plot( m1bar, d1bar, 'wo', 'LineWidth', 3 );
plot( [m1bar, m1bar], [d1max, d1max-0.1], 'w-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [d1bar, d1bar], 'w-', 'LineWidth', 3 );
plot( mp, dp, 'w:', 'LineWidth', 2 );
xlabel('m');
ylabel('d');

subplot(1,3,2);
set(gca,'LineWidth',2);
hold on;
axis( [d1min, d1max, m1min, m1max] );
axis ij;
imagesc( [d1min, d1max], [m1min, m1max], P2 );
plot( mp, dp, 'w:', 'LineWidth', 2 );
plot( m1bar, d1bar, 'wo', 'LineWidth', 3 );
plot( [m1bar, m1bar], [d1max, d1max-0.1], 'w-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [d1bar, d1bar], 'w-', 'LineWidth', 3 );
xlabel('m');
ylabel('d');

subplot(1,3,3);
set(gca,'LineWidth',2);
hold on;
axis( [d1min, d1max, m1min, m1max] );
axis ij;
imagesc( [d1min, d1max], [m1min, m1max], P3 );
plot( mp, dp, 'w:', 'LineWidth', 2 );
plot( m1bar, d1bar, 'wo', 'LineWidth', 3 );
plot( Pmaxm1, Pmaxd1, 'ko', 'LineWidth', 3 );
plot( [m1bar, m1bar], [d1max, d1max-0.1], 'w-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [d1bar, d1bar], 'w-', 'LineWidth', 3 );
plot( [Pmaxm1, Pmaxm1], [d1max, d1max-0.1], 'k-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [Pmaxd1, Pmaxd1], 'k-', 'LineWidth', 3 );

xlabel('m');
ylabel('d');






