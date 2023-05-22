% first you must read data with a command like

% columns in file: lon lat depth mrr mtt mpp mrt mrp mtp iexp
%                  1   2   3     4   5   6   7   8   9   10
D = load('../data/moment.txt');
RR=D(:,4);
TT=D(:,5);
PP=D(:,6);
RT=D(:,7);
RP=D(:,8);
TP=D(:,9);
N=length(D(:,1));

% 
figure(77);
clf;
set(gca,'LineWidth',2);
hold on;
axis( [-1.1 1.1 -1.1 1.1] );

% note, theta, azimuthal angle, so that N is on top of plot, E on right
theta = (2*pi/360)*[0:360];
plot( sin(theta), cos(theta), 'k' );
theta = (pi/180.0)*0.0;
text( 1.05*sin(theta), 1.05*cos(theta), 'N' );
theta = (pi/180.0)*90.0;
text( 1.05*sin(theta), 1.05*cos(theta), 'E' );
if( plotgrid == 1 )
    phi = (pi/180.0)*[30, 60];
    theta = (2*pi/360)*[0:360];
    for p = phi
        plot( stereo(p)*sin(theta), stereo(p)*cos(theta), 'k--' );
    end
    theta = (pi/180.0)*linspace(0,330,12);
    r = linspace(0,1,2);
    for t = theta
        plot( r*sin(t), r*cos(t), 'k--' );
    end
end

if( plottensor==1 )
    M(1,1)=RR; M(2,2)=TT; M(3,3)=PP;
    M(1,2)=RT; M(2,1)=RT;
    M(1,3)=RP; M(3,1)=RP;
    M(2,3)=TP; M(3,2)=TP;
    theta = (2*pi/360)*[0:360];
    phi = (pi/(2*90))*[0:90];
    rad = stereo(phi);
    for ip = [1:length(phi)]
        p = phi(ip);
        r = rad(ip);
        for t = theta
            gamma = [cos(p), sin(t)*sin(p), cos(t)*sin(p) ];
            amp = gamma*M*gamma';
            r = stereo(p);
            if( amp<0 )
                plot( r.*sin(t), r.*cos(t), '.r' )
            end
        end
    end
end

NT = length(SeisData(1,:));
Ng = floor(NT/Ngroups);
Nstart= 1+Ng*(Nplot-1);
Nend=(Nplot*Ng);

j=1;
for i = [Nstart:Nend]
    dist = SACdata(i).evsta.dist/111.12;
    az = SACdata(i).evsta.az;
    if( (dist>=0.0) && (dist<=120.0) )
        delta(j)=dist;
        theta(j)=(pi/180.0)*az;
        j = j+1;
    end
end

slow = spline( sdistance, slowness, delta )/111.12;
% snells law p = sin(phi ) / v;
phi = asin( slow * v );
r = stereo(phi);

plot( r.*sin(theta), r.*cos(theta), '.b' )
    
end



