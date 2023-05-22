% gda02_08
%
% 2D Normal distribution, uncorrelated, + correlation, - correlation
%

% d-axis
Dd = 0.1;
N = 101;
d1 = Dd*[0:N-1]';
d2 = Dd*[0:N-1]';
dmin=0;
dmax=10;


% uncorrelated
d1bar = 5;
d2bar = 5;
sd1 = 1.25;
sd2 = 0.75;
cov = 0.0;
C=zeros(2,2);
C(1,1)=sd1^2;
C(2,2)=sd2^2;
C(1,2)=cov;
C(2,1)=cov;
norm = 2*pi*sqrt(det(C));
CI=inv(C);
P1=zeros(N,N);
for i = [1:N]
for j = [1:N]
    dd = [ dmin+Dd*(i-1)-d1bar, dmin+Dd*(j-1)-d2bar ]';
    P1(i,j) = exp(-0.5*dd'*CI*dd)/norm;
end
end

mycov=0.5;

% positively correlated
d1bar = 5;
d2bar = 5;
sd1 = 1.25;
sd2 = 0.75;
C=zeros(2,2);
C(1,1)=sd1^2;
C(2,2)=sd2^2;
C(1,2)=mycov;
C(2,1)=mycov;
norm = 2*pi*sqrt(det(C));
CI=inv(C);
P2=zeros(N,N);
for i = [1:N]
for j = [1:N]
    dd = [ dmin+Dd*(i-1)-d1bar, dmin+Dd*(j-1)-d2bar ]';
    P2(i,j) = exp(-0.5*dd'*CI*dd)/norm;
end
end

% negatively
d1bar = 5;
d2bar = 5;
sd1 = 1.25;
sd2 = 0.75;
C=zeros(2,2);
C(1,1)=sd1^2;
C(2,2)=sd2^2;
C(1,2)=-mycov;
C(2,1)=-mycov;
norm = 2*pi*sqrt(det(C));
CI=inv(C);
P3=zeros(N,N);
for i = [1:N]
for j = [1:N]
    dd = [ dmin+Dd*(i-1)-d1bar, dmin+Dd*(j-1)-d2bar ]';
    P3(i,j) = exp(-0.5*dd'*CI*dd)/norm;
end
end

gda_draw(' ',P1,' ',P2,' ',P3);
colorbar;
