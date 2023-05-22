% gda09_15
% gradient method

clear all;

N=40;
x = [0:N-1]'/N;
mt = [1.21, 1.54]';
w0=20;
ytrue = sin(w0*mt(1)*x) + mt(1)*mt(2);
sd=0.4;
y = ytrue + random('Normal',0,sd,N,1);

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;
plot(x,y,'ko','LineWidth',3);
plot(x,ytrue,'k-','LineWidth',3);
hold on;

M = 101;
dm = 0.02;
m1min=0;
m2min=0;
m1a = m1min+dm*[0:M-1]';
m2a = m2min+dm*[0:M-1]';
m1max = m1a(M);
m2max = m2a(M);

% rhis section a grid search for plotting purposes
E = zeros(M,M);
for j = [1:M]
for k = [1:M]
    yest = sin(w0*m1a(j)*x) + m1a(j)*m2a(k);
    E(j,k) = (y-yest)'*(y-yest);
end
end

figure(2);
clf;
imagesc( [m2min, m2max], [m1min, m1max], E);
hold on;
colorbar;
xlabel('m2');
ylabel('m1');

alpha = 0.05;
c1 = 0.0001;
c2 = 0.9;
tau = 0.5;

% trial solution
mgo=[1,1]';
plot( mgo(2), mgo(1), 'wo' );

Niter=500;
Ehis=zeros(Niter+1,1);
m1his=zeros(Niter+1,1);
m2his=zeros(Niter+1,1);

% error and its gradient at the trial solution
ygo = sin( w0*mgo(1)*x) + mgo(1)*mgo(2);
Ego = (ygo-y)'*(ygo-y);
dydmo = zeros(N,2);
dydmo(:,1) = w0 * x .* cos( w0 * mgo(1) * x ) + mgo(2);
dydmo(:,2) = mgo(2)*ones(N,1);
dEdmo = 2*dydmo'*(ygo-y);

for k = [1:Niter]
    

    v = -dEdmo / sqrt(dEdmo'*dEdmo);
    
    fprintf('%d %f %f %f\n', k, Ego, v(1), v(2) );
    
    if( k==1 )
        Ehis(1)=Ego;
        m1his(1)=mgo(1);
        m2his(1)=mgo(2);
    end
    
    % backstep
    for kk=[1:10]
        mg = mgo+alpha*v;
        yg = sin( w0*mg(1)*x) + mg(1)*mg(2);
        Eg = (yg-y)'*(yg-y);
        dydm = zeros(N,2);
        dydm(:,1) = w0 * x .* cos( w0 * mg(1) * x ) + mg(2);
        dydm(:,2) = mg(2)*ones(N,1);
        dEdm = 2*dydm'*(yg-y);
        if( (Eg<=(Ego + c1*alpha*v'*dEdmo)) )
            break;
        end
        alpha = tau*alpha;
    end

    % change in solution
    Dmg = sqrt( (mg-mgo)'*(mg-mgo) );
    
    % update
    mgo=mg;
    ygo = yg;
    Ego = Eg;
    dydmo = dydm;
    dEdmo = dEdm;
    Ehis(1+k)=Eg;
    m1his(1+k)=mg(1);
    m2his(1+k)=mg(2);
    plot( mg(2), mg(1), 'wo' );
    
    if( Dmg < 1.0e-6 )
        break;
    end
end

plot( mt(2), mt(1), 'go' );

figure(3);
clf;
subplot(3,1,1);
set( gca,'LineWidth', 2);
hold on;
plot( [0:k], Ehis(1:k+1), 'k-', 'LineWidth', 3 );
subplot(3,1,2);
set( gca,'LineWidth', 2);
hold on;
plot( [0:k], m1his(1:k+1), 'k-', 'LineWidth', 3 );
plot( [0, k], [mt(1), mt(1)], 'r:', 'LineWidth', 2);
subplot(3,1,3);
set( gca,'LineWidth', 2);
hold on;
plot( [0:k], m2his(1:k+1), 'k-', 'LineWidth', 3 );
plot( [0, k], [mt(2), mt(2)], 'r:', 'LineWidth',2 );


% evaluate prediction and plot it
figure(1);
ypre = sin(w0*mgo(1)*x) + mgo(1)*mgo(2);
plot(x,ypre,'r-','LineWidth',3);


    


