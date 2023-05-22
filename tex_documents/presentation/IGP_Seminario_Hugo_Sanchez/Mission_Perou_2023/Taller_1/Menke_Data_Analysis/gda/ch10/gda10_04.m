% gda10_04
% factor analysis on Atlabtic Rocks dataset
% using singular value decomposition

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
S=D;
[U, LAMBDA, V] = svd(S,0);
lambda = diag(LAMBDA);
Ns = length(lambda);
F = V';
C = U*LAMBDA;

% plot singular values
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
plot( [1:Ns], lambda, 'k-', 'LineWidth', 2 );
plot( [1:Ns], lambda, 'ko', 'LineWidth', 2 );
title('singular values, s(i)');
xlabel('index, i');
ylabel('lambda(i)');

% display first five factors
for j = [1:5]
f1=F(j,:);
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

cmin=(-50);
cmax=50;
figure(2);
clf;
set(gca, 'LineWidth', 2);
hold on;
axis( [cmin, cmax, cmin, cmax, cmin, cmax] );
plot3( C(:,2), C(:,3), C(:,4), 'k.', 'LineWidth', 2 );
plot3( [cmin,cmin], [cmin,cmin], [cmin,cmax], 'k-', 'LineWidth', 2 );
plot3( [cmin,cmin], [cmin,cmax], [cmin,cmin], 'k-', 'LineWidth', 2 );
plot3( [cmin,cmax], [cmin,cmin], [cmin,cmin], 'k-', 'LineWidth', 2 );

plot3( [cmax,cmax], [cmax,cmax], [cmax,cmin], 'k-', 'LineWidth', 2 );
plot3( [cmax,cmax], [cmax,cmin], [cmax,cmax], 'k-', 'LineWidth', 2 );
plot3( [cmax,cmin], [cmax,cmax], [cmax,cmax], 'k-', 'LineWidth', 2 );

plot3( [cmax,cmin], [cmin,cmin], [cmax,cmax], 'k-', 'LineWidth', 2 );
plot3( [cmax,cmax], [cmin,cmin], [cmax,cmin], 'k-', 'LineWidth', 2 );

plot3( [cmin,cmin], [cmax,cmin], [cmax,cmax], 'k-', 'LineWidth', 2 );
plot3( [cmin,cmin], [cmax,cmax], [cmax,cmin], 'k-', 'LineWidth', 2 );

plot3( [cmax,cmax], [cmax,cmin], [cmin,cmin], 'k-', 'LineWidth', 2 );
plot3( [cmax,cmin], [cmax,cmax], [cmin,cmin], 'k-', 'LineWidth', 2 );

xlabel('C(2)');
ylabel('C(3)');
zlabel('C(4)');

    
