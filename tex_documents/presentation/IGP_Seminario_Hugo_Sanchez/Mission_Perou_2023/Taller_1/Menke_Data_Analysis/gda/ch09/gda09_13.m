% gda09_13
%
% parameteric function passing thru distribution

% grid

Nx1 = 101;
x1min = 0;
x1max = 5.0;
Dx1 = (x1max-x1min)/(Nx1-1);
x1 = x1min + Dx1*[0:Nx1-1]';

Nx2 = 101;
x2min = 0;
x2max = 5.0;
Dx2 = (x2max-x2min)/(Nx2-1);
x2 =x2min + Dx2*[0:Nx2-1]';

% pdf
P1=zeros(Nx1,Nx2);
x1bar = 2.25;
x2bar = 2.08;
bar = [x1bar, x2bar]';
sx1 = 0.5;
sx2 = 1.0;
C1 = diag( [sx1^2, sx2^2]' );
CI1 = inv(C1);
DC1 = det(C1);
norm1 = (1/(2*pi)) * (1/sqrt(DC1));

for i=[1:Nx1]
for j=[1:Nx2]
    x =[x1(i), x2(j)]' - bar;
    P1(i,j) = norm1*exp( -0.5 * x'*CI1*x );
end
end

% axis for parametric curve
Ns = 51;
smin = 0;
smax = 5.0;
Ds = (smax-smin)/(Ns-1);
s = smin + Ds*[0:Ns-1]';

% parameric curve
x2p = 1+s+sin(2*pi*s/smax)-2*(s/smax).^2;
x1p = s;

% P on parameteric curve
ipx1 = 1+floor((x1p-x1min)/Dx1);
ipx2 = 1+floor((x2p-x2min)/Dx2);
% insure indices in range
i=find(ipx1<1);
ipx1(i)=1;
i=find(ipx1>Nx1);
ipx1(i)=Nx1;
i=find(ipx2<1);
ipx2(i)=1;
i=find(ipx2>Nx2);
ipx2(i)=Nx2;
Ps=zeros(Ns,1);
% evaluate P at indices
for i = [1:Ns]
    Ps(i) = P1(ipx1(i), ipx2(i));
end

% maximum along curve
[Pmax, ismax]=max(Ps);
x1smax = x1p(ismax);
x2smax = x2p(ismax);
smaxP = x1smax;

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [x1min, x1max, x2min, x2max] );
axis ij;
imagesc( [x1min, x1max], [x2min, x2max], P1 );
plot( x2bar, x1bar, 'wo', 'LineWidth', 3 );
plot( [x2bar, x2bar], [x1min, x1min+0.1], 'w-', 'LineWidth', 3 );
plot( [x2min, x2min+0.1], [x1bar, x1bar], 'w-', 'LineWidth', 3 );
plot( x2p, x1p, 'w-', 'LineWidth', 3 );
plot( x2smax, x1smax, 'ko', 'LineWidth', 4);
plot( [x2min, x2smax], [x1smax, x1smax], 'w:', 'LineWidth', 2);
plot( [x2smax, x2smax], [x1min, x1smax], 'w:', 'LineWidth', 2);
xlabel('x2');
ylabel('x1');

figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [smin, smax, 0, 0.3] );
axis xy;
plot( s, Ps, 'b-', 'Linewidth', 3 );
xlabel('s');
ylabel('P(s)');

plot( [smaxP, smaxP], [0, 0.03], 'k-', 'LineWidth', 3);
plot( smaxP, Pmax, 'bo', 'LineWidth', 3);

% calculate mean of distribution
norm = Ds*sum(Ps);
Ps = Ps/norm;
smean = Ds*sum(s.*Ps);
plot( [smean, smean], [0, 0.02], 'k-', 'LineWidth', 3);

