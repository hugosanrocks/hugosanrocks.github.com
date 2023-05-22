% gda07_04

M=20;
mmin = 0.0;
mmax=5;
Dm = (mmax-mmin)/(M-1);
m = mmin + Dm*[0:M-1]';

g1 = [1, 1, 1, 1, 1]';
L=length(g1);
g=[ g1', zeros(1,M-L) ]';
N=M;
G1=zeros(N,M);
for i=[1:M]
   G1(i,:) = circshift(g,i-1)';
end
G1=fliplr(G1);

[U, S1, V] = svd(G1);
s1 = zeros(M,1);
sp = diag(S1);
p = length(sp);
s1 = [ sp', zeros(1,M-p) ]';

figure(2);
clf;

subplot(2,1,1);
set(gca,'LineWidth',2);
hold on;
axis( [1, M, 0 max(s1) ] );
plot( [1:M]', s1, 'k-', 'LineWidth', 2 );
hold on;
plot( [1:M]', s1, 'ko', 'LineWidth', 2 );
xlabel('i');
ylabel('S_i');

cmin=0;
cmax=10*(1/M);
c = cmin + (cmax-cmin)*[0:M-1]'/(M-1);
G2 = exp( -(c * [1:M]) ) - 0.9*exp( -(2*c * [1:M]).^2 );

[U, S1, V] = svd(G2);
s1 = zeros(M,1);
sp = diag(S1);
p = length(sp);
s2 = [ sp', zeros(1,M-p) ]';

subplot(2,1,2);
set(gca,'LineWidth',2);
hold on;
axis( [1, M, 0 max(s2) ] );
plot( [1:M]', s2, 'k-', 'LineWidth', 2 );
hold on;
plot( [1:M]', s2, 'ko', 'LineWidth', 2 );
xlabel('i');
ylabel('S_i');

gda_draw(G1,' ',G2);
