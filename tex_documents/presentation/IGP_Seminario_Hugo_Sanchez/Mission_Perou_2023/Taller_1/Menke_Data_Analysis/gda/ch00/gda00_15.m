% gda00_14
% 
% load and plot 1965-2010 global temperature data

% Hansen, J., Mki. Sato, R. Ruedy, K. Lo, D.W. Lea, and M. Medina-Elizade,
% 2006: Global temperature change. Proc. Natl. Acad. Sci., 103, 14288-14293,
% doi:10.1073/pnas.0606291103. 

% load
D=load('../data/global_temp.txt');
t=D(:,1);
d=D(:,2);
N=length(d);

disp(sprintf('Number of data: %d\n', N));

% display first few lines
disp('first few lines of data');
for i=[1:4]
    disp(sprintf('%f  %f',t(i),d(i)));
end

% plot data
figure(1);
clf;
set(gca,'LineWidth',3);
hold on;
axis( [1965, 2010, -0.5, 1.0] );
plot(t,d,'r-','LineWidth',3);
plot(t,d,'ko','LineWidth',3);
xlabel('calendar year');
ylabel('temperature anomaly, deg C');
title(sprintf('temperature data from %d to %d',t(1),t(N)));

