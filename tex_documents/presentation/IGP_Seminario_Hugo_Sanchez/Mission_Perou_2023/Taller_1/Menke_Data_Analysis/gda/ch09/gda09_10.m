% gda09_10
%
% Newton's Method solution to exemplary 1D non-linear inverse problem

% auxiliary parameter z
N = 21;
zmin = 0;
zmax = 5.0;
Dz = (zmax-zmin)/(N-1);
z = zmin + Dz*[0:N-1]';
zp = z.^0.5;

% grid search
Mg = 501;
mmin = 0;
mmax = 5;
Dm = (mmax-mmin)/(Mg-1);
m = mmin + Dm*[0:Mg-1];

% only one model parameter, m1
M=1;

% model 1
mtrue=3;
k=1;
dtrue = sin(k*mtrue.*zp).*z;
sd=2;
dobs=dtrue+random('Normal',0,sd,N,1);

% evaluate error E1(m)
E1=zeros(Mg,1);
for i=[1:Mg]
    dpre = sin(k*m(i).*zp).*z;
    e = dobs - dpre;
    E1(i) = (e'*e);
end

% global minimum
[E1min, iE1min] = min(E1);
m1est=m(iE1min);

% Newton's method

% derivative
% d = sin(k*m(i).*zp).*z;
% dd/dm = k.*zp.*z.*cos(k*m(i).*zp);
% d = d(m0) + (dd/dm)|m0 (m-m0)

% evaluate error E2(m) using linearized version of m

E2=zeros(Mg,1);
m0 = 1.0;
im0 = floor((m0-mmin)/Dm)+1;
d0 = sin(k*m0.*zp).*z;
dddm = k.*zp.*z.*cos(k*m0.*zp);
for i=[1:Mg]
    dpre = d0 + dddm * (m(i)-m0);
    e = dobs - dpre;
    E2(i) = (e'*e);
end

[E2min, iE2min] = min(E2);
m2est=m(iE2min);

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
mminp=1; mmaxp=4;
axis( [mmin, mmax, 0, max(E1)] );
axis xy;

% true error surface, with circle at minimum, and line dropped to axis
plot( m, E1, 'k-', 'Linewidth', 3 );
plot( m1est, E1min, 'ko', 'Linewidth', 3 );
plot( [m1est, m1est], [0, E1min], 'k:', 'Linewidth', 2 );

% parabiolic approximation, with circle at minimum, and line dropped to
% axis
plot( m, E2, 'r:', 'Linewidth', 3 );
plot( m2est, E2min, 'ro', 'Linewidth', 3 );
plot( [m2est, m2est], [0, E2min], 'r:', 'Linewidth', 2 );

plot( m0, E2(im0), 'ko', 'Linewidth', 3 );
plot( [m0, m0], [0, E2(im0)], 'k:', 'Linewidth', 2 );

xlabel('m');
ylabel('E');
