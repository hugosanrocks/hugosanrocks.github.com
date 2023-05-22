function y = weightedleastsquaresfcn(v,transp_flag)
global F;
temp = F*v;
y = F'*temp;
return