% gda05_03

% point inside of 3D box


N = 100;
d = random('Normal',2.5,1.5,N,1);

% grid
Nm = 51;
mmin = 1.5;
mmax = 5.0;
Dm = (mmax-mmin)/(Nm-1);
m = mmin + Dm*[0:Nm-1]';

Ns = 51;
smin = 1;
smax = 2;
Ds = (smax-smin)/(Ns-1);
s = smin + Ds*[0:Ns-1]';

[X,Y]=meshgrid( m, s);

L=zeros(Nm,Ns);

% Normal P = (1/sqrt(2pi)) * (1/s) * exp( -0.5 (d-m)^2 / s^2 )
%        L = -0.5log(2*pi) - log(s) - ( -0.5 (d-m)^2 / s^2 )
for i=[1:Nm]
for j=[1:Ns]
    mp=X(i,j);
    sp=Y(i,j);
    L(i,j) = -N*log(2*pi)/2 - N*log(sp) - 0.5*sum((d-mp).^2)/(sp^2);
end
end

[tmp, itmp] = max(L);
[Lmax, Lj] = max(tmp);
Li=itmp(Lj);

mbest = X(Li,Lj);
sbest = Y(Li,Lj);
disp(sprintf('mean %f sigma %f',mbest,sbest));

Lmin = min(min(L));

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
pmmin=mmin;
pmmax=mmax;
psmin=smin;
psmax=smax;
pLmin = -500;
pLmax = -100;
axis( [pmmin, pmmax, psmin, psmax, pLmin, pLmax]');

for i=[1:Nm]
for j=[1:Ns]
    if( L(i,j) < pLmin )
        L(i,j)=NaN(1);
    end
end
end

mesh(X,Y,L);

% improvise 3D box
pxmin=pmmin+0.01; pxmax=pmmax-0.01;
pymin=psmin+0.01; pymax=psmax-0.01;
pzmin=pLmin+1; pzmax=pLmax-1;

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

DL = (pLmax-pLmin)/20;
plot3( [mbest, mbest], [sbest, sbest], [Lmax-DL, Lmax+DL], 'r-', 'LineWidth', 4 );
plot3( [mbest-0.1, mbest+0.1], [sbest, sbest], [Lmax, Lmax], 'r-', 'LineWidth', 4 );
plot3( [mbest, mbest], [sbest-0.1, sbest+0.1], [Lmax, Lmax], 'r-', 'LineWidth', 4 );



    
    


    
    

