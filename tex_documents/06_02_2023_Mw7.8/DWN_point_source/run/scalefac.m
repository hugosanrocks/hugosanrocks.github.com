clear all
close all
clc

sc2=load('SEISMO1E15/01est');
msc2=max(sc2);

sc1=load('SEISMO/01est');
msc1=max(sc1);

sc3=load('SEISMO3E15/01est');
msc3=max(sc3);

x=[1e13 3e15];
y=[msc1 msc3];

plot(x,y,'linewidth',1),hold on,xlim([1e12,4e15])
plot(1e15,msc2,'.r','linewidth',3)

slope=(msc3-msc2)/(3e15-1e15)

