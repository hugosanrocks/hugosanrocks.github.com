% gda00_10
% example of a for loop

% define a matrix M and a vector a
M = [ [1, 4, 7]', [2, 5, 8]', [3, 6, 9]'];
a = [0, 0, 0]';

% use a for loop to extract the diagonal elements of
% the matrix M into the column-vector a
for i = [1:3]
    a(i) = M(i,i);
end


M
a