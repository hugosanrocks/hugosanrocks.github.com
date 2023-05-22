% gda09_12
%
% pdf p(x)

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

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [x1min, x1max, x2min, x2max] );
axis ij;
imagesc( [x1min, x1max], [x2min, x2max], P1 );
plot( x2bar, x1bar, 'wo', 'LineWidth', 3 );
plot( [x2bar, x2bar], [x1min, x1min+0.15], 'w-', 'LineWidth', 3 );
plot( [x2min, x2min+0.15], [x1bar, x1bar], 'w-', 'LineWidth', 3 );
xlabel('x2');
ylabel('x1');
