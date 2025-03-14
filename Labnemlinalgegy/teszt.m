N0 = 10;
f = @(x)(cos(x) - x);
fd =@(x) (-sin(x) - 1);
x0 = pi/4;
a=0;
b=pi/4;

format long
disp('NewtonRaphson')
x = NewtonRaphson(f,fd,x0,eps,10,a,b);
disp(x);

x0 = 0.5;
x1 = pi/4;
disp('Hurmodszer')
x = Hurmodszer(f,x0,x1,eps,N0);
disp(x);
