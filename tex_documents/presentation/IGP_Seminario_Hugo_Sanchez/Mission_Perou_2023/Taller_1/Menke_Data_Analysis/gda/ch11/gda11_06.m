% gda11_06
% temperature / chemical reaction example
% adjoint method used to build data kernel

% kernel for differential equation
clear all;

% time
M=501;
N=M;
Dt=1;
t = Dt*[0:M-1]';
tmax=max(t);

% differential equation (d/dt + c)u = f
% has green function G(t,t')=H(t-t')exp(-c(t-t'))
c = 0.04;

% Forward problem

% plot green function for t'=10;
figure(2);
clf;
subplot(4,1,1);
set(gca,'LineWidth',2);
hold on;
axis( [0, tmax, 0, 1] );
tp=30;
H = (t>tp).*exp(-c*(t-tp));
plot( t, H, 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('H(t,10)');

% create a heat function m 
% allow two options, complex and simple
if( 1 )
    % complicated m built out of Gaussians
    t1 = 30;
    sigma1 = 6;
    m = exp(-0.5*((t-t1).^2)/(sigma1^2));
    t1 = 50;
    sigma1 = 10;
    m = m+2*exp(-0.5*((t-t1).^2)/(sigma1^2));
    t1 = 80;
    sigma1 = 14;
    m = m+0.5*exp(-0.5*((t-t1).^2)/(sigma1^2));
    t1 = 200;
    sigma1 = 5;
    m = m+exp(-0.5*((t-t1).^2)/(sigma1^2));
else
    % very simple m for test purposes
    m=zeros(M,1);
    m(floor(1*M/4))=1;
    m(floor(2*M/4))=0.5;
end

% plot heat function
subplot(4,1,2);
set(gca,'LineWidth',2);
hold on;
axis( [0, tmax, 0, 1.2*max(m)] );
plot( t, m, 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('m(t)');

% perform the green function integral to predict u
% use convolution function; faster than coding the integral
Ho = exp(-c*t);
u = Dt*conv(Ho,m);
u=u(1:M);
subplot(4,1,3);
set(gca,'LineWidth',2);
hold on;
axis( [0, tmax, 0, max(u)] );
plot( t, u, 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('u(t)');

% integrate u to get P
b=1;
P = Dt*b*cumsum(u);

% data is P with random noise
dtrue = P;
sigmad = 0.1;
dobs = dtrue+random('Normal',0,sigmad,N,1);
subplot(4,1,4);
set(gca,'LineWidth',2);
hold on;
axis( [0, tmax, 0, 1.1*max(dobs)] );
plot( t, dobs, 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('d(t)');

% inverse problem

% adjoint differential equation (-d/dt + c)u = h
% has green function G(t,t')=H(t'-t)exp(c(t-t'))

% plot green function for t'=10;
figure(3);
clf;
subplot(4,1,1);
set(gca,'LineWidth',2);
hold on;
axis( [0, tmax, 0, 1] );
tp=100;
H = Dt*(t<tp).*exp(c*(t-tp));
plot( t, H, 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('G(t,10)');

% data kernel Gd
N=M;
Gd = zeros(N,M);
for i = [1:N]
for j = [1:M]
    ti = i*Dt;
    tee = j*Dt;
    if( tee <= ti )
        Gd(i,j)=Dt*(-b/c)*(exp(-c*(ti-tee))-1);
    else
        Gd(i,j)=0;
    end
end
end


% plot a few rowa of the data kerner;
subplot(4,1,2);
set(gca,'LineWidth',2);
hold on;
i=floor(1*N/4);
axis( [0, tmax, 0, 1.1*max(Gd(i,:)) ] );
plot( t, Gd(i,:)', 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('gi(t)');
subplot(4,1,3);
set(gca,'LineWidth',2);
hold on;
i=floor(2*N/4);
axis( [0, tmax, 0, 1.1*max(Gd(i,:)) ] );
plot( t, Gd(i,:)', 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('gi(t)');
subplot(4,1,4);
set(gca,'LineWidth',2);
hold on;
i=floor(3*N/4);
axis( [0, tmax, 0, 1.1*max(Gd(i,:)) ] );
plot( t, Gd(i,:)', 'k-', 'LineWidth', 3 );
xlabel('t');
ylabel('gi(t)');

% solve with dampled least squares
e2 = 1.0e-1;
mest = (Gd'*Gd + e2*eye(M,M))\(Gd'*dobs);
figure(2);
subplot(4,1,2);
plot( t, mest, 'r--', 'LineWidth', 3 );
plot( t, m, 'k-', 'LineWidth', 2 );
gda_draw(Gd);







