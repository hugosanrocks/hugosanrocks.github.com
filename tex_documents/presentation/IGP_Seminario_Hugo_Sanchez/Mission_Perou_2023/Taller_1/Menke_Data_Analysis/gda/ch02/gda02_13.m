% gda02_13 
% Illustrate a computing conditional distributions
% from a joint distribution 

% set up vectors da and d2
L=40;
Dd = 1.0;
d1 = Dd*[0:L-1]';
d2 = Dd*[0:L-1]';

% make a normal distribution
d1bar=15;
d2bar=25;
s1=7;
s2=8;
norm=1/(2*pi*s1*s2);
p1=exp(-((d1-d1bar).^2)/(2*s1*s1));
p2=exp(-((d2-d2bar).^2)/(2*s2*s2));
P=norm*p1*p2';

% sum along columns, which integrates P along d2 to get p1=p(d1)
p1 = Dd*sum(P,2);
% sum along rows, which integrates P along d1 to get p2=p(d2)
p2 = Dd*sum(P,1)';

% conditional distribution P1g2 = P(d1|d2) = P(d1,d2)/p2
P1g2 = P ./ (ones(L,1)*p2');

% conditional distribution P2g1 = P(d2|d1) = P(d1,d2)/p1
P2g1 = P ./ (p1*ones(L,1)');

% use simple drawing function that encapsulates all the graphics
gda_draw(P,'caption p(d1,d2)',P1g2,'caption p(d1|d2)',P2g1,'caption p(d2|d1)');

