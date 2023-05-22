% gda02_05
%
% calculaion of variance
%

% d-axis
Dd = 0.1;
N = 101;
d = Dd*[0:N-1]';
dmin=0;
dmax=10;

% two Normal pdfs with different variances
dbar = 5;
sd1 = 0.5;
p1 = exp(-0.5*((d-dbar).^2)/sd1^2)/(sqrt(2*pi)*sd1);
norm1 = Dd*sum(p1);

dbar = 5;
sd2 = 1.5;
p2 = exp(-0.5*((d-dbar).^2)/sd2^2)/(sqrt(2*pi)*sd2);
norm2 = Dd*sum(p);

% qudratic
q = (d-dbar).^2;

% products
qp1 = q.*p1;
qp2 = q.*p2;

% estimated variances
sd21 = Dd * sum(qp1);
sd1est = sqrt(sd21);
sd22 = Dd * sum(qp2);
sd2est = sqrt(sd22);
disp(sprintf('std dev 1:  true: %f estimated: %f', sd1, sd1est));
disp(sprintf('std dev 2:  true: %f estimated: %f', sd2, sd2est));

% plot
figure(1);
clf;

top=1;

subplot(2, 3, 1 );
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, 10*top ] );
plot(d,q,'k-','LineWidth',3);
xlabel('d');
ylabel('q(d)');

subplot(2, 3, 2 );
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, top ] );
plot(d,p1,'k-','LineWidth',3);
xlabel('d');
ylabel('p(d)');

subplot(2, 3, 3 );
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, top ] );
plot(d,qp1,'k-','LineWidth',3);
xlabel('d');
ylabel('q(d)*p(d)');

subplot(2, 3, 4 );
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, 10*top ] );
plot(d,q,'k-','LineWidth',3);
xlabel('d');
ylabel('q(d)');

subplot(2, 3, 5 );
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, top ] );
plot(d,p2,'k-','LineWidth',3);
xlabel('d');
ylabel('p(d)');

subplot(2, 3, 6 );
set(gca,'LineWidth',2);
hold on;
axis( [dmin, dmax, 0, top ] );
plot(d,qp2,'k-','LineWidth',3);
xlabel('d');
ylabel('q(d)*p(d)');

