% gda03_08
%
% planar fit to depths of earthquakes in the Kurile subduction zone

% read data
D=load('../data/kurile_eqs.txt');
lat=D(:,1);
lon=D(:,2);
depth=D(:,3);

% convert to km
x = 111.12*cos((pi/180)*mean(lat))*(lon-min(lon));
y = 111.12*(lat-min(lat));
dobs=-depth;
N=length(-depth);

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
pxmin=0; pxmax=1200;
pymin=0; pymax=1200;
pzmin=-700; pzmax=0;
axis( [pxmin, pxmax, pymin, pymax, pzmin, pzmax]' );
plot3(x,y,dobs,'ko','LineWidth',2);

% improvise 3D box
plot3( [pxmin,pxmin], [pymin,pymin], [pzmin,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmin], [pymin,pymax], [pzmin,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmax], [pymin,pymin], [pzmin,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmax], [pymax,pymax], [pzmax,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmax], [pymax,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmin], [pymax,pymax], [pzmax,pzmax], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmin], [pymin,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmax], [pymin,pymin], [pzmax,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmin,pxmin], [pymax,pymin], [pzmax,pzmax], 'k-', 'LineWidth', 2 );
plot3( [pxmin,pxmin], [pymax,pymax], [pzmax,pzmin], 'k-', 'LineWidth', 2 );

plot3( [pxmax,pxmax], [pymax,pymin], [pzmin,pzmin], 'k-', 'LineWidth', 2 );
plot3( [pxmax,pxmin], [pymax,pymax], [pzmin,pzmin], 'k-', 'LineWidth', 2 );

% solve inverse problem of fitting a plane to data
G = [ones(N,1), x, y];
mest = (G'*G)\(G'*dobs);
dpre=G*mest;

M=31;
xx=pxmin+(pxmax-pxmin)*[0:M-1]'/(M-1);
yy=pymin+(pymax-pymin)*[0:M-1]'/(M-1);

[X,Y]=meshgrid( xx, yy);
Z = mest(1)+mest(2)*X+mest(3)*Y;

[Ni,Nj]=size(Z);
for i=[1:Ni]
for j=[1:Nj]
    if ( (Z(i,j)>0) || (Z(i,j)<pzmin) )
        Z(i,j)=nan(1);
    end
end
end

mesh(X,Y,Z);







