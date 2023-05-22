% gda05_11
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

% dist 1
P1=zeros(Nd1,Nm1);
d1bar = 2.25;
m1bar = 2.08;
bar = [d1bar, m1bar]';
sd1 = 0.5;
sm1 = 1;
C1 = diag( [sd1^2, sm1^2]' );
CI1 = inv(C1);
DC1 = det(C1);
norm1 = (1/(2*pi)) * (1/sqrt(DC1));

for i=[1:Nm1]
for j=[1:Nd1]
    x1 =[d1(i), m1(j)]' - bar;
    P1(i,j) = norm1*exp( -0.5 * x1'*CI1*x1 );
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

% P on parameteric curve
ipd = 1+floor((dp-d1min)/Dd1);
ipm = 1+floor((mp-m1min)/Dm1);
% insure indices in range
i=find(ipd<1);
ipd(i)=1;
i=find(ipd>Nd1);
ipd(i)=Nd1;
i=find(ipm<1);
ipm(i)=1;
i=find(ipm>Nm1);
ipm(i)=Nm1;
Ps=zeros(Ns,1);
% evaluate P at indices
for i = [1:Ns]
    Ps(i) = P1(ipd(i), ipm(i));
end

% maximum along curve
[Pmax, ismax]=max(Ps);
d1smax = dp(ismax);
m1smax = mp(ismax);

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [d1min, d1max, m1min, m1max] );
axis ij;
imagesc( [d1min, d1max], [m1min, m1max], P1 );
plot( m1bar, d1bar, 'wo', 'LineWidth', 3 );
plot( [m1bar, m1bar], [d1max, d1max-0.1], 'w-', 'LineWidth', 3 );
plot( [m1min, m1min+0.1], [d1bar, d1bar], 'w-', 'LineWidth', 3 );
plot( mp, dp, 'w-', 'LineWidth', 3 );
plot( m1smax, d1smax, 'ko', 'LineWidth', 4);
plot( [m1min, m1smax], [d1smax, d1smax], 'w:', 'LineWidth', 2);
plot( [m1smax, m1smax], [d1max, d1smax], 'w:', 'LineWidth', 2);
xlabel('m');
ylabel('d');


figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [smin, smax, 0, 0.3] );
axis xy;
plot( s, Ps, 'b-', 'Linewidth', 3 );
xlabel('s');
ylabel('P(s)');



