% gda09_04
%
% E(m) for a linear problem


% auxiliary parameter z
N = 11;
zmin = 0;
zmax = 5.0;
Dz = (zmax-zmin)/(N-1);
z = zmin + Dz*[0:N-1]';

% only one model parameter, m1
M=1;

% model:  d = m1*z
mtrue=2.5;
dtrue=mtrue*z;
sd=2;
dobs=dtrue+random('Normal',0,sd,N,1);

% grid search
Mg = 101;
mmin = 0;
mmax = 5;
Dm = (mmax-mmin)/(Mg-1);
m = mmin + Dm*[0:Mg-1];

% Grid search
E=zeros(Mg,1);
for i=[1:Mg]
    dpre = m(i)*z;
    e = dobs - dpre;
    E(i) = e'*e;
end


[Emin, iEmin] = min(E);
mest=m(iEmin);

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [mmin, mmax, 0, max(E)] );
axis xy;
plot( m, E, 'k-', 'Linewidth', 3 );
plot( mest, Emin, 'ko', 'LineWidth', 3);
plot( [mest, mest], [0, max(E)/50], 'k-', 'LineWidth', 2);
xlabel('m');
ylabel('E');

