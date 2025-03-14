f = @(x) (sin(x)).^2;

a = 0;
b = pi;
V = pi * intgr2(f,a,b,0.0001,1000)