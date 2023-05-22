% gda10_05
% factor analysis on Atlabtic Rocks dataset
% using singular value decomposition
% and the varimax procedure

% load data
D = load('../data/rocks.txt');
sio2 = D(:,1);   % SiO2
tio2 = D(:,2);   % TiO2
als03 = D(:,3);  % Al203
feot = D(:,4);   % FeO-total
mgo = D(:,5);    % MgO
cao = D(:,6);    % CaO
na20 = D(:,7);   % Na2O
k20 = D(:,8);    % K2O
Ns = size(D);
N = Ns(1);
M = Ns(2);

% compute factors and factor loadings using singular value decompostion
[U, S, V] = svd(D,0);

% keep only first five singular values
P=5;
F = V(:,1:P)';
C = U(:,1:P)*S(1:P,1:P);

% initial rotated factor matrix, FP, abd rotation matrix, MR
MR=eye(P,P);
FP=F;

% spike these factors using the varimax procedure
k = [2, 3, 4, 5]';
Nk = length(k);

for iter = [1:3]
for ii = [1:Nk]
for jj = [ii+1:Nk]
    
% spike factors i and j
i=k(ii);
j=k(jj);

% copy factors from matrix to vectors
fA = FP(i,:)';
fB = FP(j,:)';

% standard varimax procedure to determine rotation angle q
u = fA.^2 - fB.^2;
v = 2* fA .* fB;

A = 2*M*u'*v;
B = sum(u)*sum(v);
top = A - B;

C = M*(u'*u-v'*v);
D = (sum(u)^2)-(sum(v)^2);
bot =  C - D;

q = 0.25 * atan2(top,bot);

cq = cos(q);
sq = sin(q);

fAp =  cq*fA + sq*fB;
fBp = -sq*fA + cq*fB;

% put back into factor matrix, FP
FP(i,:) = fAp';
FP(j,:) = fBp';

% accumulate rotation
mA = MR(i,:)';
mB = MR(j,:)';
mAp =  cq*mA + sq*mB;
mBp = -sq*mA + cq*mB;
MR(i,:) = mAp';
MR(j,:) = mBp';

end
end
end

% new factor loadings
CP=C*MR';

% display first five factors
for j = [1:5]
f1=FP(j,:);
disp(sprintf('factor %d', j));
disp(sprintf('SiO2 %f', f1(1)));
disp(sprintf('TiO2 %f', f1(2)));
disp(sprintf('Al203 %f', f1(3)));
disp(sprintf('FeO-total %f', f1(4)));
disp(sprintf('MgO %f', f1(5)));
disp(sprintf('CaO %f', f1(6)));
disp(sprintf('Na2O %f', f1(7)));
disp(sprintf('K2O %f', f1(8)));
disp(sprintf(' '));
end


gda_draw_bw(' ', abs(F(2,:))', 'caption f2', abs(F(3,:))', 'caption f3', abs(F(4,:))', 'caption f4', abs(F(5,:))', 'caption f5', ...
         ' ', abs(FP(2,:))', 'caption f2p', abs(FP(3,:))', 'caption f3p', abs(FP(4,:))', 'caption f4p', abs(FP(5,:))', 'caption f5p');


