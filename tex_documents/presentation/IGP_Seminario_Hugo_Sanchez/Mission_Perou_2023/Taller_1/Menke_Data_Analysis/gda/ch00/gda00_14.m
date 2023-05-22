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

% display first few lines
D(1:5,:)

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
title('global temperature data');

