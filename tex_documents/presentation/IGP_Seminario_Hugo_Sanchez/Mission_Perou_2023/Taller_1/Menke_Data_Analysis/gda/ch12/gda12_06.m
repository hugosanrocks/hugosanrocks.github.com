% gda12_06

% temperature inversion

% space
Nx = 100;
xmin = -100;
xmax = 100;
Dx = (xmax-xmin)/(Nx-1);
x = xmin + Dx*[0:Nx-1]';

% time
Nt = 100;
tmin = 0;
tmax = 200;
Dt = (tmax-tmin)/(Nt-1);
t = tmin + Dt*[0:Nt-1]';

% time/space matrices
tt = t*ones(1,Nx);
xx = ones(Nt,1)*x';

% model parameters, one at each distance
s = 1.0;
mtrue = zeros(Nx,1);
L=5;
mtrue(4*Nx/10:6*Nx/10)=(2+cos( 2*pi*([4*Nx/10:6*Nx/10]'-Nx/2)/L ));

% the true data as a function of time and distance
dtxtrue = zeros(Nt,Nx);
for i=[1:Nx]
    % data kernel, Gij, gives temperature at xi due to source
    % at xj for a time, t0
    t0=t(i);
    if( t0==0 )
        G=eye(Nx,Nx);
    else
        erfA = erf( (x*ones(1,Nx)-ones(Nx,1)*(x-Dx/2)') / sqrt(t0) );
        erfB = erf( (x*ones(1,Nx)-ones(Nx,1)*(x+Dx/2)') / sqrt(t0) );
        G = 0.5*(erfA-erfB);
    end
    dtxtrue(i,:) = (G*mtrue)';
end

% plot the true data
figure(1);
clf;
colormap('default');
set( gca, 'LineWidth', 2);
hold on;
axis( [xmin, xmax, tmin, tmax] );
axis ij,
imagesc( [xmin, xmax], [tmin, tmax], dtxtrue);
ylabel('time');
xlabel('distance');
title('true temperature');
colorbar();

% the true data as a function of time and distance
dtx = zeros(Nt,Nx);
for i=[1:Nx]
    % data kernel, Gij, gives temperature at xi due to source
    % at xj for a time, t0
    t0=t(i);
    if( t0==0 )
        G=eye(Nx,Nx);
    else
        erfA = erf( (x*ones(1,Nx)-ones(Nx,1)*(x-Dx/2)') / sqrt(t0) );
        erfB = erf( (x*ones(1,Nx)-ones(Nx,1)*(x+Dx/2)') / sqrt(t0) );
        G = 0.5*(erfA-erfB);
    end
    dtxtrue(i,:) = (G*mtrue)';
end

% true model, replicated at all times
mtxtrue = ones(Nt,1)*mtrue';

% plot the true model
figure(2);
clf;

subplot(1,3,1);
set( gca, 'LineWidth', 2);
hold on;
axis( [xmin, xmax, tmin, tmax] );
axis ij,
c1 = min(min(mtxtrue));
c2 = max(max(mtxtrue));
caxis( [c1, c2] );
image( [xmin, xmax], [tmin, tmax], mtxtrue, 'CDataMapping', 'scaled');
ylabel('time');
xlabel('distance');
title('true model');

R1at = 10;
R2at = 40;

% damped minimum length case
% estimate the model using the data each time
mtxest = zeros(Nt,Nx);
for i=[1:Nt]
    % true data
    dtrue=dtxtrue(i,:)';
    
    % add noise
    sd = 0.01;
    dobs = dtrue + random('Normal',0,sd,Nx,1);
    
    % compute data kernel
    t0=t(i);
    if( t0==0 )
        G=eye(Nx,Nx);
    else
        erfA = erf( (x*ones(1,Nx)-ones(Nx,1)*(x-Dx/2)') / sqrt(t0) );
        erfB = erf( (x*ones(1,Nx)-ones(Nx,1)*(x+Dx/2)') / sqrt(t0) );
        G = 0.5*(erfA-erfB);
    end
    
    % damped minimum length solution
    epsilon=1.0e-3;
    mtxest(i,:) = (G'*((G*G'+epsilon*eye(Nx,Nx))\dobs))';
    
    % save resolving kernels
    if( i==R1at )
        R1ML = G'*inv((G*G'+epsilon*eye(Nx,Nx)))*G;
    elseif (i==R2at)
        R2ML = G'*inv((G*G'+epsilon*eye(Nx,Nx)))*G;
    end
end

subplot(1,3,2);
set( gca, 'LineWidth', 2);
hold on;
axis( [xmin, xmax, tmin, tmax] );
axis ij,
caxis( [c1, c2] );
image( [xmin, xmax], [tmin, tmax], mtxest, 'CDataMapping', 'scaled');
ylabel('time');
xlabel('distance');
title('ML m^{est}');

% Backus-Gilbert case
% estimate the model using the data each time
mtxest = zeros(Nt,Nx);
for i=[1:Nt]
    % true data
    dtrue=dtxtrue(i,:)';
    
    % add noise
    sd = 0.01;
    dobs = dtrue + random('Normal',0,sd,Nx,1);
    
    % compute data kernel
    t0=t(i);
    if( t0==0 )
        G=eye(Nx,Nx);
    else
        erfA = erf( (x*ones(1,Nx)-ones(Nx,1)*(x-Dx/2)') / sqrt(t0) );
        erfB = erf( (x*ones(1,Nx)-ones(Nx,1)*(x+Dx/2)') / sqrt(t0) );
        G = 0.5*(erfA-erfB);
    end
    
    % construct Backus-Gilbert generalized inverse
    GMG = zeros(Nx,Nx);
    u = G*ones(Nx,1);
    for k = [1:Nx]
        S = G * diag(([1:Nx]-k).^2) * G';
        epsilon=1e-3;
        S = S+epsilon*eye(Nx);
        uSinv = u'/S;
        GMG(k,:) = uSinv / (uSinv*u);
    end
    
    % estimate solution
    mtxest(i,:) = (GMG*dobs)';
    
    % save resolving kernels
    if( i==R1at )
        R1BG = GMG*G;
    elseif (i==R2at)
        R2BG = GMG*G;
    end
    
end


subplot(1,3,3);
set( gca, 'LineWidth', 2);
hold on;
axis( [xmin, xmax, tmin, tmax] );
axis ij,
caxis( [c1, c2] );
image( [xmin, xmax], [tmin, tmax], mtxest, 'CDataMapping', 'scaled');
ylabel('time');
xlabel('distance');
title('BG m^{est}');

% plot resolution kernels
figure(3);
clf;

subplot(2,2,1);
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, xmin, xmax] );
axis ij,
imagesc( [xmin, xmax], [xmin, xmax], R1ML);
ylabel('distance');
xlabel('distance');
title(sprintf('ML R at t=%.2f',t(R1at)));

subplot(2,2,2);
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, xmin, xmax] );
axis ij,
imagesc( [xmin, xmax], [xmin, xmax], R2ML);
ylabel('distance');
xlabel('distance');
title(sprintf('ML R at t=%.2f',t(R2at)));

subplot(2,2,3);
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, xmin, xmax] );
axis ij,
imagesc( [xmin, xmax], [xmin, xmax], R1BG);
ylabel('distance');
xlabel('distance');
title(sprintf('BG R at t=%.2f',t(R1at)));

subplot(2,2,4);
set(gca,'LineWidth',2);
hold on;
axis( [xmin, xmax, xmin, xmax] );
axis ij,
imagesc( [xmin, xmax], [xmin, xmax], R2BG);
ylabel('distance');
xlabel('distance');
title(sprintf('BG R at t=%.2f',t(R2at)));

