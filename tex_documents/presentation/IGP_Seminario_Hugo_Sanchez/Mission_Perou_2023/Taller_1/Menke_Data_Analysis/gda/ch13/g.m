% Gaussian curve
function gout = g(t,t0,sigma)
gout = exp(-0.5*((t-t0).^2)/(sigma^2))/(sqrt(2*pi)*sigma);
end

