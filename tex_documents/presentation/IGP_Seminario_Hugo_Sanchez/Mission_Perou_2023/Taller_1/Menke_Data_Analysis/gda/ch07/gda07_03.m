% gda07_03

clear all;

M=20;
zmin = 0.0;
zmax = 5.0;
Lz = zmax-zmin;
Dz = (zmax-zmin)/(M-1);
z = zmin + Dz*[0:M-1]';

mtrue = sin( 2*pi*z/Lz );

g1 = [1, 1, 1.1, 1, 1]';
L=length(g1);
g=[ g1', zeros(1,M-L) ]';
N=M;
G=zeros(N,M);
for i=[1:M]
   G(i,:) = circshift(g,i-1)';
end
G=fliplr(G);

sigmad=0.01;
dobs = G*mtrue + random('Normal',0.0,sigmad,N,1);


[U, L, V] = svd(G);
lambda = diag(L);
p = 16;
lambdap = lambda(1:p);

Up=U(:,1:p);
Vp=V(:,1:p);
mest = Vp*((Up'*dobs)./lambdap);

e2=1e-2;
mestDML = G'*((G*G'+e2*eye(N,N))\dobs);

figure(2);
clf;

set(gca,'LineWidth',2);
hold on;
axis( [1, M, 0 max(lambda) ] );
plot( [1:M]', lambda, 'k-', 'LineWidth', 2 );
hold on;
plot( [1:M]', lambda, 'ko', 'LineWidth', 2 );
xlabel('i');
ylabel('L_i');




gda_draw(G,' ',mtrue,'=',' ',dobs,' ',' ',' ',' ',mtrue,' ',mest,' ',mestDML);


