% gda09_01
%

% fit d(z)
z = [1, 2, 3, 4]';
d = [1, 2, 3, 5]';
N=length(z);
M=2;
G=[ones(N,1), z];
mest = (G'*G)\(G'*d);
dpre = G*mest;
fprintf('d(z): intercept %f slope %f\n', mest(1), mest(2) );

% fit z(d)
G2=[ones(N,1), d];
mest2 = (G2'*G2)\(G2'*z);
dpre2 = G2*mest2;
mest3=zeros(2,1);
mest3(1)=-mest2(1)/mest2(2);
mest3(2)=1/mest2(2);
dpre3=G*mest3;

fprintf('dp(zp): intercept %f slope %f\n', mest2(1), mest2(2) );
fprintf('zp(dp): intercept %f slope %f\n', mest3(1), mest3(2) );

% plot
figure(1);
clf;
subplot(1,3,1);
set(gca,'LineWidth',3);
hold on;
axis( [0, 6, 0, 6] );
plot( z, d, 'ko', 'LineWidth', 3);
plot( z, dpre, 'r-', 'LineWidth', 3);
xlabel('z');
ylabel('d');

subplot(1,3,2);
set(gca,'LineWidth',3);
hold on;
axis( [0, 6, 0, 6] );
plot( d, z, 'ko', 'LineWidth', 3);
plot( d, dpre2, 'g-', 'LineWidth', 3);
xlabel('d');
ylabel('z');

subplot(1,3,3);
set(gca,'LineWidth',3);
hold on;
axis( [0, 6, 0, 6] );
plot( z, d, 'ko', 'LineWidth', 3);
plot( z, dpre, 'r-', 'LineWidth', 3);
plot( z, dpre3, 'g-', 'LineWidth', 3);
xlabel('z');
ylabel('d');





