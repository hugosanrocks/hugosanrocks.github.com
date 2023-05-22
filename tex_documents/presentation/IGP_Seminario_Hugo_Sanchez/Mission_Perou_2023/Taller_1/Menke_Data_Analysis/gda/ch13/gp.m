% First derivative of Gaussian curve
function gout = gp(t,t0,sigma)
c = 1/((sigma^2)*(sqrt(2*pi)*sigma));
gout = c*(t-t0).*exp(-0.5*((t-t0).^2)/(sigma^2));
end

