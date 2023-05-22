% gda00_11
% example of two nested for loops

% define a matrices M and N
M = [ [1, 4, 7]', [2, 5, 8]', [3, 6, 9]'];
N = [ [0, 0, 0]', [0, 0, 0]', [0, 0, 0]'];

% use two nested for loop to reverse the order
% of the elements in each row of the matrix M
for i = [1:3]
for j = [1:3]
    N(i,4-j) = M(i,j);
end
end

M
N
