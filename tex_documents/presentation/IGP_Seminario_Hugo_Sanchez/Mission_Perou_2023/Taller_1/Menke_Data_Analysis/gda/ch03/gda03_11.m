% gda03_11
%
% two examples of variance

% z's
N=101;
zmin=0;
zmax=100;
Dz=(zmax-zmin)/(N-1);
z=zmin+Dz*[0:N-1]';

M=N;
mtrue = ones(M,1);

G1=toeplitz( ones(N,1), [1, zeros(1,N-1)] );
G2=toeplitz( [1, 1, zeros(1, N-2)]', [1, zeros(1,N-1)]  );
d1true = G1*mtrue;
d2true = G2*mtrue;
sd=0.1;
d1obs = d1true + random('Normal',0,sd,N,1);
d2obs = d2true + random('Normal',0,sd,N,1);

m1est = (G1'*G1)\(G1'*d1obs);
m2est = (G2'*G2)\(G2'*d2obs);

C1 = (sd^2) * inv(G1'*G1);
sm1 = sqrt(diag(C1));
C2 = (sd^2) * inv(G2'*G2);
sm2 = sqrt(diag(C2));

% plot
figure(1);
clf;
pmmin=-3;
pmmax=3;
psmin=0;
psmax=1;

subplot(2,1,1);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pmmin, pmmax ]' );
plot( z, mtrue, 'k-', 'LineWidth', 2 );
ylabel('m');
xlabel('z');
plot( [zmin, zmax ]', [0, 0]', 'k-', 'LineWidth', 2 );
plot( z, m2est, 'b-', 'LineWidth', 3 );
plot( z, m1est, 'k-', 'LineWidth', 3 );
plot( z, m1est, 'r-', 'LineWidth', 3 );

subplot(2,1,2);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, psmin, psmax ]' );
plot( z, sm1, 'r-', 'LineWidth', 3 );
plot( z, sm2, 'b-', 'LineWidth', 3 );
ylabel('sm');
xlabel('z');

