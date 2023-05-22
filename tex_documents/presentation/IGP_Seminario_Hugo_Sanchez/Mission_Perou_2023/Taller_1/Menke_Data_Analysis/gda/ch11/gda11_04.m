% gda11_04
% simple 1D backprojection example

M=201;
Dx=1.0;
x = Dx*[0:M-1]';
xmax=max(x);

% true model
sigma=12;
sigma2=sigma^2;
xbar1 = 3*xmax/8;
xbar2 = 5*xmax/8;
f1=1.0;
f2=2.0;
mtrue = sin(f1*x).*exp(-((x-xbar1).^2)/(2*sigma2)) + sin(f2*x).*exp(-((x-xbar2).^2)/(2*sigma2));
mtrue=mtrue-mean(mtrue);

% data is integral of model
dobs = Dx*cumsum(mtrue);

% plot true model
figure(1);
clf;
subplot(3,1,1);
set(gca,'LineWidth',3);
hold on;
axis( [0, M, min(mtrue), max(mtrue) ] );
plot( x, mtrue, 'k-', 'LineWidth', 3 );
xlabel('x');
ylabel('m');

% use L-inverse, the derivative operator
mest1 = diff(dobs)/Dx;

subplot(3,1,2);
set(gca,'LineWidth',3);
hold on;
axis( [0, M, min(mest1), max(mest1) ] );
plot( x(1:end-1), mest1, 'k-', 'LineWidth', 3 );
xlabel('x');
ylabel('m');

mest2 = flipud(Dx*cumsum(flipud(dobs)));

subplot(3,1,3);
set(gca,'LineWidth',3);
hold on;
axis( [0, M, min(mest2), max(mest2) ] );
plot( x, mest2, 'k-', 'LineWidth', 3 );
xlabel('x');
ylabel('m');



