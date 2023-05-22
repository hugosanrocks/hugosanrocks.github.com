% gda05_17
% illustration of F-test to assess difference in fit of two models

N = 11;
z = [0:N-1]'/(N-1);
dtrue = z - 0.5*z.*z;

% simulated data
sigmad=0.03;
dobs = dtrue + random('Normal', 0, sigmad, N, 1 );

figure(1);
clf;
subplot(2,1,1);
set(gca,'LineWidth',2);
hold on;
axis( [0, 1, -1, 1] );
plot(z,dobs,'ro','LineWidth',3);

% fit 1, straight line
M=2;
G=zeros(N,M);
G(:,1)=1;
G(:,2)=z;
mestA=(G'*G)\(G'*dobs);
dpreA = G*mestA;
plot(z,dpreA,'b-','LineWidth',3);
title('linear fit');
xlabel('z');
ylabel('d(z)');
EA = (dobs-dpreA)'*(dobs-dpreA);
vA = N-M;
disp(sprintf('linear error %f, degrees of freedom %d', EA, vA));

subplot(2,1,2);
set(gca,'LineWidth',2);
hold on;
axis( [0, 1, -1, 1] );
plot(z,dobs,'ro','LineWidth',3);

% fit 2, cubic
M=4;
G=zeros(N,M);
G(:,1)=1;
G(:,2)=z;
G(:,3)=z.*z;
G(:,4)=z.^3;
mestB=(G'*G)\(G'*dobs);
dpreB = G*mestB;
plot(z,dpreB,'b-','LineWidth',3);
title('cubic fit');
xlabel('z');
ylabel('d(z)');
EB = (dobs-dpreB)'*(dobs-dpreB);
vB = N-M;
disp(sprintf('cubic error %f, degrees of freedom %d', EB, vB));

disp(sprintf('improvement in error %f percent', 100*(EA-EB)/EA));

Fobs = (EA/vA) / (EB/vB);
disp(sprintf('1/F %f F %f', 1/Fobs, Fobs));

if( Fobs<1 )
    Fobs=1/Fobs;
end
P = 1 - (fcdf(Fobs,vA,vB)-fcdf(1/Fobs,vA,vB));
Pleft = fcdf(1/Fobs,vA,vB);
Pright = 1-fcdf(Fobs,vA,vB);
disp(sprintf('P(F<%f) = %f', 1/Fobs, Pleft));
disp(sprintf('P(F>%f) = %f', Fobs, Pright));
disp(sprintf('P(F<%f or F>%f) = %f', 1/Fobs, Fobs, P));


