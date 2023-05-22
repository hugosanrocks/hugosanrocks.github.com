% gda04_06
%

% ray figure

figure(1);
clf;
set(gca,'LineWidth',2);
hold on;

% box
xmin=0;
xmax=2;
ymin=0;
ymax=2;
plot( [xmin, xmax, xmax, xmin, xmin]', [ymin, ymin, ymax, ymax, ymin], 'k-', 'LineWidth', 2);

% circle
Nth=101;
R=0.9;
x0 = 1.0;
y0 = 1.0;
th = 2*pi*[0:Nth]'/(Nth-1);
x = x0+R*sin(th);
y = y0+R*cos(th);
axis( [xmin, xmax, ymin, ymax]' );
axis off;
axis equal;
plot( x, y, 'm-', 'LineWidth', 4 );

% rays
Nr=21;
x1 = random('Uniform', xmin, xmax, Nr, 1);
x2 = random('Uniform', xmin, xmax, Nr, 1);
for i=[1:Nr]
    plot( [x1(i), x2(i)]', [ymin, ymax]', 'b-', 'LineWidth', 2);
end
y1 = random('Uniform', ymin, ymax, Nr, 1);
y2 = random('Uniform', ymin, ymax, Nr, 1);
for i=[1:Nr]
    plot( [xmin, xmax]', [y1(i), y2(i)]', 'b-', 'LineWidth', 2);
end

% grid
Ng = 7;
xg = xmin + (xmax-xmin)*[0:Ng-1]'/(Ng-1)';
yg = ymin + (ymax-ymin)*[0:Ng-1]'/(Ng-1)';
for i=[2:Ng-1]
    plot( [xg(1), xg(Ng)], [yg(i), yg(i)]', 'k-', 'LineWidth', 2 );
end
for i=[2:Ng-1]
    plot( [xg(i), xg(i)]', [yg(1), yg(Ng)], 'k-', 'LineWidth', 2 );
end

figure(2);
clf;
set(gca,'LineWidth',2);
hold on;

% box
xmin=0;
xmax=2;
ymin=0;
ymax=2;
plot( [xmin, xmax, xmax, xmin, xmin]', [ymin, ymin, ymax, ymax, ymin], 'k-', 'LineWidth', 2);

% circle
Nth=101;
R=0.9;
x0 = 1.0;
y0 = 1.0;
th = 2*pi*[0:Nth]'/(Nth-1);
x = x0+R*sin(th);
y = y0+R*cos(th);
axis( [xmin, xmax, ymin, ymax]' );
axis off;
axis equal;
plot( x, y, 'm-', 'LineWidth', 4 );

% rays
for i=[1:Nr]
    plot( [x1(i), x2(i)]', [ymin, ymax]', 'b-', 'LineWidth', 2);
end
for i=[1:Nr]
    plot( [xmin, xmax]', [y1(i), y2(i)]', 'b-', 'LineWidth', 2);
end

% grid
Ng = 21;
xg = xmin + (xmax-xmin)*[0:Ng-1]'/(Ng-1)';
yg = ymin + (ymax-ymin)*[0:Ng-1]'/(Ng-1)';
for i=[2:Ng-1]
    plot( [xg(1), xg(Ng)], [yg(i), yg(i)]', 'k-', 'LineWidth', 2 );
end
for i=[2:Ng-1]
    plot( [xg(i), xg(i)]', [yg(1), yg(Ng)], 'k-', 'LineWidth', 2 );
end
