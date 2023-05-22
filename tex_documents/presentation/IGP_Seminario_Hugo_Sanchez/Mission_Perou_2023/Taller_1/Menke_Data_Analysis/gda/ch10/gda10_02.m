% gda10_02

% mixing of endmembers

% grid
xmin = 0;
xmax = 1;

ymin = 0;
ymax = 1;

zmin = 0;
zmax = 1;


% plot
figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [-1.2*xmax, 1.2*xmax, -1.2*ymax, 1.2*ymax, -1.2*zmax, 1.2*zmax]');

% factors
f1 = [1, 0.2, 0.8]';
norm = 1.2*sqrt(f1'*f1);
f1=f1/norm;

f2 = [0.2, 1, 0.8]';
norm = 0.8*sqrt(f2'*f2);
f2=f2/norm;

arrow3(f1,'r-',3);
arrow3(f2,'r-',3);

% samples
s1=0.8*f1+(1-0.8)*f2;
s2=0.6*f1+(1-0.6)*f2;
s3=0.4*f1+(1-0.4)*f2;
s4=0.2*f1+(1-0.2)*f2;
arrow3(s1,'k-',2);
arrow3(s2,'k-',2);
arrow3(s3,'k-',2);
arrow3(s4,'k-',2);



if( 1 )
    % use SVD.  The minus sigs are just to get the vectors
    % in quadrants that look good in the plot
    S=zeros(4,3);
    S(1,:)=s1';
    S(2,:)=s2';
    S(3,:)=s3';
    S(4,:)=s4';
    [U,LAMBDA,V] = svd(S);
    v1 = -V(:,1);
    v2 = -V(:,2);
    v3 = -V(:,3);
else
    % just use the mean vector, and two vectors perpendicular
    % to it, one of which is in the F1-F2 plane
    v1 = f1+f2;
    norm = sqrt(v1'*v1);
    v1=v1/norm;

    v3 = cross(f1,f2);
    norm = sqrt(v3'*v3);
    v3=v3/norm;

    v2 = cross(v1,v3);
    norm = sqrt(v2'*v2);
    v2=v2/norm;
end


arrow3(v1,'b-',3);
arrow3(v2,'b-',3);
arrow3(v3,'b-',3);

% improvise 3D box
plot3( [xmin,xmin], [ymin,ymin], [zmin,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymin,ymax], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmax], [ymin,ymin], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymax], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymax,ymax], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymin,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymin,ymin], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymax,ymin], [zmax,zmax], 'k-', 'LineWidth', 2 );
plot3( [xmin,xmin], [ymax,ymax], [zmax,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmax], [ymax,ymin], [zmin,zmin], 'k-', 'LineWidth', 2 );
plot3( [xmax,xmin], [ymax,ymax], [zmin,zmin], 'k-', 'LineWidth', 2 );
xlabel('E_1');
ylabel('E_2');
zlabel('E_3');
