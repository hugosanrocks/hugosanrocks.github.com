clear all;
% gda_07
%
% Constructing just one column of the resolution matrix

% Note:
% A row of the resolution matrix R tells you the contributions
% that all the true model parameters make to a single estimated
% model parameter; that is, the estimated model parameter is
% a weighted average of the true model parameter, where the
% elements of the row gives the weights.
% 
% On the other hand, a column of the resolution matrix tells
% you all the estimated model parameters that are influenced
% by a true model parameter.  The column gives the "blur"
% of estimated model parameters that would be observed if
% the true model consisted of just a single spike.
%
% The distinction between rows and columns is not important
% in most flavors of least squares, since R is symmetric.
% It is important in the Backus-Gilbert case, however, because
% R is not symmetric in that case.

% inverse problem considered here is an acoustic tomography
% problem, where the observations are along just rows and
% columns

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

% compute the complete resolution matrix for comparison
% note that R is symmetric in this case: R = GMG*G =
% G' inv(G*G'+(epsi^2)*eye(N,N)) * G is symmetric, since
% the inverse of a symmetric matrix is symmetric
Rres = GMG*G;

% pull out just one column of the resolution matrix, one
% corresponding to a true model parameter near the middle of
% the model volume, at (ix, iy)
ix=floor(Lx/2);
iy=floor(Lx/2);
icolB=(ix-1)*Ly+iy;
RicolB=zeros(Lx,Ly);
for i=[1:M]
    RicolB(ixofj(i),iyofj(i))=Rres(i,icolB);
end

% now construct just that column
% model parameter with unity in that col
mk = zeros(M,1);
mk(icolB) = 1;
% data it predicts
dk=G*mk;
% solve inverse problem, interpret the result as
% a column of the resolution matrix.  In this case, I
% solve the inverse problem using the generalized
% inverse.  But it could as well have been solved
% iteratively, using biconjugate gradients, using
% the following trick: First write  
% rk = GMG dk = GT inv(GGT + e2 I) dk = GT x
% with x = inv(GGT + e2 I) dk or dk = (GGT + e2 I) x.
% Now solve dk = (GGT + e2 I) x
% with biconjugate gradients and then
% rk = GT x;
rk = GMG*dk;
% reorganize to 2D physical model space
Rk=zeros(Lx,Ly);
for i=[1:M]
    Rk(ixofj(i),iyofj(i))=rk(i);
end

gda_draw(' ',RicolB,' ',Rk);

