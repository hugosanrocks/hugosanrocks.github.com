clear all
close all
clc

x1 = load('lines_x1.dat');
x2 = load('lines_x2.dat');
x3 = load('lines_x3.dat');

j = 930;
for i=1:930
  c(i,1:3) = [x1(j), x2(j), x3(j)];
  j = j - 1;
end

