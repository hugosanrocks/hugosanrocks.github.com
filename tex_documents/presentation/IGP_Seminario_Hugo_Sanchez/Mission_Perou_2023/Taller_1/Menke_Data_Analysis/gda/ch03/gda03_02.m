% gda03_02 
%
% comparison of norms

% z's
N=31;
zmin=0;
zmax=10;
Dz=(zmax-zmin)/(N-1);
z=zmin+Dz*[0:N-1]';

e = random('Uniform',-1,1,N,1);

e1 = abs(e);
E1 = sum(e1);
e2 = abs(e).^2;
E2 = sqrt(sum(e1));
e10 = abs(e).^10;
E10 = sum(e10)^0.1;
disp(sprintf('Errors E1 %f E2 %f E10 %f', E1, E2, E10));

% plot
figure(1);
clf;
pemin=-1;
pemax=1;

subplot(4,1,1);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pemin, pemax ]' );
% improvise bar chart
for i=[1:N-1]
    plot( [z(i), z(i), z(i+1), z(i+1) ]', [0, e(i), e(i), 0]', 'k-', 'LineWidth', 2 );
end
xlabel('z');
ylabel('e');
plot( [zmin, zmax ]', [0, 0]', 'k-', 'LineWidth', 2 );

subplot(4,1,2);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pemin, pemax ]' );
% improvise bar chart
for i=[1:N-1]
    plot( [z(i), z(i), z(i+1), z(i+1) ]', [0, e1(i), e1(i), 0]', 'k-', 'LineWidth', 2 );
end
xlabel('z');
ylabel('|e|');
plot( [zmin, zmax ]', [0, 0]', 'k-', 'LineWidth', 2 );

subplot(4,1,3);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pemin, pemax ]' );
% improvise bar chart
for i=[1:N-1]
    plot( [z(i), z(i), z(i+1), z(i+1) ]', [0, e2(i), e2(i), 0]', 'k-', 'LineWidth', 2 );
end
xlabel('z');
ylabel('|e|^2');
plot( [zmin, zmax ]', [0, 0]', 'k-', 'LineWidth', 2 );

subplot(4,1,4);
set(gca,'LineWidth',2);
hold on;
axis( [zmin, zmax, pemin, pemax ]' );
% improvise bar chart
for i=[1:N-1]
    plot( [z(i), z(i), z(i+1), z(i+1) ]', [0, e10(i), e10(i), 0]', 'k-', 'LineWidth', 2 );
end
xlabel('z');
ylabel('|e|^1^0');
plot( [zmin, zmax ]', [0, 0]', 'k-', 'LineWidth', 2 );

