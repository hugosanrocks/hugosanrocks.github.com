% gda02_11
%
% product of two 2D Normal distributions
%

% d-axis
Dd = 0.1;
N = 101;
d1 = Dd*[0:N-1]';
d2 = Dd*[0:N-1]';
dmin=0;
dmax=10;

% P1
d1bar = 4;
d2bar = 6;
sd1 = 1.25;
sd2 = 0.75;
cov = 0.5;
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
% save these parameters
C1=C;
C1I=CI;
DBAR1=[d1bar, d2bar]';

% P2
d1bar = 6;
d2bar = 4;
sd1 = 0.75;
sd2 = 1.25;
cov = -0.5;
C=zeros(2,2);
C(1,1)=sd1^2;
C(2,2)=sd2^2;
C(1,2)=cov;
C(2,1)=cov;
norm = 2*pi*sqrt(det(C));
CI=inv(C);
P2=zeros(N,N);
for i = [1:N]
for j = [1:N]
    dd = [ dmin+Dd*(i-1)-d1bar, dmin+Dd*(j-1)-d2bar ]';
    P2(i,j) = exp(-0.5*dd'*CI*dd)/norm;
end
end
% save these parameters
C2=C;
C2I=CI;
DBAR2=[d1bar, d2bar]';

P1P2 = P1.*P2;
norm = (Dd^2)*sum(sum(P1P2));

% from analytic formula
C3 = inv( C1I + C2I );
DBAR3 = C3 * (C1I*DBAR1 + C2I*DBAR2);
d1bar = DBAR3(1);
d2bar = DBAR3(2);
C=C3;
norm = 2*pi*sqrt(det(C));
CI=inv(C);
P3=zeros(N,N);
for i = [1:N]
for j = [1:N]
    dd = [ dmin+Dd*(i-1)-d1bar, dmin+Dd*(j-1)-d2bar ]';
    P3(i,j) = exp(-0.5*dd'*CI*dd)/norm;
end
end

% plot the analytic one, too, to check results
% gda_draw(' ',P1,' ',P2,' ',P1P2,' ',P3);

gda_draw(' ',P1,' ',P2,' ',P1P2);
