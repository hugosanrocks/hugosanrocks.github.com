% gda09_06
%
% E(m) for several 2D non-linear problems

% auxiliary parameter z
N = 11;
zmin = 0;
zmax = 1.0;
Dz = (zmax-zmin)/(N-1);
z = zmin + Dz*[0:N-1]';
za = z.^0.10;
zb = z.^0.20;

% grid search
Mg1 = 101;
m1min = 0;
m1max = 1;
Dm1 = (m1max-m1min)/(Mg1-1);
m1 = m1min + Dm1*[0:Mg1-1];

Mg2 = 101;
m2min = 0;
m2max = 1;
Dm2 = (m2max-m2min)/(Mg2-1);
m2 = m2min + Dm2*[0:Mg2-1];

m1true = 0.4;
m2true = 0.6;
dtrue = ((m1true-0.2)*za-((m2true-0.3)*zb).^2).*z;
sd=0.1;
dobs = dtrue + random('Normal',0,sd,N,1);

% Grid search
E=zeros(Mg1,Mg2);
Emin=1e10;
Emini=1;
Eminj=1;
for i=[1:Mg1]
for j=[1:Mg2]
    dpre = ((m1(i)-0.2)*za-((m2(j)-0.3)*zb).^2).*z;
    e = dobs - dpre;
    E(i,j) = (e'*e);
    if( E(i,j)<Emin )
        Emin=E(i,j);
        Emini=i;
        Eminj=j;
    end
end
end

fprintf('Emin %f at %f %f\n', Emin, m1(Emini), m2(Eminj) );

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [m1min, m1max, m2min, m2max] );
axis ij;
imagesc( [m1min, m1max], [m2min, m2max], E );
plot( m2(Eminj), m1(Emini), 'wo', 'LineWidth', 3 );
xlabel('m2');
ylabel('m1');


m1true = 0.4;
m2true = 0.6;

dtrue = sin(12*pi*(m1true-0.5))*z+(m2true*z).^0.5;
sd=0.1;
dobs = dtrue + random('Normal',0,sd,N,1);

% Grid search
E=zeros(Mg1,Mg2);
Emin=1e10;
Emini=1;
Eminj=1;
for i=[1:Mg1]
for j=[1:Mg2]
    dpre = sin(12*pi*(m1(i)-0.5))*z+(m2(j)*z).^0.5;
    e = dobs - dpre;
    E(i,j) = (e'*e);
    if( E(i,j)<Emin )
        Emin=E(i,j);
        Emini=i;
        Eminj=j;
    end
end
end

fprintf('Emin %f at %f %f\n', Emin, m1(Emini), m2(Eminj) );

figure(2);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [m1min, m1max, m2min, m2max] );
axis ij;
imagesc( [m1min, m1max], [m2min, m2max], E );
plot( m2(Eminj), m1(Emini), 'wo', 'LineWidth', 3 );
xlabel('m2');
ylabel('m1');

