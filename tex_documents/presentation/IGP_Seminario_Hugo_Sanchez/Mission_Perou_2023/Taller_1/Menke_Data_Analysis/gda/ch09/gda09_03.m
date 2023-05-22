% gda09_03
%
% logarithmic fit

% auxiallary variable z
N=10;
zmin = 0;
zmax = 1;
Dz = (zmax-zmin)/(N-1);
z = zmin + Dz*[0:N-1]';

% data, a exponential d=m1*exp(m2 z)
M=2;
mtrue = [0.7, -1]';
dtrue = mtrue(1)*exp(mtrue(2)*z);

% additive noise
sd=0.1;
bottom= 0.001;
dobs = dtrue + random('Normal',0,sd,N,1);
% but don't let data become negative
i=find(dobs<0);
dobs(i)=bottom;

% linearizing transformation, solve by standard least squares
% d     = m1 exp( m2 z)
% ln(d) = ln(m1) + m2 * z
G=zeros(N,M);
G=[ones(N,1), z];
lndobs = log(dobs);
mestlin = (G'*G)\(G'*lndobs);
mestlin(1) = exp(mestlin(1));
dprelin = mestlin(1)*exp(mestlin(2)*z);

% iterative solution
% d     = m1 exp( m2 z)
% dd/dm1 = exp( m2 z)
% dd/dm2 = m1 z exp( m2 z)

% initial guess is previous solution
mest = mestlin;
Nit=10;
sdmmin = 1e-4;
for it=[1:Nit]
    dd = dobs - (mest(1)*exp(mest(2)*z));
    G = [exp(mest(2)*z), mest(1)*z.*exp(mest(2)*z)];
    dm = (G'*G)\(G'*dd);
    mest = mest+dm;
    sdm = sqrt(sum(dm'*dm)/M);  % size of m
    if( sdm < sdmmin )
        break;
    end
end

% least squares prediction
dpre = mest(1)*exp(mest(2)*z);

figure(1);
clf;

subplot(1,2,1);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, 0, 1] );
plot( z, dtrue, 'r-', 'LineWidth', 2 );
plot( z, dobs, 'ro', 'LineWidth', 3 );
plot( z, dprelin, 'b-', 'LineWidth', 3 );
plot( z, dpre, 'g-', 'LineWidth', 3 );
xlabel('z');
ylabel('d');

subplot(1,2,2);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, -1, 0] );
plot( z, log10(dtrue), 'r-', 'LineWidth', 2 );
plot( z, log10(dobs), 'ro', 'LineWidth', 3 );
plot( z, log10(dprelin), 'b-', 'LineWidth', 3 );
plot( z, log10(dpre), 'g-', 'LineWidth', 3 );
xlabel('z');
ylabel('log10(d)');








