clear all
close all
clc
o=load('SEISMO_TURKEY/4616nord');
%s=load('obs_S001_C1');
T = 85;
nt = length(o);
dt = T/(nt-1);
t = 0:dt:T;
plot(t,o,'b', 'linewidth',2.5),hold on
xlim([0,30])
set(gca,'fontsize',30)
