% gda01_06
%
% range of p.d.f.'s, from simple to complicated

% p axes
Dm = 0.1;
N = 101;
m1 = Dm*[0:N-1]';
mmin=0;
mmax=10;

sm = 1.0;
m1bar = 5.0;
p1a = exp(-0.5*(m1-m1bar).^2/(sm^2));
norm = Dm*sum(p1a);
p1a = p1a/norm;

sma = 0.7;
m1bara = 3.0;
smb = 1.4;
m1barb = 8.0;
p1b = exp(-0.5*(m1-m1bara).^2/(sma^2))+0.4*exp(-0.5*(m1-m1barb).^2/(sma^2));
norm = Dm*sum(p1b);
p1b = p1b/norm;

p1c = zeros(N,1);
for i=[1:10]
    Ac=random('Uniform',0,1);
    m1barc=random('Uniform',0,10);
    smc=random('Uniform',0.05,1);
    tmp=Ac*exp(-0.5*(m1-m1barc).^2/(smc^2));
    p1c = p1c + tmp;
end
norm = Dm*sum(p1c);
p1c = p1c/norm;

figure(1);
clf;

subplot(1,3,1);
set(gca,'LineWidth',2);
hold on;
axis( [mmin, mmax, 0, 0.5 ] );
plot(m1,p1a,'b-','LineWidth',3);
xlabel('m');
ylabel('p(m)');

subplot(1,3,2);
set(gca,'LineWidth',2);
hold on;
axis( [mmin, mmax, 0, 0.5 ] );
plot(m1,p1b,'b-','LineWidth',3);
xlabel('m');
ylabel('p(m)');

subplot(1,3,3);
set(gca,'LineWidth',2);
hold on;
axis( [mmin, mmax, 0, 0.5 ] );
plot(m1,p1c,'b-','LineWidth',3);
xlabel('m');
ylabel('p(m)');

