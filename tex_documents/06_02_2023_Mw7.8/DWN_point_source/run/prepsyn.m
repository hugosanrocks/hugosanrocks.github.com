clear all
close all
clc


eesyn=zeros(1024,5);
nnsyn=zeros(1024,5);
vvsyn=zeros(1024,5);


 for i=1:2
  for j=1:5
   e=sprintf('SEISMO%01d/%03dest',i,j)
   n=sprintf('SEISMO%01d/%03dnord',i,j);
   v=sprintf('SEISMO%01d/%03dvert',i,j);
   esyn(:,j)=load(e);
   nsyn(:,j)=load(n);
   vsyn(:,j)=load(v);
   eesyn(:,j)=eesyn(:,j)+esyn(:,j);
   nnsyn(:,2)=nnsyn(:,j)+nsyn(:,j);
   vvsyn(:,3)=vvsyn(:,j)+vsyn(:,j);
  end
 end
    eesyn=eesyn.*-1;
    
for i=1:5
e1=eesyn(:,i);
n1=nnsyn(:,i);
v1=vvsyn(:,i);
    filename = sprintf('obs_S%03d_C1', i)
    save('-ascii', filename, 'e1');
    filename = sprintf('obs_S%03d_C2', i);
    save('-ascii', filename, 'n1');
    filename = sprintf('obs_S%03d_C3', i);
    save('-ascii', filename, 'v1');
end


