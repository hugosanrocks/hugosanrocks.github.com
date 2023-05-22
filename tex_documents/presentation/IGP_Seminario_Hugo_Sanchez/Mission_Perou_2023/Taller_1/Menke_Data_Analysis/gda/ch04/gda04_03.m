% gda04_03
%
% least squares fit to two cases of synthetic data
% distinguished by the spacing of the z's


% CASE 1: date clumped in middle of interval

% z's
N=10;
zmin=0;
zmax=10;
z = sort(random('Uniform',zmin+4*(zmax-zmin)/10,zmin+6*(zmax-zmin)/10,N,1));

% d = a + b*z + noise
a=5.0;
b=0.5;
sd=1;
dobs = a+b*z+random('Normal',0,sd,N,1);

% least squares fit
M=2;
G=[ones(N,1), z];
mest = (G'*G)\(G'*dobs);
Cm = (sd^2)*inv(G'*G);
sm = [sqrt(Cm(1,1)), sqrt(Cm(2,2)) ]; 

% predicted data
No=10;
zeval = zmin + (zmax-zmin)*[0:No-1]'/(No-1);
Go = [ones(No,1), zeval];
deval = Go*mest;
Cdeval = Go*Cm*Go';
sdeval = sqrt(diag(Cdeval));

% plot
figure(1);
clf;

pdmin=0;
pdmax=15;

subplot(1,2,1);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pdmin, pdmax ]' );
plot( zeval, deval+sdeval, 'b-', 'LineWidth', 3);
plot( zeval, deval-sdeval, 'b-', 'LineWidth', 3);
plot( zeval, deval, 'r-', 'LineWidth', 3);
plot( z, dobs, 'ko', 'LineWidth', 3);
for i = [1:N]
    plot( [z(i), z(i)], [dobs(i)-sd, dobs(i)+sd], 'k-', 'LineWidth', 2);
end
xlabel('z');
ylabel('d');


% CASE 2: data spread out over whole interval

% z's
N=10;
zmin=0;
zmax=10;
z = sort(random('Uniform',zmin,zmax,N,1));

% d = a + b*z + noise
a=5.0;
b=0.5;
sd=1;
dobs = a+b*z+random('Normal',0,sd,N,1);

% least squares fit
M=2;
G=[ones(N,1), z];
mest = (G'*G)\(G'*dobs);
Cm = (sd^2)*inv(G'*G);
sm = [sqrt(Cm(1,1)), sqrt(Cm(2,2)) ]; 

% predicted data
No=10;
zeval = zmin + (zmax-zmin)*[0:No-1]'/(No-1);
Go = [ones(No,1), zeval];
deval = Go*mest;
Cdeval = Go*Cm*Go';
sdeval = sqrt(diag(Cdeval));

% plot

subplot(1,2,2);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pdmin, pdmax ]' );
plot( zeval, deval+sdeval, 'b-', 'LineWidth', 3);
plot( zeval, deval-sdeval, 'b-', 'LineWidth', 3);
plot( zeval, deval, 'r-', 'LineWidth', 3);
plot( z, dobs, 'ko', 'LineWidth', 3);
for i = [1:N]
    plot( [z(i), z(i)], [dobs(i)-sd, dobs(i)+sd], 'k-', 'LineWidth', 2);
end
xlabel('z');
ylabel('d');




