% gda03_09
% weighted damped least squares example

% need these two commands to use bconj() biconjugate gradient solver
clear F;
global F;

% the data is a sinusoid in an auxillary varible z;
M=101;
Dz = 1.0;
z = Dz*[0:M-1]'; % z is an auxiallty variable
zmax = max(z);
mtrue = sin( 3*pi*z/zmax );

% let us suppose that we observe the sine wave at the following z indices
index = [ 1, 9, 15, 17, 37, 49, 61, 73, 85, 91, M ]';
N = length(index);
zobs=z(index);
sigmad=0.0;
dobs = sin( 3*pi*zobs/zmax ) + random('Normal',0,sigmad,N,1);

% the N data equations are just m = dobs.  The only trick is lining
% up the corresponding elements of m and dobs, since they are not of
% the same length
F = spalloc( N+M, M, 3*N );
f = zeros(N+M, 1);
for i = [1:N]
    F(i, index(i)) = 1;
    f(i) = dobs(i);
end

% now implement 2nd derivative smoothness constraints of all interior m's
epsilon=1.0;
rDz = 1/Dz;
rDz2 = 1/Dz^2;
for i = [1:M-2]
    F(i+N, i) = epsilon*rDz2;
    F(i+N, i+1) = -2*epsilon*rDz2;
    F(i+N, i+2) = epsilon*rDz2;
    f(i+N) = 0;
end

% now implement 1st derivative flatness constraints for m's at the edges
F(N+M-1, 1) = -epsilon*rDz; F(N+M-1, 2) = epsilon*rDz;
f(N+M-1) = 0;
F(N+M, M-1) = -epsilon*rDz; F(N+M, M) = epsilon*rDz;
f(N+M) = 0;

% least squares solution, using bicg()
tol = 1e-6;
maxit = 3*M;
mest = bicg( @weightedleastsquaresfcn, F'*f, tol, maxit );

% plot
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [0, zmax, -1, 1 ] );
plot( z, mtrue, 'r-', 'LineWidth', 4 );
plot( z, mest, 'g-', 'LineWidth', 2 );
plot( zobs, dobs, 'ro', 'LineWidth', 2 );
xlabel('z');
ylabel('m(z)');

    
