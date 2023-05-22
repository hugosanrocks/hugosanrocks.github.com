% second derivative of Gaussian curve
function gout = gpp(t,t0,sigma)
gout = (1/(sqrt(2*pi)*sigma))*(sigma^-2)*(-1+(((t-t0)/sigma).^2)).*exp(-0.5*((t-t0).^2)/(sigma^2));
end

