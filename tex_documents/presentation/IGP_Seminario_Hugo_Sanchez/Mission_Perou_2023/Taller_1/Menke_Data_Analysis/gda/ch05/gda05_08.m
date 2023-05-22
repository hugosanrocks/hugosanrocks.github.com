% gda05_08
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
for i=[1:Nm1]
for j=[1:Nm2]
    P1(i,j) = m1(i)<=m2(j);
end
end

% for test purposes
% A1 = Dd1*Dd2*sum(sum(P1));

gda_draw(' ', P1 );





