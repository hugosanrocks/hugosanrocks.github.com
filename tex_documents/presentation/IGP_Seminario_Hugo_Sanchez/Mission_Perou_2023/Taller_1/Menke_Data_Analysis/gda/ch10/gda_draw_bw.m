% eda_draw
% A function that automates the drawing of greyscale vectors and matrices
% for example, to draw Ax=y (where A is LxL) as
% eda_draw(A, 'caption A', x, 'caption x', '=', x, 'caption y');

function eda_draw(varargin)

figure(1);
clf;
N=40;
axis([0, 8*N, 0, 4*N]);
hold on;
axis equal;
axis ij;
set(gca,'XTick',[]); % turn off horizontal axis
set(gca,'YTick',[]); % turn off vertical axis
bw=0.9*(256-linspace(0,255,256)')/256;
colormap([bw,bw,bw]);

pixel = 0;
lastpixel = 0;
center = 0;

for i = 1 :size(varargin,2)
    temp = varargin{i};
    if(isa(temp, 'char') )
        if(~isempty(strfind(temp, 'caption')))
            temp2 = temp(8:length(temp));
            drawCaption(N,temp2,center);
        else
            lastpixel = pixel;
            pixel = drawText(N,temp,pixel);
            pixel=pixel+2*N/32;
            lastpixel=lastpixel+2*N/32;
        end
    else
        dims = size(temp);
        if (dims(2) == 1)
            lastpixel = pixel;
            pixel = drawVector(N,temp,pixel);
            center=(pixel + lastpixel)/2;
            pixel=pixel+8*N/32;
            lastpixel=lastpixel+8*N/32;
        else
            lastpixel = pixel;
            pixel = drawMatrix(N,temp,pixel);
            center=(pixel + lastpixel)/2;
            pixel=pixel+8*N/32;
            lastpixel=lastpixel+8*N/32;
        end
    end
end
return

function [pixel] = drawMatrix( N, A, pixel)
sf = 2;
range=max(max(A))-min(min(A));
if( range==0 )
    range=1;
end
w=N*sf;
imagesc( [pixel, pixel + w], [(7*N/8)*sf, (15*N/8-1)*sf], (A-min(min(A)))/range);
pixel = pixel + w;
return 

function [ pixel ] = drawVector( N, x, pixel )
sf = 2;
range=max(x)-min(x);
if( range==0 )
    range=1;
end
w=sf*1*N/32;
imagesc( [pixel, pixel + w], [(7*N/8)*sf,(15*N/8-1)*sf], (x-min(x))/range );
pixel = pixel + w;
return

function [ pixel ] = drawText( N, printme, pixel )
sf = 2;
pixel = pixel + 3;
text(pixel, sf*11*N/8, printme, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
pixel = pixel + sf*N*length(printme)/64;
return

function [  ] = drawCaption( N, printme, pixel )
sf = 2;
text(pixel, sf*31*N/16, printme, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
return

