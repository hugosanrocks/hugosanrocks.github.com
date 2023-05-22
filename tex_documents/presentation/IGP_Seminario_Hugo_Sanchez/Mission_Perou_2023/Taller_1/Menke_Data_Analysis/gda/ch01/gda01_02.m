% gda01_
% 
% setup for parabola

% Hansen, J., Mki. Sato, R. Ruedy, K. Lo, D.W. Lea, and M. Medina-Elizade,
% 2006: Global temperature change. Proc. Natl. Acad. Sci., 103, 14288-14293,
% doi:10.1073/pnas.0606291103. 

D=load('../data/global_temp.txt');
t=D(:,1);
d=D(:,2);
N=length(d);

% set up data kernel
M=3;
G=[ones(N,1), t, t.^2];

G