% gda03_12
%
% Examine error surface of intercept and slope in a straight
% line fit to synthetic data

clear all;

% z's
N=30;
zmin=-5;
zmax=5;
z = sort(random('Uniform',zmin,zmax,N,1));

% PART 1: data evenly spread along interval

% d = a + b*z + noise
a=2.0;
b=1.0;
sd=0.51;
dobs = a+b*z+random('Normal',0,sd,N,1);

% grid
Na=101;
amin=0;
amax=4;
Da = (amax-amin)/(Na-1);
a = amin + Da*[0:Na-1]';
Nb=101;
bmin=0;
bmax=4;
Db = (bmax-bmin)/(Nb-1);
b = bmin + Db*[0:Nb-1]';

% populate grid with errors
EA = zeros(Na,Nb);
for i=[1:Na]
for j=[1:Nb]
    ao = amin+Da*(i-1);
    bo = bmin+Db*(j-1);
    dpre = ao + bo*z;
    e = dobs-dpre;
    EA(i,j)=e'*e;
end
end

% find minimum error
[Ep, p] = min(EA);
[EAmin, c1] = min(Ep);
r1 = p(c1);
a1 = amin+Da*(r1-1);
b1 = bmin+Db*(c1-1);
dpre = a1 + b1*z;

% covariance calculation
% least squares formula
G = [ones(N,1), z];
C1 = (sd^2)*inv(G'*G);
disp('case 1: data straddles origin');
disp(sprintf('    method 1: sm1 %f  sm2 %f cov %f', sqrt(C1(1,1)), sqrt(C1(2,2)), C1(1,2) ));
% curvature of error surface formula
j=1;
d2Eda2 = (EA(r1+j,c1)-2*EA(r1,c1)+EA(r1-j,c1))/((j*Da)^2);
d2Edb2 = (EA(r1,c1+j)-2*EA(r1,c1)+EA(r1,c1-j))/((j*Db)^2);
d2Edadb = (EA(r1+j,c1+j)-EA(r1+j,c1-j)-EA(r1-j,c1+j)+EA(r1-j,c1-j))/(4*j*Da*j*Db);
DA=zeros(2,2);
DA(1,1)=d2Eda2;
DA(1,2)=d2Edadb;
DA(2,1)=d2Edadb;
DA(2,2)=d2Edb2;
C2 = (sd^2)*inv(DA/2);
disp(sprintf('    method 2: sm1 %f  sm2 %f cov %f', sqrt(C2(1,1)), sqrt(C2(2,2)), C2(1,2) ));
disp(' ');

% plot data and fit
figure(1);
clf;
subplot(1,2,1);
set(gca, 'LineWidth', 2);
hold on;
axis( [zmin, zmax, -10, 10] );
plot( z, dobs, 'ro', 'LineWidth', 3);
plot( z, dpre, 'b-', 'LineWidth', 2);

% plot error surface
figure(2);
clf();

subplot(1,2,1);
set(gca, 'LineWidth', 2);
hold on;
axis ij;
axis equal;
axis( [bmin, bmax, amin, amax] );
imagesc( [bmin, bmax], [amin, amax], EA );
plot( b1, a1, 'wo', 'LineWidth', 2);

EAmax=max(max(EA));
[X, Y] = meshgrid(b,a);
DeltaE=(EAmax-EAmin)/100;
contour(X,Y,EA,[EAmin+DeltaE, EAmin+DeltaE],'w-','LineWidth',3);
colorbar;

% PART 2: data bunched up at end of interval

% z's
N=30;
zmin=-5;
zmax=5;
z = sort(random('Uniform',zmin+1*(zmax-zmin)/2,zmax,N,1));

% d = a + b*z + noise
a=2.0;
b=1.0;
sd=0.5;
dobs = a+b*z+random('Normal',0,sd,N,1);

% grid
Na=101;
amin=0;
amax=4;
Da = (amax-amin)/(Na-1);
a = amin + Da*[0:Na-1]';
Nb=101;
bmin=0;
bmax=4;
Db = (bmax-bmin)/(Nb-1);
b = bmin + Db*[0:Nb-1]';

% populate grid with errors
EB = zeros(Na,Nb);
for i=[1:Na]
for j=[1:Nb]
    ao = amin+Da*(i-1);
    bo = bmin+Db*(j-1);
    dpre = ao + bo*z;
    e = dobs-dpre;
    EB(i,j)=e'*e;
end
end

% find minimum error
[Ep, p] = min(EB);
[EBmin, c1] = min(Ep);
r1 = p(c1);
a1 = amin+Da*(r1-1);
b1 = bmin+Db*(c1-1);
dpre = a1 + b1*z;

% covariance calculation
% least squares formula
G = [ones(N,1), z];
C1 = (sd^2)*inv(G'*G);
disp('case 2: data to one side of origin');
disp(sprintf('    method 1: sm1 %f  sm2 %f cov %f', sqrt(C1(1,1)), sqrt(C1(2,2)), C1(1,2) ));
% curvature of error surface formula
j=1;
d2Eda2 = (EB(r1+j,c1)-2*EB(r1,c1)+EB(r1-j,c1))/((j*Da)^2);
d2Edb2 = (EB(r1,c1+j)-2*EB(r1,c1)+EB(r1,c1-j))/((j*Db)^2);
d2Edadb = (EB(r1+j,c1+j)-EB(r1+j,c1-j)-EB(r1-j,c1+j)+EB(r1-j,c1-j))/(4*j*Da*j*Db);
DB=zeros(2,2);
DB(1,1)=d2Eda2;
DB(1,2)=d2Edadb;
DB(2,1)=d2Edadb;
DB(2,2)=d2Edb2;
C2 = (sd^2)*inv(DB/2);
disp(sprintf('    method 2: sm1 %f  sm2 %f cov %f', sqrt(C2(1,1)), sqrt(C2(2,2)), C2(1,2) ));
disp(' ');

% plot data and fit
figure(1);
subplot(1,2,2);
set(gca, 'LineWidth', 2);
hold on;
axis( [zmin, zmax, -10, 10] );
plot( z, dobs, 'ro', 'LineWidth', 3);
plot( z, dpre, 'b-', 'LineWidth', 2);

% plot error surface
figure(2)
subplot(1,2,2);
set(gca, 'LineWidth', 2);
hold on;
axis ij;
axis equal;
axis( [bmin, bmax, amin, amax] );
imagesc( [bmin, bmax], [amin, amax], EB );
plot( b1, a1, 'wo', 'LineWidth', 2);

EBmax=max(max(EB));
[X, Y] = meshgrid(b,a);
% note: use same DeltaE as previous plot
contour(X,Y,EB,[EBmin+DeltaE, EBmin+DeltaE],'w-','LineWidth',3);
colorbar;







