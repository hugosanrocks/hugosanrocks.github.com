% gda02_07 
%
% 2D Normal distribution, uncorrelated
%

% d-axis
Dd = 0.1;
N = 101;
d1 = Dd*[0:N-1]';
d2 = Dd*[0:N-1]';
dmin=0;
dmax=10;

d1bar = 5;
d2bar = 5;
sd1 = 1.5;
sd2 = 0.5;
cov = 0.4;
C=zeros(2,2);
C(1,1)=sd1^2;
C(2,2)=sd2^2;
C(1,2)=cov;
C(2,1)=cov;
norm = 2*pi*sqrt(det(C));
CI=inv(C);

P=zeros(N,N);
for i = [1:N]
for j = [1:N]
    dd = [ dmin+Dd*(i-1)-d1bar, dmin+Dd*(j-1)-d2bar ]';
    P(i,j) = exp(-0.5*dd'*CI*dd)/norm;
end
end

A = sum(sum(P))*(Dd^2);

gda_draw(' ',P);
colorbar;
