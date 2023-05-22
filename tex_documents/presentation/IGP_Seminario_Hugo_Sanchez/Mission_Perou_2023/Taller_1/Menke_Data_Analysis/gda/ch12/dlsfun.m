function y = dlsfun(v,transp_flag)
global G epsilon;
% impliments (G'G + epsilon I) v = G'(G v) + epsilon v
temp = G*v;
y = epsilon * v + G'*temp;
return