function y = filterfun(v,transp_flag)
global g H;

% get dimensions
N = length(g);
M = length(v);
[K, M2] = size(H);

temp1=conv(g,v); % G v is of length N
a=temp1(1:N);
b=H*v; % H v is of length K
temp2=conv(flipud(g),a); % GT (G v) is of length M
a2 = temp2(N:N+M-1);
b2 = H'*b; % HT (H v) is of length M
% FT F v = GT G v + HT H v
y = a2+b2;

return