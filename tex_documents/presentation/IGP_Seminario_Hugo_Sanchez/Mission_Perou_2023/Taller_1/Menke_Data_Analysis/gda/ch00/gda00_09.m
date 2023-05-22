% gda00_09
% example of the matrix inverse, determinant, eigenvalues

% define a matrix and a vector
A = [ [1, 5, 13]', [2, 7, 17]', [3, 11, 19]']; 
b = [1, 2, 3]';

A

% compute inverse
B = inv(A);
B

% check result
A*B
B*A

% determinant
d = det(A);
d

% solve b = A*c
c = A\b;
c

% check result
error=b-A*c;
error

% define matrix B
B = [ [1, 3, 4]', [2, 3, 2]', [0, 0, 4]']; 
B

% D=B*inv(A)
D=B/A;
D

% define symmetric matrix M
M = [ [1, 2, 0]', [2, 2, 0]', [0, 0, 4]'];
M

% eigenvalues and eigenvectors
[V,LAMBDA] = eig(M);
V
LAMBDA

% check orthonormality
V'*V