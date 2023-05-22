clear all;

% gda04_08
%
% Checkerboard resolution test

% inverse problem is an acoustic tomography problem, where
% the observations are along just rows and columns

% grid of unknowns is Lx by Ly
Lx = 20;
Ly = 20;
M = Lx*Ly;

% observations only along rows and columns
N=Lx+Ly;

% build backward index tables for convenience
ixofj=zeros(M,1); % backward index table, ix(j)
iyofj=zeros(M,1); % backward index table, iy(j)
for ix=[1:Lx]
    for iy=[1:Ly]
        j = (ix-1)*Ly+iy; % map model parameter at (ix,iy) into scalar index j
        ixofj(j)=ix;
        iyofj(j)=iy;
    end 
end

G=zeros(N,M);
% observations across rows
for ix=[1:Lx]
    for iy=[1:Ly]
        j = (ix-1)*Ly+iy; % map model parameter at (ix,iy) into scalar index j
        G(ix,j)=1;
    end 
end
% observations across columns
for iy=[1:Ly]
    for ix=[1:Lx]
        j = (ix-1)*Ly+iy; % map model parameter at (ix,iy) into scalar index j
        G(iy+Lx,j)=1;
    end 
end

% note that this problem is actually mix-determined
% since the sum of all the horizontal ray traveltimes
% equals the sum of all the vertical ray traveltimes
% so use the damped minimum-length solution when
% computing the solution
epsi = 0.0001;
GMG = G'/(G*G'+(epsi^2)*eye(N,N));


% model parameter vector mk for crude checkerboard
mk = zeros(M,1);
for ix=[1:4:Lx]
for iy=[1:4:Ly]
    mk((ix-1)*Ly+iy) = 1;
end
end

% data it predicts
dk=G*mk;
% solve inverse problem, interpret the result as
% a row of the resolution matrix.  In this case, I
% solve the inverse problem using the generalized
% inverse.  But it could as well have been solved
% iterative, using biconjugate gradients.  First
% write  rk = GMG dk = GT (GGT-1) dk = GT x
% with x = (GGT-1) dk or dk = GGT x.  Now solve
% dk = GGT x with biconjugate gradients and then
% rk = GT x;
rk = GMG*dk;
% reorganize to 2D physical model space
Rk=zeros(Lx,Ly);
checkerboard=zeros(Lx,Ly);
for i=[1:M]
    Rk(ixofj(i),iyofj(i))=rk(i);
    checkerboard(ixofj(i),iyofj(i))=mk(i);
end

gda_draw(' ',checkerboard,' ',Rk);

