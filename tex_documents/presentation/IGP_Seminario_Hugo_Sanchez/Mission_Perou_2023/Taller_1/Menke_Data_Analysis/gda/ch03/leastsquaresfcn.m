function y = leastsquaresfcn(v,transp_flag)
global G;
temp = G*v;
y = G'*temp;
return