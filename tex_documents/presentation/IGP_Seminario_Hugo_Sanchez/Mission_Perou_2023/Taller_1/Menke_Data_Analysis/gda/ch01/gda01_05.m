% gda01_05
% 
% plot for mixing example figure

M=5;
s1 = [1, 0, 2, 0.5, 3]';
s2 = [3, 0.7, 1, 2.5, 2]';

x=0.1;
sx1 = x*s2 + (1-x)*s1;

x=0.3;
sx2 = x*s2 + (1-x)*s1;

x=0.5;
sx3 = x*s2 + (1-x)*s1;

x=0.7;
sx4 = x*s2 + (1-x)*s1;

x=0.9;
sx5 = x*s2 + (1-x)*s1;

gda_draw(' ', s1, ' ', sx1, ' ', sx2, ' ', sx3, ' ', sx4, ' ', sx5, ' ', s2);

