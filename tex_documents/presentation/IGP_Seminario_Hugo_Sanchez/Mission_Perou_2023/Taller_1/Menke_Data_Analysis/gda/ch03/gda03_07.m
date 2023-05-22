% gda03_07
%
% Kepler's 3rd law example, period^2 = radius^3

% read data
D=load('../data/planetary.txt');
radius=D(:,1)/1e9;  % work in units of 10^9 km
period=D(:,2)/1000; %     and units of 10^3 days
N=length(radius);

% take radius^2 to be the observation
% and period to be the auxillary variable
% (which is ok, since time can be measured so accurately)
dobs = radius.^3;
z=period;

G=[ones(N,1), z, z.^2];
mest = (G'*G)\(G'*dobs);
disp(sprintf('mest: %f %f %f', mest(1), mest(2), mest(3)));
dpre = G*mest;
e = dobs-dpre;

% plot smooth parabola, so use lots of z's
zeval=[0:250]';
deval=mest(1)+mest(2)*zeval+mest(3)*zeval.^2;

figure(1);
clf;

subplot(2,1,1);
set(gca,'LineWidth',2);
hold on;
axis( [0, 100, 0, 250 ]');
plot(z,dobs,'ro','LineWidth',3);
plot(zeval,deval,'k-','LineWidth',3);
xlabel('period, Kdays');
ylabel('radius^3, Tm^3');

subplot(2,1,2);
set(gca,'LineWidth',2);
hold on;
axis( [0, 100, -0.5, 0.5 ]');
plot(z,e,'ro','LineWidth',3);
plot( [0, 100], [0, 0], 'k-','LineWidth',2);
xlabel('period, Kdays');
ylabel('error, Tm^3');


