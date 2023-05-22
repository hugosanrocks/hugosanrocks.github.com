% gda13_02
%
% Frechet derivatives for a simple acoustic wave propagation problem
% This version not use adjoints, but instead manipulates green functions directly
% The pressure equation is p-dot-dot = c(x)^2 laplacian(p) + s(x,t)
% which assumes constant density. The background medium is homogeneous
% with velocity c0=1.
% The source is s(x,t) = g(t)*delta(x-xs) where g is a Gaussian in time.
% The unperturbed equation is p-dot-dot = c0^2 laplacian(p) + s(x,t)
% In the unperturbed medium, the he green function for the source
% delta(t-tau)*delta(x-xs) is (1/(4*pi*c0^2*Rsx))*delta(t-tau-Rsx/c0)
% where Rsx is distance from the source to an observer at x.
% With the pressure written as p = p0 + dp, the equation is
% (p0+dp)-dot-dot = (c0^2+dm) laplacian(p0+dp) + s(x,t)
% where dm is a model parameter approximately equal to 2 c0 dc
% subtracting out the unperturbed equation and ignoring second order terms yields:
% dp-dot-dot = c0^2 laplacian(dp) + laplacian(p0) dm
% Thus a heterogeneity acts as a source of strength laplacian(p0) dm
% actibg at the location of the heterogeneity. The laplacian(p0)=
% (1/(4*pi*c0^3*Rsh))*g-dot-dor(t-Rsh/c0) where Rsh is the distance from
% the source to the heterogeneity.  We use the green function
% (1/(4*pi*c0^2*Rhr))*delta(t-tau-Rhr/c0) to compute the effect of the
% heterogeneity at the receiver. Here Rhr is the distance from the heterogeneity
% to the receiver. Integrating over tau, we achieve
% dp = (G, dm) where
% G = (1/(4*pi*c0^3*Rsh)) * (1/(4*pi*c0^2*Rhr)) g-dot-dot(t-Rsh/c0-Rhr/c0)

% constants
c0=1;
t0=0;
sigma=1;

% spatial grid
Lx=101;
Ly=101;
Dx=1.0;
Dy=1.0;
x = Dx*[0:Lx-1]';
y = Dy*[0:Ly-1]';

% source and receiver coordinates
icenter=floor(Lx/2);
xs = x( icenter );
jleft=floor(1*Lx/10);
ys = y( jleft );
xr = x( icenter );
jright=floor(9*Lx/10);
yr = y( jright );

% first evaluate the Frechet derivative dp/dm for a variety
% of times

% time t1
t = sqrt((xr-xs)^2 + (yr-ys)^2)+2;
G1 = zeros(Lx,Ly);
for i=[1:Lx]
for j=[1:Ly]
    Rsh = sqrt( (x(i)-xs)^2 + (y(j)-ys)^2 );
    Rhr = sqrt( (x(i)-xr)^2 + (y(j)-yr)^2 );
    f = 1/(1000+Rsh*Rhr);  % slight fudge to avoid singularity
    G1(i,j) = f * (1/(4*pi*(c0^3))) * (1/(4*pi*(c0^2))) * gpp(t-Rsh/c0-Rhr/c0,0,sigma);
end
end

t = sqrt((xr-xs)^2 + (yr-ys)^2)+5;
G2 = zeros(Lx,Ly);
for i=[1:Lx]
for j=[1:Ly]
    Rsh = sqrt( (x(i)-xs)^2 + (y(j)-ys)^2 );
    Rhr = sqrt( (x(i)-xr)^2 + (y(j)-yr)^2 );
    f = 1/(1000+Rsh*Rhr);  % slight fudge to avoid singularity
    G2(i,j) = f * (1/(4*pi*(c0^3))) * (1/(4*pi*(c0^2))) * gpp(t-Rsh/c0-Rhr/c0,0,sigma);
end
end

t = sqrt((xr-xs)^2 + (yr-ys)^2)+10;
G3 = zeros(Lx,Ly);
for i=[1:Lx]
for j=[1:Ly]
    Rsh = sqrt( (x(i)-xs)^2 + (y(j)-ys)^2 );
    Rhr = sqrt( (x(i)-xr)^2 + (y(j)-yr)^2 );
    f = 1/(1000+Rsh*Rhr);  % slight fudge to avoid singularity
    G3(i,j) = f * (1/(4*pi*(c0^3))) * (1/(4*pi*(c0^2))) * gpp(t-Rsh/c0-Rhr/c0,0,sigma);
end
end

% Now compute the traveltime kernel, after Marquering et al. (1999) 
F = zeros(Lx,Ly);
for i=[1:Lx]
for j=[1:Ly]
    Rsr = sqrt((xr-xs)^2 + (yr-ys)^2);
    tmin = Rsr/c0-3*sigma;
    tmax = Rsr/c0+3*sigma;
    Nt=51;
    Dt = (tmax-tmin)/(Nt-1);
    t = tmin + Dt*[0:Nt-1]';
    Rsh = sqrt( (x(i)-xs)^2 + (y(j)-ys)^2 );
    Rhr = sqrt( (x(i)-xr)^2 + (y(j)-yr)^2 );
    f = 1/(1000+Rsh*Rhr);  % slight fudge to avoid singularity
    v1 = gpp(t-Rsh/c0-Rhr/c0,0,sigma);
    v2 = gp(t-Rsr/c0,0,sigma);
    v3 = (1/(4*pi*(c0^2)*Rsr))*g(t-Rsr/c0,0,sigma);
    v4 = (1/(4*pi*(c0^2)*Rsr))*gpp(t-Rsr/c0,0,sigma);
    v = f * (1/(4*pi*(c0^3))) * (1/(4*pi*(c0^2))) * v1 .* v2;
    N = Dt * sum(v3.*v4);
    F(i,j) = (1/N) * Dt * sum(v);
end
end

% mark the source and receiver positions
gmin=abs(min(min(G1)));
gmax=abs(max(max(G1)));
gabsmax=max( [gmin, gmax]' );
G1(icenter,jleft) = -gabsmax;
G1(icenter,jright) = gabsmax;

gmin=abs(min(min(G2)));
gmax=abs(max(max(G2)));
gabsmax=max( [gmin, gmax]' );
G2(icenter,jleft) = -gabsmax;
G2(icenter,jright) = gabsmax;

gmin=abs(min(min(G3)));
gmax=abs(max(max(G3)));
gabsmax=max( [gmin, gmax]' );
G3(icenter,jleft) = -gabsmax;
G3(icenter,jright) = gabsmax;

fmin=abs(min(min(F)));
fmax=abs(max(max(F)));
fabsmax=max( [fmin, fmax]' );
F(icenter,jleft) = -fabsmax;
F(icenter,jright) = fabsmax;


gda_draw(' ',G1,' ',G2,' ',G3,' ',F);



