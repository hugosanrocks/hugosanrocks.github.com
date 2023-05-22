% test

M=20;
zmin = 0.0;
zmax=5;
Dz = (zmax-zmin)/(M-1);
z = zmin + Dz*[0:M-1]';

N=8;

if( 0 )
for i = [1:10000]
    
c = random('Uniform',0,40,N,1);

N = length(c);
G = exp( -(c * z') );

[U, S1, V] = svd(G);
sp = diag(S1);
d = prod(sp);

if( d > dsave )
    dsave=d;
    csave=c;
    Gsave=G;
    spsave=sp;
end

end
end

for i = [1:10000]
    
j=random('unid',N);
c(j) = random('Uniform',0,40);

N = length(c);
G = exp( -(c * z') );

[U, S1, V] = svd(G);
sp = diag(S1);
d = prod(sp);

if( d > dsave )
    dsave=d;
    csave=c;
    Gsave=G;
    spsave=sp;
end

end

    
dsave
sort(csave')