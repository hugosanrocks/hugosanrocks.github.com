% gda00_08
% example of element access


a = [1, 2, 3]';
M = [ [1, 4, 7]', [2, 5, 8]', [3, 6, 9]'];

% 2nd element of vector a
s = a(2);
s

% row=2 column=3 element of matrix M
t = M(2,3);
t

% 2nd column of matrix M
b = M(:,2);
b

% 2nd row of matrix M, converted to column vector
c = M(2,:)';
c

% 2x2 sub-matrix in the bottom right of M
T = M(2:3,2:3);
T



