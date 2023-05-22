% eda12_03
% function Phi used in Lagrange multiplier figure

% make a grid
N=51;
M=51;
Dx=0.01;
Dy=0.01;
x=Dx*[0:N-1]';
y=Dy*[0:M-1]';

% a long-wavelngth, 2D sinusoid
Phi=-sin(x)*sin(y)';

gda_draw(' ', Phi);