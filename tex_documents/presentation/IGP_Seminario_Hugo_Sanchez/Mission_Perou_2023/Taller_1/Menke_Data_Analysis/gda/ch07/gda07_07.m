% gda07_07
clear all;

m1min=0;
m1max=2;
Nm1 = 41;
Dm1 = (m1max-m1min)/(Nm1-1);
m1 = m1min + Dm1*[0:Nm1-1]';

m2min=0;
m2max=2;
Nm2 = 41;
Dm2 =(m2max-m2min)/(Nm2-1);
m2 = m2min + Dm2*[0:Nm2-1]';

X = m1*ones(Nm2,1)';
Y = ones(Nm1,1)*m2';

% three inequality constraints
% m1-m2>=0          [1   -1] [0]
% 0.5*m1+m2>=1      [0.5  1] [1]
% m1>=0.2           [1    0] [0.2]

% in the last constraint, the 0.2 can be diddled
% right now this constraint does not affect the
% feasible region, but changing 0.2 to 1.2 cnages
% the region considerably

H = [ [1, 0.5, 1]', [-1, 1, 0]' ];
h = [0, 1, 0.2]';

p=1;
C1 = zeros(Nm1,Nm2);
for i=[1:Nm1]
for j=[1:Nm2]
    m = [ m1(i), m2(j) ]';
    C1(i,j)=H(p,:)*m-h(p);
end
end
C1a = (C1>=0)+0.001;

p=2;
C2 = zeros(Nm1,Nm2);
for i=[1:Nm1]
for j=[1:Nm2]
    m = [ m1(i), m2(j) ]';
    C2(i,j)=H(p,:)*m-h(p);
end
end
C2a = (C2>=0)+0.001;

p=3;
C3 = zeros(Nm1,Nm2);
for i=[1:Nm1]
for j=[1:Nm2]
    m = [ m1(i), m2(j) ]';
    C3(i,j)=H(p,:)*m-h(p);
end
end
C3a = (C3>=0)+0.001;

CT = ((C1>=0)&(C2>=0)&(C3>=0))+0.001;
    
Gp = [H, h]';
dp = [zeros(1,length(H(1,:))), 1]';
mp = lsqnonneg(Gp,dp);

ep = dp - Gp*mp;
m = -ep(1:end-1)/ep(end);
im1est = floor((m(1)-m1min)/Dm1)+1;
jm2est = floor((m(2)-m2min)/Dm2)+1;
CT(im1est,jm2est)=0.5;
gda_draw(C1a,' ',C2a,' ',C3a,' ',CT);

e=H*m-h;
for i=[1:3]
    fprintf('Constraint %d: Hm-h = %f\n', i, e(i) );
end










