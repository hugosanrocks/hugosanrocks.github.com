% gda05_07
%
% examples of probability distributions

% grid
Nm1 = 51;
m1min = 0;
m1max = 5.0;
Dm1 = (m1max-m1min)/(Nm1-1);
m1 = m1min + Dm1*[0:Nm1-1]';

Nm2 = 51;
m2min = 0;
m2max = 5.0;
Dm2 = (m2max-m2min)/(Nm2-1);
m2 = m2min + Dm2*[0:Nm2-1]';

% dist 1
P1=zeros(Nd1,Nd2);
mbar1 = [2.5, 2.5]';
sd12 = 2;
cov = (2-0.1);
C1 = [ [sd12, cov]', [cov, sd12]' ];
CI1 = inv(C1);
DC1 = det(C1);
norm1 = (1/(2*pi)) * (1/sqrt(DC1));

for i=[1:Nm1]
for j=[1:Nm2]
    x1 =[X(i,j), Y(i,j)]' - mbar1;
    P1(i,j) = norm1*exp( -0.5 * x1'*CI1* x1 );
end
end

% distribution 2, ridge
% Note distribution not normalizable
P2=zeros(Nm1,Nm2);
sda2 = 0.5;
d0a = [2.5, 2.5]';
for i=[1:Nd1]
for j=[1:Nd2]
    dr =[m1(i)-d0a(1), m2(j)-d0a(2)]';
    r2= (dr'*[1,-1]')^2;
    P2(i,j) = 0.2*exp(-0.5*r2/sda);
end
end

gda_draw(' ', P2, ' ', ' ', P1 );





